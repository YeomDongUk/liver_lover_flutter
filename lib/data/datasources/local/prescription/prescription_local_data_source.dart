import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_notification/medication_notification_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/models/prescription/prescription_overview_model.dart';
import 'package:yak/data/models/prescription/prescription_write_response.dart';

abstract class PrescriptionLocalDataSource {
  Future<PrescriptionModel> getPrescription(String id);

  Future<PrescriptionWriteResponse> createPrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanions,
  });

  Future<List<PrescriptionOverviewModel>> getPrescriptionOverviews(
    String userId,
  );

  Future<int> deletePrescription({
    required String id,
    required String userId,
  });

  Future<PrescriptionWriteResponse> updatePrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanions,
  });
}

class PrescriptionLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements PrescriptionLocalDataSource {
  PrescriptionLocalDataSourceImpl(
    super.attachedDatabase,
    this.medicationInformationLocalDataSource,
    this.medicationScheduleLocalDataSource,
    this.medicationNotificationLocalDataSource,
  );

  $PrescriptionsTable get table => attachedDatabase.prescriptions;

  final MedicationInformationLocalDataSource
      medicationInformationLocalDataSource;

  final MedicationScheduleLocalDataSource medicationScheduleLocalDataSource;
  final MedicationNotificationLocalDataSource
      medicationNotificationLocalDataSource;

  @override
  Future<PrescriptionModel> getPrescription(String id) =>
      (select(table)..where((p) => p.id.equals(id))).getSingle();

