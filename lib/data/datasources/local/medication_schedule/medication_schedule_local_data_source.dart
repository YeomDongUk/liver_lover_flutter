// Package imports:
import 'package:cuid/cuid.dart';
import 'package:drift/drift.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/notification_schedule/notification_schedule_table.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_group_model.dart';
import 'package:yak/domain/entities/medication_schedule/medication_adherenece_percent.dart';

abstract class MedicationScheduleLocalDataSource {
  Future<void> updateMedicationSchedulesPush({
    required String userId,
    required DateTime reservedAt,
    required bool push,
  });

  Stream<MedicationAdherencePercent> getMedicationAdherenecePercent({
    required String userId,
  });

  Stream<List<MedicationScheduleGroupModel>> getDailyMedicationScheduleGroups({
    required String userId,
    required DateTime dateTime,
  });
  Stream<List<MedicationScheduleGroupModel>> getMedicationScheduleGroups({
    required String userId,
    required DateTime start,
    required DateTime end,
  });

  Future<void> medicationAll({
    required String userId,
    required DateTime reservedAt,
  });

  Future<void> medicate({
    required String userId,
    required String scheduleId,
  });

  Stream<MedicationScheduleGroupModel> getMedicationScheduleGroup({
    required String userId,
    required DateTime reservedAt,
  });

  Future<DateTime?> getLastMedicationSchedule({required String userId});
}

class MedicationScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements MedicationScheduleLocalDataSource {
  MedicationScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.notificationScheduleLocalDataSource,
  }) : super(attachedDatabase);

  final NotificationScheduleLocalDataSource notificationScheduleLocalDataSource;

  @override
  Stream<MedicationScheduleGroupModel> getMedicationScheduleGroup({
    required String userId,
    required DateTime reservedAt,
  }) {
    return (select(medicationSchedules).join(
      [
        leftOuterJoin(
          medicationInformations,
          medicationInformations.id
              .equalsExp(medicationSchedules.medicationInformationId),
          useColumns: true,
        ),
        leftOuterJoin(
          pills,
          pills.id.equalsExp(medicationInformations.pillId),
          useColumns: true,
        ),
        leftOuterJoin(
          prescriptions,
          prescriptions.id.equalsExp(
            medicationInformations.prescriptionId,
          ),
          useColumns: false,
        ),
      ],
    )..where(
            prescriptions.userId.equals(userId) &
                medicationSchedules.reservedAt.equals(reservedAt),
          ))
        .watch()
        .map((typedResults) {
      final medicationScheduleModels =
          typedResults.map((e) => e.readTable(medicationSchedules)).toList();

      final medicationInformationModels =
          typedResults.map((e) => e.readTable(medicationInformations)).toList();

      final pillModels = typedResults.map((e) => e.readTable(pills)).toList();

      return MedicationScheduleGroupModel(
        reservedAt: reservedAt,
        medicationScheduleModels: medicationScheduleModels,
        medicationInformationModels: medicationInformationModels,
        pillModels: pillModels,
      );
    });
  }

  @override
  Stream<List<MedicationScheduleGroupModel>> getDailyMedicationScheduleGroups({
    required String userId,
    required DateTime dateTime,
  }) {
    final start = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final end = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);

    return _getMedicationScheduleGroups(
      userId: userId,
      start: start,
      end: end,
    );
  }

  @override
  Stream<List<MedicationScheduleGroupModel>> getMedicationScheduleGroups({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) =>
      _getMedicationScheduleGroups(
        userId: userId,
        start: start,
        end: end,
      );

  Stream<List<MedicationScheduleGroupModel>> _getMedicationScheduleGroups({
    required String userId,
    required DateTime start,
    required DateTime end,
  }) {
    return (select(medicationSchedules).join(
      [
        leftOuterJoin(
          medicationInformations,
          medicationInformations.id
              .equalsExp(medicationSchedules.medicationInformationId),
          useColumns: true,
        ),
        leftOuterJoin(
          pills,
          pills.id.equalsExp(medicationInformations.pillId),
          useColumns: true,
        ),
        leftOuterJoin(
          prescriptions,
          prescriptions.id.equalsExp(
            medicationInformations.prescriptionId,
          ),
          useColumns: false,
        ),
      ],
    )..where(
            prescriptions.userId.equals(userId) &
                medicationSchedules.reservedAt.isBiggerThanValue(start) &
                medicationSchedules.reservedAt.isSmallerOrEqualValue(end),
          ))
        .watch()
        .map((typedResults) {
      final medicationScheduleModels =
          typedResults.map((e) => e.readTable(medicationSchedules)).toList();

      final medicationInformationModels =
          typedResults.map((e) => e.readTable(medicationInformations)).toList();

      final pillModels = typedResults.map((e) => e.readTable(pills)).toList();

      final reservedAtSet =
          medicationScheduleModels.map((e) => e.reservedAt).toSet();

      return reservedAtSet.map(
        (reservedAt) {
          final subMedicationScheduleModels = medicationScheduleModels
              .where((element) => element.reservedAt == reservedAt)
              .toList();
          final subMedicationInformationModels = subMedicationScheduleModels
              .map(
                (e) => medicationInformationModels.firstWhere(
                  (element) => element.id == e.medicationInformationId,
                ),
              )
              .toList();
          return MedicationScheduleGroupModel(
            reservedAt: reservedAt,
            medicationScheduleModels: subMedicationScheduleModels,
            medicationInformationModels: subMedicationInformationModels,
            pillModels: subMedicationInformationModels
                .map(
                  (medicationInformationModel) => pillModels.firstWhere(
                    (pillModel) =>
                        pillModel.id == medicationInformationModel.pillId,
                  ),
                )
                .toList(),
          );
        },
      ).toList();
    });
  }

  @override
  Future<void> medicate({
    required String userId,
    required String scheduleId,
  }) =>
      transaction(() async {
        final medicationScheduleModels = await (update(medicationSchedules)
              ..where((tbl) => tbl.id.equals(scheduleId)))
            .writeReturning(
          MedicationSchedulesCompanion(
            medicatedAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );

        final medicationScheduleModel = medicationScheduleModels.firstOrNull;

        if (medicationScheduleModel == null) return;

        final joinResult = await (select(medicationInformations).join(
          [
            leftOuterJoin(
              medicationSchedules,
              medicationSchedules.medicationInformationId
                  .equalsExp(medicationInformations.id),
              useColumns: false,
            ),
          ],
        )..where(medicationSchedules.id.equals(scheduleId)))
            .getSingleOrNull();

        if (joinResult == null) return;

        // final takeCycle =
        // joinResult.readTable(medicationInformations).takeCycle;

        final typedResults = await (select(medicationSchedules).join(
          [
            leftOuterJoin(
              medicationInformations,
              medicationInformations.id
                  .equalsExp(medicationSchedules.medicationInformationId),
              useColumns: false,
            ),
            leftOuterJoin(
              prescriptions,
              prescriptions.id.equalsExp(
                medicationInformations.prescriptionId,
              ),
              useColumns: false,
            ),
          ],
        )..where(
                medicationSchedules.reservedAt
                        .equals(medicationScheduleModel.reservedAt) &
                    prescriptions.userId.equals(userId),
              ))
            .get();

        final remainMedicationScheduleModels = typedResults
            .map((typedResult) => typedResult.readTable(medicationSchedules))
            .toList();

        if (remainMedicationScheduleModels.isEmpty) {
          await into(pointHistories).insert(
            PointHistoriesCompanion.insert(
              event: PointHistoryEvent.medicationComplete,
              point: 1,
              userId: userId,
              forginId: medicationScheduleModel.id,
            ),
          );

          /// 유저 포인트 조회
          final userPoint = await (select(userPoints)
                ..where((tbl) => tbl.userId.equals(userId)))
              .getSingle();

          await update(userPoints).write(
            UserPointsCompanion(
              point: Value(userPoint.point + 1),
              updatedAt: Value(DateTime.now()),
            ),
          );

          await Future.wait([
            notificationScheduleLocalDataSource
                .deleteNotificationScheduleByReservedAt(
              pushType: PushType.before,
              reservedAt: medicationScheduleModel.reservedAt,
              type: 0,
              userId: userId,
            ),
            notificationScheduleLocalDataSource
                .deleteNotificationScheduleByReservedAt(
              pushType: PushType.onTime,
              reservedAt: medicationScheduleModel.reservedAt,
              type: 0,
              userId: userId,
            ),
            notificationScheduleLocalDataSource
                .deleteNotificationScheduleByReservedAt(
              pushType: PushType.after,
              reservedAt: medicationScheduleModel.reservedAt,
              type: 0,
              userId: userId,
            ),
          ]);
        }
      });

  @override
  Future<void> medicationAll({
    required String userId,
    required DateTime reservedAt,
  }) async {
    return transaction(() async {
      final typedResults = await (select(medicationSchedules).join([
        leftOuterJoin(
          medicationInformations,
          medicationInformations.id
              .equalsExp(medicationSchedules.medicationInformationId),
          useColumns: true,
        ),
        leftOuterJoin(
          prescriptions,
          prescriptions.id.equalsExp(
            medicationInformations.prescriptionId,
          ),
          useColumns: false,
        ),
      ])
            ..where(
              medicationSchedules.medicatedAt.isNull() &
                  medicationSchedules.reservedAt.equals(reservedAt) &
                  prescriptions.userId.equals(userId),
            ))
          .get();

      await (update(medicationSchedules)
            ..where(
              (tbl) => tbl.id.isIn(
                typedResults
                    .map((e) => e.readTable(medicationSchedules).id)
                    .toList(),
              ),
            ))
          .write(
        MedicationSchedulesCompanion(
          medicatedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // final medicationInformationModels = typedResults
      //     .map((typedResult) => typedResult.readTable(medicationInformations))
      //     .toList();

      // final addedPoint = medicationInformationModels.fold<int>(
      //   0,
      //   (previousValue, element) => previousValue + element.takeCycle,
      // );

      await into(pointHistories).insert(
        PointHistoriesCompanion.insert(
          event: PointHistoryEvent.medicationComplete,
          point: 1,
          userId: userId,
          forginId: newCuid(),
        ),
      );

      /// 유저 포인트 조회
      final userPoint = await (select(userPoints)
            ..where((tbl) => tbl.userId.equals(userId)))
          .getSingle();

      await update(userPoints).write(
        UserPointsCompanion(
          point: Value(userPoint.point + 1),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await Future.wait([
        notificationScheduleLocalDataSource
            .deleteNotificationScheduleByReservedAt(
          pushType: PushType.before,
          reservedAt: reservedAt,
          type: 0,
          userId: userId,
        ),
        notificationScheduleLocalDataSource
            .deleteNotificationScheduleByReservedAt(
          pushType: PushType.onTime,
          reservedAt: reservedAt,
          type: 0,
          userId: userId,
        ),
        notificationScheduleLocalDataSource
            .deleteNotificationScheduleByReservedAt(
          pushType: PushType.after,
          reservedAt: reservedAt,
          type: 0,
          userId: userId,
        ),
      ]);
    });
  }

  @override
  Future<void> updateMedicationSchedulesPush({
    required String userId,
    required DateTime reservedAt,
    required bool push,
  }) =>
      transaction(
        () async {
          await (update(medicationSchedules)
                ..where((tbl) => tbl.reservedAt.equals(reservedAt)))
              .write(
            MedicationSchedulesCompanion(
              afterPush: Value(push),
              beforePush: Value(push),
              updatedAt: Value(DateTime.now()),
            ),
          );

          final beforeReservedAt = reservedAt.add(const Duration(minutes: -30));
          final afterReservedAt = reservedAt.add(const Duration(minutes: 30));

          if (push) {
            await Future.wait([
              notificationScheduleLocalDataSource
                  .createMedicationScheduleNotifications(
                userId: userId,
                pushType: PushType.before,
                reservedAts: {
                  beforeReservedAt,
                },
              ),
              notificationScheduleLocalDataSource
                  .createMedicationScheduleNotifications(
                userId: userId,
                pushType: PushType.after,
                reservedAts: {
                  afterReservedAt,
                },
              ),
            ]);
          } else {
            await Future.wait(
              [
                notificationScheduleLocalDataSource
                    .deleteNotificationScheduleByReservedAt(
                  userId: userId,
                  type: 0,
                  pushType: PushType.before,
                  reservedAt: beforeReservedAt,
                ),
                notificationScheduleLocalDataSource
                    .deleteNotificationScheduleByReservedAt(
                  userId: userId,
                  type: 0,
                  pushType: PushType.after,
                  reservedAt: afterReservedAt,
                ),
              ],
            );
          }
        },
      );

  @override
  Stream<MedicationAdherencePercent> getMedicationAdherenecePercent({
    required String userId,
  }) {
    return customSelect(
      'select count(*) as "allCount", (select count(*) from medication_schedules ms2 where ms2.medicated_at is not null) as "targetCount" from medication_schedules',
      readsFrom: {
        medicationSchedules,
      },
    ).watch().map((queryRows) {
      final map = queryRows.firstOrNull?.data;
      // print(queryRows.map((e) => e.data));
      final allCount = (map?['allCount'] as int?) ?? 0;
      final targetCount = (map?['targetCount'] as int?) ?? 0;

      return MedicationAdherencePercent(
        allCount: allCount,
        medicatedCount: targetCount,
        percent: allCount == 0 ? 0 : targetCount / allCount,
      );
    });
  }

  @override
  Future<DateTime?> getLastMedicationSchedule({required String userId}) async {
    final typedResults = await ((select(medicationSchedules).join([
      leftOuterJoin(
        medicationInformations,
        medicationInformations.id
            .equalsExp(medicationSchedules.medicationInformationId),
        useColumns: false,
      ),
      leftOuterJoin(
        prescriptions,
        prescriptions.id.equalsExp(
          medicationInformations.prescriptionId,
        ),
        useColumns: false,
      ),
    ])
          ..orderBy([
            OrderingTerm.desc(medicationSchedules.reservedAt),
          ])
          ..where(prescriptions.userId.equals(userId)))
          ..limit(1))
        .get();

    return typedResults.firstOrNull?.readTable(medicationSchedules).reservedAt;
  }
}
