// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/database/table/notification_schedule/notification_schedule_table.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';

abstract class HospitalVisitScheduleLocalDataSource {
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  });

  Stream<List<HospitalVisitScheduleModel>> getHospitalVisitSchedulesStream({
    required String userId,
  });

  Future<HospitalVisitScheduleModel> createHospitalVisitSchedule({
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<HospitalVisitScheduleModel> updateHospitalVisitSchedule({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<HospitalVisitScheduleModel> toggleHospitalVisitSchedulePush({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  });
}

class HospitalVisitScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements HospitalVisitScheduleLocalDataSource {
  HospitalVisitScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.notificationScheduleLocalDataSource,
  }) : super(attachedDatabase);

  final NotificationScheduleLocalDataSource notificationScheduleLocalDataSource;

  @override
  Stream<List<HospitalVisitScheduleModel>> getHospitalVisitSchedulesStream({
    required String userId,
  }) =>
      (select(hospitalVisitSchedules)
            ..where((h) => h.userId.equals(userId))
            ..orderBy(
              [(h) => OrderingTerm.asc(h.reservedAt)],
            ))
          .watch();

  @override
  Future<HospitalVisitScheduleModel> createHospitalVisitSchedule({
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final hospitalVisitScheduleModel =
            await into(hospitalVisitSchedules).insertReturning(
          companion.copyWith(
            userId: Value(userId),
          ),
        );

        /// ?????? ????????? ??????
        final userPoint = await (select(userPoints)
              ..where((tbl) => tbl.userId.equals(userId)))
            .getSingle();

        /// SF12 ????????? ??????
        await into(attachedDatabase.sF12SurveyHistories).insertReturning(
          SF12SurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        /// MADH ????????? ??????
        await into(attachedDatabase.medicationAdherenceSurveyHistories)
            .insertReturning(
          MedicationAdherenceSurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        ///
        await (update(userPoints)..where((tbl) => tbl.userId.equals(userId)))
            .write(
          UserPointsCompanion(
            point: Value(
              hospitalVisitScheduleModel.type !=
                      HospitalVisitScheduleType.outpatient
                  ? userPoint.point + 30
                  : 30,
            ),
            hospitalVisitScheduleId: hospitalVisitScheduleModel.type !=
                    HospitalVisitScheduleType.outpatient
                ? const Value.absent()
                : Value(hospitalVisitScheduleModel.id),
            updatedAt: Value(DateTime.now()),
          ),
        );

        /// ???????????? ????????? ?????? ????????? ?????? ???????????? ?????? ??????
        if (hospitalVisitScheduleModel.type ==
            HospitalVisitScheduleType.outpatient) {
          await (delete(pointHistories)
                ..where((tbl) => tbl.userId.equals(userId)))
              .go();
        }

        /// ????????? ???????????? ??????
        await into(pointHistories).insert(
          PointHistoriesCompanion.insert(
            userId: userId,
            forginId: hospitalVisitScheduleModel.id,
            event: PointHistoryEvent.hospitalVisitScheduleCreate,
            point: 30,
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );

        /// ?????? ?????? ?????? ????????? ??????
        await notificationScheduleLocalDataSource
            .createHospitalVisitScheduleNotification(
          hospitalVisitScheduleModel: hospitalVisitScheduleModel,
        );

        return hospitalVisitScheduleModel;
      });

  @override
  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      transaction(() async {
        final schedule = await (select(hospitalVisitSchedules)
              ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId)))
            .getSingleOrNull();

        if (schedule == null) return 0;

        final latestSchedule = await (select(hospitalVisitSchedules)
              ..where(
                (tbl) =>
                    tbl.type
                        .equals(HospitalVisitScheduleType.outpatient.index) &
                    tbl.userId.equals(userId),
              )
              ..orderBy([(u) => OrderingTerm.desc(u.reservedAt)])
              ..limit(1))
            .getSingleOrNull();

        if (latestSchedule?.id == schedule.id) {
          await (update(attachedDatabase.userPoints)
                ..where((tbl) => tbl.userId.equals(userId)))
              .write(
            UserPointsCompanion(
              point: const Value(0),
              hospitalVisitScheduleId: const Value(null),
              updatedAt: Value(DateTime.now()),
            ),
          );

          await (delete(pointHistories)
                ..where((tbl) => tbl.userId.equals(userId)))
              .go();
        }

        final count = await (delete(hospitalVisitSchedules)
              ..where((h) => h.id.equals(id) & h.userId.equals(userId)))
            .go();

        await notificationScheduleLocalDataSource
            .deleteHospitalVisitScheduleNotification(
          pushType: PushType.onTime,
          hospitalVisitScheduleModel: schedule,
        );

        if (schedule.beforePush) {
          final sameReservedAtSchedules = await (select(hospitalVisitSchedules)
                ..where(
                  (tbl) =>
                      tbl.userId.equals(userId) &
                      tbl.reservedAt.equals(schedule.reservedAt) &
                      tbl.beforePush.equals(true),
                ))
              .get();

          if (sameReservedAtSchedules.isEmpty) {
            await notificationScheduleLocalDataSource
                .deleteHospitalVisitScheduleNotification(
              pushType: PushType.before,
              hospitalVisitScheduleModel: schedule,
            );
          }
        }

        if (schedule.afterPush) {
          final sameReservedAtSchedules = await (select(hospitalVisitSchedules)
                ..where(
                  (tbl) =>
                      tbl.userId.equals(userId) &
                      tbl.reservedAt.equals(schedule.reservedAt) &
                      tbl.afterPush.equals(true),
                ))
              .get();

          if (sameReservedAtSchedules.isEmpty) {
            await notificationScheduleLocalDataSource
                .deleteHospitalVisitScheduleNotification(
              pushType: PushType.after,
              hospitalVisitScheduleModel: schedule,
            );
          }
        }

        return count;
      });

  @override
  Future<HospitalVisitScheduleModel> updateHospitalVisitSchedule({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final schedule = await (select(hospitalVisitSchedules)
              ..where(
                (h) => h.id.equals(id) & h.userId.equals(userId),
              ))
            .getSingle();

        final hospitalVisitScheduleModels =
            await (update(hospitalVisitSchedules)
                  ..where(
                    (h) => h.id.equals(id) & h.userId.equals(userId),
                  ))
                .writeReturning(
          companion.copyWith(updatedAt: Value(DateTime.now())),
        );

        final hospitalVisitScheduleModel = hospitalVisitScheduleModels.first;

        /// ?????? ?????? ??????
        await notificationScheduleLocalDataSource
            .deleteHospitalVisitScheduleNotification(
          pushType: PushType.onTime,
          hospitalVisitScheduleModel: hospitalVisitScheduleModel,
        );

        if (hospitalVisitScheduleModel.beforePush) {
          final sameReservedAtSchedules = await (select(hospitalVisitSchedules)
                ..where(
                  (tbl) =>
                      tbl.userId.equals(userId) &
                      tbl.reservedAt.equals(schedule.reservedAt) &
                      tbl.beforePush.equals(true),
                ))
              .get();

          if (sameReservedAtSchedules.isEmpty) {
            await notificationScheduleLocalDataSource
                .deleteHospitalVisitScheduleNotification(
              pushType: PushType.before,
              hospitalVisitScheduleModel: schedule,
            );
          }
        }

        if (schedule.afterPush) {
          final sameReservedAtSchedules = await (select(hospitalVisitSchedules)
                ..where(
                  (tbl) =>
                      tbl.userId.equals(userId) &
                      tbl.reservedAt.equals(schedule.reservedAt) &
                      tbl.afterPush.equals(true),
                ))
              .get();

          if (sameReservedAtSchedules.isEmpty) {
            await notificationScheduleLocalDataSource
                .deleteHospitalVisitScheduleNotification(
              pushType: PushType.after,
              hospitalVisitScheduleModel: schedule,
            );
          }
        }

        await (update(userPoints)..where((tbl) => tbl.userId.equals(userId)))
            .write(
          UserPointsCompanion(
            point: const Value(30),
            hospitalVisitScheduleId: Value(hospitalVisitScheduleModel.id),
            updatedAt: Value(DateTime.now()),
          ),
        );

        await (delete(pointHistories)
              ..where((tbl) => tbl.userId.equals(userId)))
            .go();

        /// ????????? ???????????? ??????
        await into(pointHistories).insert(
          PointHistoriesCompanion.insert(
            userId: userId,
            forginId: hospitalVisitScheduleModel.id,
            event: PointHistoryEvent.hospitalVisitScheduleCreate,
            point: 30,
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );

        /// ?????? ?????? ?????? ????????? ??????
        await notificationScheduleLocalDataSource
            .createHospitalVisitScheduleNotification(
          hospitalVisitScheduleModel: hospitalVisitScheduleModel,
        );

        return (select(hospitalVisitSchedules)..where((h) => h.id.equals(id)))
            .getSingle();
      });

  @override
  Future<HospitalVisitScheduleModel> toggleHospitalVisitSchedulePush({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final hospitalVisitScheduleModels =
            await (update(hospitalVisitSchedules)
                  ..where((h) => h.id.equals(id) & h.userId.equals(userId)))
                .writeReturning(companion);

        if (hospitalVisitScheduleModels.isEmpty) {
          throw Exception();
        }

        final hospitalVisitScheduleModel = hospitalVisitScheduleModels.first;

        if ((!companion.beforePush.value && !companion.afterPush.value) ||
            hospitalVisitScheduleModel.visitedAt != null) {
          await notificationScheduleLocalDataSource
              .deleteHospitalVisitScheduleNotification(
            pushType: PushType.before,
            hospitalVisitScheduleModel: hospitalVisitScheduleModel,
          );

          await notificationScheduleLocalDataSource
              .deleteHospitalVisitScheduleNotification(
            pushType: PushType.after,
            hospitalVisitScheduleModel: hospitalVisitScheduleModel,
          );
        } else {
          /// ?????? ?????? ?????? ????????? ??????
          await notificationScheduleLocalDataSource
              .createHospitalVisitScheduleNotification(
            hospitalVisitScheduleModel: hospitalVisitScheduleModel,
          );
        }

        return hospitalVisitScheduleModel;
      });

  @override
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      (select(hospitalVisitSchedules)
            ..where((h) => h.id.equals(id) & h.userId.equals(userId)))
          .getSingle();
}