  @override
  Future<PrescriptionWriteResponse> createPrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanions,
  }) =>
      transaction(() async {
        /// 처방전 생성
        final prescriptionModel =
            await into(table).insertReturning(prescriptionsCompanion);

        /// 처방전 약품 정보 생성
        final medicationInformationModels =
            await medicationInformationLocalDataSource
                .createMedicationInformations(
          medicationInformationsCompanions.map(
            (model) => MedicationInformationsCompanion.insert(
              prescriptionId: prescriptionModel.id,
              pillId: model.pillId.value,
              dayDuration: model.dayDuration.value,
              takeCount: model.takeCount.value,
              moring: model.moring,
              afternoon: model.afternoon,
              evening: model.evening,
              night: model.night,
            ),
          ),
        );

        final medicationStartAt = prescriptionModel.medicationStartAt;
        final medicationEndAt = prescriptionModel.medicationEndAt;
        final days = medicationStartAt.difference(medicationEndAt).inDays.abs();

        /// 복용 스케줄 목록 정리
        final medicationSchedulesCompanions = List.generate(days, (addedDay) {
          final medicationInformationModelTargets = medicationInformationModels
              .where(
                (medicationInformationModel) =>
                    medicationInformationModel.dayDuration >= addedDay,
              )
              .toList();

          final medicationSchedulesCompanions = [
            (medicationScheduleLocalDataSource
                    as MedicationScheduleLocalDataSourceImpl)
                .convertMedicationSchedulesCompanions(
              medicationInformationModels: medicationInformationModelTargets,
              type: MedicationScheduleType.moring,
              prescriptionId: prescriptionModel.id,
              medicationDate: medicationStartAt.add(Duration(days: addedDay)),
            ),
            (medicationScheduleLocalDataSource
                    as MedicationScheduleLocalDataSourceImpl)
                .convertMedicationSchedulesCompanions(
              medicationInformationModels: medicationInformationModelTargets,
              type: MedicationScheduleType.afternoon,
              prescriptionId: prescriptionModel.id,
              medicationDate: medicationStartAt.add(Duration(days: addedDay)),
            ),
            (medicationScheduleLocalDataSource
                    as MedicationScheduleLocalDataSourceImpl)
                .convertMedicationSchedulesCompanions(
              medicationInformationModels: medicationInformationModelTargets,
              type: MedicationScheduleType.evening,
              prescriptionId: prescriptionModel.id,
              medicationDate: medicationStartAt.add(Duration(days: addedDay)),
            ),
            (medicationScheduleLocalDataSource
                    as MedicationScheduleLocalDataSourceImpl)
                .convertMedicationSchedulesCompanions(
              medicationInformationModels: medicationInformationModelTargets,
              type: MedicationScheduleType.night,
              prescriptionId: prescriptionModel.id,
              medicationDate: medicationStartAt.add(Duration(days: addedDay)),
            )
          ].expand((element) => element).toList();

          return medicationSchedulesCompanions;
        }).expand((e) => e).toSet();

        /// 복용 스케줄 생성
        final medicationScheduleModels = await medicationScheduleLocalDataSource
            .createMedicationSchedules(medicationSchedulesCompanions);

        await Future.wait([
          medicationNotificationLocalDataSource.createMedicationNotifications(
            medicationScheduleModels: medicationScheduleModels,
            type: NotificationType.before,
            status: prescriptionModel.beforePush
                ? NotificationStatus.on
                : NotificationStatus.off,
          ),
          medicationNotificationLocalDataSource.createMedicationNotifications(
            medicationScheduleModels: medicationScheduleModels,
            type: NotificationType.after,
            status: prescriptionModel.afterPush
                ? NotificationStatus.on
                : NotificationStatus.off,
          )
        ]);

        return PrescriptionWriteResponse(
          prescriptionModel: prescriptionModel,
          medicationInformationModels: medicationInformationModels,
          medicationScheduleModels: medicationScheduleModels,
        );
      });

  @override
  Future<int> deletePrescription({
    required String id,
    required String userId,
  }) =>
      (delete(table)
            ..where((p) => p.id.equals(id))
            ..where((p) => p.userId.equals(userId)))
          .go();

  @override
  Future<List<PrescriptionOverviewModel>> getPrescriptionOverviews(
    String userId,
  ) async {
    final queryResult = await (select(table).join([
      leftOuterJoin(
        attachedDatabase.medicationInformations,
        attachedDatabase.medicationInformations.prescriptionId
            .equalsExp(table.id),
      ),
    ])
          ..orderBy([
            OrderingTerm.desc(table.prescribedAt),
          ])
          ..where(table.userId.equals(userId)))
        .get();

    final groupByList =
        queryResult.groupListsBy((element) => element.readTable(table));

    final keys = groupByList.keys;

    return keys
        .map(
          (e) => PrescriptionOverviewModel(
            id: e.id,
            userId: e.userId,
            doctorName: e.doctorName,
            prescribedAt: e.prescribedAt,
            push: e.push,
            medicationStartAt: e.medicationStartAt,
            medicationEndAt: e.medicationEndAt,
            beforePush: e.beforePush,
            afterPush: e.afterPush,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
            medicationInformations: groupByList[e]
                    ?.map(
                      (e) => e.readTableOrNull(
                        attachedDatabase.medicationInformations,
                      ),
                    )
                    .where((e) => e != null)
                    .cast<MedicationInformationModel>()
                    .toList() ??
                [],
          ),
        )
        .toList();
  }

  @override
  Future<PrescriptionWriteResponse> updatePrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanions,
  }) =>
      transaction(() async {
        /// 처방전 수정
        await (update(table)
              ..where((p) => p.id.equals(prescriptionsCompanion.id.value)))
            .write(prescriptionsCompanion);

        /// 처방전 약품 정보 수정
        await Future.wait(
          medicationInformationsCompanions.map(
            (e) => (update(attachedDatabase.medicationInformations)
                  ..where(
                    (m) => m.id.equals(e.id.value),
                  ))
                .write(
              e,
            ),
          ),
        );

        /// 처방전 조회
        final prescriptionModel = await (select(table)
              ..where((p) => p.id.equals(prescriptionsCompanion.id.value)))
            .getSingle();

        /// 처방전 약품 정보 조회
        final medicationInformationModels =
            await (select(attachedDatabase.medicationInformations)
                  ..where(
                    (m) => m.prescriptionId
                        .equals(prescriptionsCompanion.id.value),
                  ))
                .get();

// medicationInformationModels.
        // update(attachedDatabase.medicationSchedules);

        // final querytResult =
        //     await (select(attachedDatabase.medicationSchedules).join(
        //   [
        //     leftOuterJoin(
        //       attachedDatabase.medicationAlarms,
        //       attachedDatabase.medicationAlarms.medicationScheduleId
        //           .equalsExp(attachedDatabase.medicationSchedules.id),
        //     )
        //   ],
        // )..where(
        //             attachedDatabase.medicationSchedules.prescriptionId
        //                 .equals(prescriptionModel.id),
        //           ))
        //         .get();

        // 기존의 스케쥴을 변경한다?

        // querytResult
        //     .groupListsBy(
        //       (element) =>
        //           element.readTable(attachedDatabase.medicationSchedules),
        //     )
        //     .entries
        //     .map((e) {
        //   medicationInformationModels
        //       .where((element) => element.moring != null)
        //       .map(
        //         (e) => e.moring!,
        //       )
        //       .toList();
        // });

        return PrescriptionWriteResponse(
          prescriptionModel: prescriptionModel,
          medicationInformationModels: medicationInformationModels,
          medicationScheduleModels: const [],
        );
      });
}
