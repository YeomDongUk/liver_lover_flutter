// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/notification_schedule/notification_schedule_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';

// Project imports:

abstract class PrescriptionLocalDataSource {
  Stream<List<Prescription>> getPrescriptions({required String userId});

  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  });

  Future<void> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  });

  Future<void> endPrescription({
    required String userId,
    required String prescriptionId,
  });
}

class PrescriptionLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements PrescriptionLocalDataSource {
  PrescriptionLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
  }) : super(attachedDatabase);

  NotificationScheduleLocalDataSource get notificationScheduleLocalDataSource =>
      KiwiContainer().resolve<NotificationScheduleLocalDataSource>();

  @override
  Future<PrescriptionModel> createPrescription({
    required String userId,
    required PrescriptionCreateInput createInput,
  }) =>
      transaction(() async {
        /// 처방전 생성
        final prescriptionModel = await into(prescriptions).insertReturning(
          PrescriptionsCompanion.insert(
            userId: userId,
            doctorName: createInput.doctorName,
            prescriptedAt: createInput.prescriptedAt,
            medicationStartAt: createInput.medicationStartAt,
            duration: createInput.duration,
          ),
        );

        ///  복약 정보 리스트 생성
        final medicationInformationModels = await Future.wait(
          createInput.medicationInformationCreateInputs.map(
            (e) => into(medicationInformations).insertReturning(
              MedicationInformationsCompanion.insert(
                prescriptionId: prescriptionModel.id,
                pillId: e.pillId,
                takeCount: '${e.takeCount}',
                takeCycle: e.takeCycle,
                afterPush: Value(e.afterPush),
                beforePush: Value(e.beforePush),
                timeOne: Value(e.timeOne),
                timeTwo: Value(e.timeTwo),
                timeThree: Value(e.timeThree),
              ),
            ),
          ),
        );

        final medicationSchedulesCompanions = medicationInformationModels
            .map(
              (medicationInformationModel) => List.generate(
                prescriptionModel.duration,
                (addedDay) {
                  final isAllowedCreation =
                      addedDay % medicationInformationModel.takeCycle == 0;

                  return !isAllowedCreation
                      ? null
                      : <MedicationSchedulesCompanion>[
                          if (medicationInformationModel.timeOne != null)
                            _generateMedicationSchedulesCompanion(
                              addedDay: addedDay,
                              medicatedStartAt:
                                  prescriptionModel.medicationStartAt,
                              medicationInformationModel:
                                  medicationInformationModel,
                              time: medicationInformationModel.timeOne!,
                            ),
                          if (medicationInformationModel.timeTwo != null)
                            _generateMedicationSchedulesCompanion(
                              addedDay: addedDay,
                              medicatedStartAt:
                                  prescriptionModel.medicationStartAt,
                              medicationInformationModel:
                                  medicationInformationModel,
                              time: medicationInformationModel.timeTwo!,
                            ),
                          if (medicationInformationModel.timeThree != null)
                            _generateMedicationSchedulesCompanion(
                              addedDay: addedDay,
                              medicatedStartAt:
                                  prescriptionModel.medicationStartAt,
                              medicationInformationModel:
                                  medicationInformationModel,
                              time: medicationInformationModel.timeThree!,
                            ),
                        ];
                },
              )
                  .where((element) => element != null)
                  .cast<List<MedicationSchedulesCompanion>>()
                  .toList(),
            )
            .expand((element) => element)
            .expand((element) => element)
            .where(
              (element) => element.reservedAt.value.isAfter(
                DateTime.now(),
              ),
            )
            .toList();

        await batch(
          (batch) => batch.insertAll(
            medicationSchedules,
            medicationSchedulesCompanions,
          ),
        );

        final beforeReservedAtSet = <DateTime>{};

        final afterReservedAtSet = <DateTime>{};

        for (final medicationSchedulesCompanion
            in medicationSchedulesCompanions) {
          final now = DateTime.now();
          if (medicationSchedulesCompanion.beforePush.value) {
            final reservedAt =
                medicationSchedulesCompanion.reservedAt.value.add(
              const Duration(minutes: -30),
            );

            if (reservedAt.isAfter(now)) {
              beforeReservedAtSet.add(reservedAt);
            }
          }

          if (medicationSchedulesCompanion.afterPush.value) {
            final reservedAt =
                medicationSchedulesCompanion.reservedAt.value.add(
              const Duration(minutes: 30),
            );

            if (reservedAt.isAfter(now)) {
              afterReservedAtSet.add(reservedAt);
            }
          }
        }

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.onTime,
          reservedAts: medicationSchedulesCompanions
              .map((e) => e.reservedAt.value)
              .toSet(),
        );

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.before,
          reservedAts: beforeReservedAtSet,
        );

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.after,
          reservedAts: afterReservedAtSet,
        );

        return prescriptionModel;
      });

  MedicationSchedulesCompanion _generateMedicationSchedulesCompanion({
    required int time,
    required int addedDay,
    required DateTime medicatedStartAt,
    required MedicationInformationModel medicationInformationModel,
  }) =>
      MedicationSchedulesCompanion.insert(
        beforePush: Value(medicationInformationModel.beforePush),
        afterPush: Value(medicationInformationModel.afterPush),
        medicationInformationId: medicationInformationModel.id,
        reservedAt: medicatedStartAt.add(
          Duration(
            days: addedDay,
            hours: time,
          ),
        ),
      );

  @override
  Stream<List<Prescription>> getPrescriptions({
    required String userId,
  }) {
    return select(prescriptions)
        .join([
          leftOuterJoin(
            medicationInformations,
            medicationInformations.prescriptionId.equalsExp(prescriptions.id),
          ),
          leftOuterJoin(
            pills,
            pills.id.equalsExp(medicationInformations.pillId),
          ),
        ])
        .watch()
        .map((typedResults) {
          final pillModels =
              typedResults.map((e) => e.readTable(pills)).toList();
          final medicationInformationModels = typedResults
              .map((e) => e.readTable(medicationInformations))
              .toList();
          final prescriptionModels =
              typedResults.map((e) => e.readTable(prescriptions)).toList();

          return prescriptionModels.map(
            (e) {
              final subMedicationInformationModels = medicationInformationModels
                  .where((element) => element.prescriptionId == e.id)
                  .toList();

              return Prescription.fromJson(
                e.toJson()
                  ..['medicationInformations'] = subMedicationInformationModels
                      .map(
                        (e) => MedicationInformation.fromJson(
                          e.toJson()
                            ..['pill'] = Pill.fromJson(
                              pillModels
                                  .firstWhere(
                                    (element) => element.id == e.pillId,
                                  )
                                  .toJson(),
                            ),
                        ),
                      )
                      .toList(),
              );
            },
          ).toList();
        });
  }

  @override
  Future<void> updatePrescription({
    required String userId,
    required PrescriptionUpdateInput updateInput,
  }) =>
      transaction(() async {
        /// 처방전 조회
        final prescriptionModel = (await (update(prescriptions)
                  ..where(
                    (tbl) =>
                        tbl.userId.equals(userId) &
                        tbl.id.equals(updateInput.prescriptionId),
                  ))
                .writeReturning(
          PrescriptionsCompanion(
            updatedAt: Value(DateTime.now()),
          ),
        ))
            .first;

        /// 수정된 처방전 정보
        final medicationInformationModels = (await Future.wait(
          updateInput.medicationInformationUpdateInputs
              .map(
                (e) => (update(medicationInformations)
                      ..where(
                        (tbl) =>
                            tbl.prescriptionId
                                .equals(updateInput.prescriptionId) &
                            tbl.pillId.equals(e.pillId),
                      ))
                    .writeReturning(
                  MedicationInformationsCompanion(
                    afterPush: Value(e.afterPush),
                    beforePush: Value(e.beforePush),
                    timeOne: Value(e.timeOne),
                    timeTwo: Value(e.timeTwo),
                    timeThree: Value(e.timeThree),
                    updatedAt: Value(DateTime.now()),
                  ),
                ),
              )
              .toList(),
        ))
            .expand((element) => element)
            .toList();

        /// 복용일정
        final medicationScheduleModels = await (select(medicationSchedules)
              ..where(
                (tbl) =>
                    tbl.medicationInformationId
                        .isIn(medicationInformationModels.map((e) => e.id)) &
                    tbl.reservedAt.isBiggerThanValue(DateTime.now()),
              ))
            .get();

        /// 삭제될 복용일정
        final deletedMedicationScheduleModels = medicationScheduleModels
            .where((e) => e.medicatedAt == null)
            .toList();

        /// 삭제될 복용일정 날들
        final deletedReservedAts = deletedMedicationScheduleModels
            .map((e) => e.reservedAt)
            .toSet()
            .toList();

        /// 완료된 복용일정
        final doneMedicationScheduleModels = medicationScheduleModels
            .where((e) => e.medicatedAt != null)
            .toList();

        /// 삭제할 필요성이 있는 복용일정 삭제
        await (delete(medicationSchedules)
              ..where(
                (tbl) => tbl.id
                    .isIn(deletedMedicationScheduleModels.map((e) => e.id)),
              ))
            .go();

        final remainMedicationScheduleModels =
            await (select(medicationSchedules)
                  ..where(
                    (tbl) =>
                        tbl.medicationInformationId.isIn(
                          medicationInformationModels.map((e) => e.id),
                        ) &
                        tbl.reservedAt.isIn(deletedReservedAts),
                  ))
                .get();

        final remainReservedAts = remainMedicationScheduleModels
            .map((e) => e.reservedAt)
            .toSet()
            .toList();

        // deletedReservedAts
        /// 복용일정 삭제에 따른 노티 일정 삭제
        await Future.wait(
          (deletedReservedAts..removeWhere(remainReservedAts.contains))
              .map(
                (e) => [
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.onTime,
                    reservedAt: e,
                  ),
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.before,
                    reservedAt: e.add(const Duration(minutes: -30)),
                  ),
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.after,
                    reservedAt: e.add(const Duration(minutes: 30)),
                  ),
                ],
              )
              .expand((element) => element),
        );

        final medicationSchedulesCompanions = medicationInformationModels
            .map((medicationInformationModel) {
              return List.generate(
                prescriptionModel.duration,
                (addedDay) {
                  final reservedAt = prescriptionModel.medicationStartAt.add(
                    Duration(days: addedDay),
                  );

                  final isAllowedCreation =
                      addedDay % medicationInformationModel.takeCycle == 0;

                  final dateOne = medicationInformationModel.timeOne == null
                      ? null
                      : reservedAt.add(
                          Duration(
                            hours: medicationInformationModel.timeOne!,
                          ),
                        );

                  final dateTwo = medicationInformationModel.timeTwo == null
                      ? null
                      : reservedAt.add(
                          Duration(
                            hours: medicationInformationModel.timeTwo!,
                          ),
                        );

                  final dateThree = medicationInformationModel.timeThree == null
                      ? null
                      : reservedAt.add(
                          Duration(
                            hours: medicationInformationModel.timeThree!,
                          ),
                        );

                  final list = <MedicationSchedulesCompanion>[
                    if (medicationInformationModel.timeOne != null &&
                        dateOne!.isAfter(DateTime.now()) &&
                        doneMedicationScheduleModels.firstWhereOrNull(
                              (doneMedicationScheduleModel) =>
                                  doneMedicationScheduleModel
                                          .medicationInformationId ==
                                      medicationInformationModel.id &&
                                  doneMedicationScheduleModel.reservedAt ==
                                      dateOne,
                            ) ==
                            null)
                      _generateMedicationSchedulesCompanion(
                        addedDay: addedDay,
                        medicatedStartAt: prescriptionModel.medicationStartAt,
                        medicationInformationModel: medicationInformationModel,
                        time: medicationInformationModel.timeOne!,
                      ),
                    if (medicationInformationModel.timeTwo != null &&
                        dateTwo!.isAfter(DateTime.now()) &&
                        doneMedicationScheduleModels.firstWhereOrNull(
                              (doneMedicationScheduleModel) =>
                                  doneMedicationScheduleModel
                                          .medicationInformationId ==
                                      medicationInformationModel.id &&
                                  doneMedicationScheduleModel.reservedAt ==
                                      dateTwo,
                            ) ==
                            null)
                      _generateMedicationSchedulesCompanion(
                        addedDay: addedDay,
                        medicatedStartAt: prescriptionModel.medicationStartAt,
                        medicationInformationModel: medicationInformationModel,
                        time: medicationInformationModel.timeTwo!,
                      ),
                    if (medicationInformationModel.timeThree != null &&
                        dateThree!.isAfter(DateTime.now()) &&
                        doneMedicationScheduleModels.firstWhereOrNull(
                              (doneMedicationScheduleModel) =>
                                  doneMedicationScheduleModel
                                          .medicationInformationId ==
                                      medicationInformationModel.id &&
                                  doneMedicationScheduleModel.reservedAt ==
                                      dateThree,
                            ) ==
                            null)
                      _generateMedicationSchedulesCompanion(
                        addedDay: addedDay,
                        medicatedStartAt: prescriptionModel.medicationStartAt,
                        medicationInformationModel: medicationInformationModel,
                        time: medicationInformationModel.timeThree!,
                      ),
                  ];

                  return !isAllowedCreation ? null : list;
                },
              )
                  .where((element) => element != null)
                  .cast<List<MedicationSchedulesCompanion>>()
                  .toList();
            })
            .expand((element) => element)
            .expand((element) => element)
            .toList();

        await batch(
          (batch) => batch.insertAllOnConflictUpdate(
            medicationSchedules,
            medicationSchedulesCompanions,
          ),
        );

        final beforeReservedAtSet = <DateTime>{};

        final afterReservedAtSet = <DateTime>{};

        for (final medicationSchedulesCompanion
            in medicationSchedulesCompanions) {
          final now = DateTime.now();
          if (medicationSchedulesCompanion.beforePush.value) {
            final reservedAt =
                medicationSchedulesCompanion.reservedAt.value.add(
              const Duration(minutes: -30),
            );

            if (reservedAt.isAfter(now)) {
              beforeReservedAtSet.add(reservedAt);
            }
          }

          if (medicationSchedulesCompanion.afterPush.value) {
            final reservedAt =
                medicationSchedulesCompanion.reservedAt.value.add(
              const Duration(minutes: 30),
            );

            if (reservedAt.isAfter(now)) {
              afterReservedAtSet.add(reservedAt);
            }
          }
        }

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.onTime,
          reservedAts: medicationSchedulesCompanions
              .map((e) => e.reservedAt.value)
              .toSet(),
        );

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.before,
          reservedAts: beforeReservedAtSet,
        );

        await notificationScheduleLocalDataSource
            .createMedicationScheduleNotifications(
          userId: userId,
          pushType: PushType.after,
          reservedAts: afterReservedAtSet,
        );
      });

  @override
  Future<void> endPrescription({
    required String userId,
    required String prescriptionId,
  }) =>
      transaction(() async {
        await (update(prescriptions)
              ..where(
                (tbl) =>
                    tbl.userId.equals(userId) & tbl.id.equals(prescriptionId),
              ))
            .write(
          PrescriptionsCompanion(
            deletedAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );

        /// 처방전 ID가 같고 예약 복약시간이 지금보다 이후인 조인 결과.
        final typedResults = await (select(medicationSchedules).join([
          leftOuterJoin(
            medicationInformations,
            medicationInformations.id
                .equalsExp(medicationSchedules.medicationInformationId),
            useColumns: false,
          ),
          leftOuterJoin(
            prescriptions,
            prescriptions.id.equalsExp(medicationInformations.prescriptionId),
            useColumns: false,
          ),
        ])
              ..where(
                prescriptions.id.equals(prescriptionId) &
                    prescriptions.userId.equals(userId) &
                    medicationSchedules.reservedAt
                        .isBiggerThanValue(DateTime.now()),
              ))
            .get();

        /// 처방전 ID가 같고 예약 복약시간이 지금보다 이후인 복약일정.
        final medicationScheduleModels =
            typedResults.map((e) => e.readTable(medicationSchedules)).toList();

        await (delete(medicationSchedules)
              ..where(
                (tbl) => tbl.id.isIn(medicationScheduleModels.map((e) => e.id)),
              ))
            .go();

        final remainedTypedResults = await (select(medicationSchedules).join([
          leftOuterJoin(
            medicationInformations,
            medicationInformations.id
                .equalsExp(medicationSchedules.medicationInformationId),
            useColumns: false,
          ),
          leftOuterJoin(
            prescriptions,
            prescriptions.id.equalsExp(medicationInformations.prescriptionId),
            useColumns: false,
          ),
        ])
              ..where(
                prescriptions.userId.equals(userId) &
                    medicationSchedules.reservedAt.isIn(
                      medicationScheduleModels.map((e) => e.reservedAt),
                    ),
              )
              ..groupBy([
                medicationSchedules.reservedAt,
              ]))
            .get();

        final remainedReservedAt = remainedTypedResults
            .map((e) => e.read(medicationSchedules.reservedAt))
            .toSet();

        final deletedReservedAt =
            medicationScheduleModels.map((e) => e.reservedAt).toList()
              ..removeWhere(
                remainedReservedAt.contains,
              );

        await Future.wait(
          deletedReservedAt
              .map(
                (e) => [
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.onTime,
                    reservedAt: e,
                  ),
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.before,
                    reservedAt: e.add(const Duration(minutes: -30)),
                  ),
                  notificationScheduleLocalDataSource
                      .deleteNotificationScheduleByReservedAt(
                    userId: userId,
                    type: 0,
                    pushType: PushType.after,
                    reservedAt: e.add(const Duration(minutes: 30)),
                  ),
                ],
              )
              .expand((element) => element),
        );
      });
}
