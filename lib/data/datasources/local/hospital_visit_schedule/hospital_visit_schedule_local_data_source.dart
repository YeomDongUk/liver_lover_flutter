// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/schedule_notification/schedule_notification_local_data_source.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';

abstract class HospitalVisitScheduleLocalDataSource {
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  });

  Future<List<HospitalVisitScheduleModel>> getHospitalVisitSchedules({
    required String userId,
    required bool visited,
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
    with ObjectBoxMixin, DaoMixin
    implements HospitalVisitScheduleLocalDataSource {
  HospitalVisitScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.scheduleNotificationLocalDataSource,
  }) : super(attachedDatabase);

  $HospitalVisitSchedulesTable get table =>
      attachedDatabase.hospitalVisitSchedules;

  // final LocalNotification localNotification;

  final ScheduleNotificationLocalDataSource scheduleNotificationLocalDataSource;

  @override
  Future<List<HospitalVisitScheduleModel>> getHospitalVisitSchedules({
    required String userId,
    required bool visited,
  }) =>
      (select(table)
            ..where((h) => h.userId.equals(userId))
            ..orderBy(
              [(h) => OrderingTerm.asc(h.reservedAt)],
            ))
          .get();

  @override
  Future<HospitalVisitScheduleModel> createHospitalVisitSchedule({
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final hospitalVisitScheduleModel = await into(table).insertReturning(
          companion.copyWith(
            userId: Value(userId),
          ),
        );
        final userPoint = await (select(userPoints)
              ..where((tbl) => tbl.userId.equals(userId)))
            .getSingle();
        await Future.wait([
          into(attachedDatabase.sF12SurveyHistories).insertReturning(
            SF12SurveyHistoriesCompanion.insert(
              hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
            ),
          ),
          into(attachedDatabase.medicationAdherenceSurveyHistories)
              .insertReturning(
            MedicationAdherenceSurveyHistoriesCompanion.insert(
              hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
            ),
          ),
          (update(userPoints)..where((tbl) => tbl.userId.equals(userId))).write(
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
          ),
          into(attachedDatabase.pointHistories).insert(
            PointHistoriesCompanion.insert(
              userId: userId,
              forginId: hospitalVisitScheduleModel.id,
              event: PointHistoryEvent.hospitalVisitScheduleCreate,
              point: 30,
            ),
          ),
        ]);

        if (hospitalVisitScheduleModel.push) {
          final reservedAt = hospitalVisitScheduleModel.reservedAt;

          await Future.wait([
            if (hospitalVisitScheduleModel.beforePush)
              scheduleNotificationLocalDataSource.createNotification(
                scheduleNotificationModel: ScheduleNotificationModel(
                  userId: userId,
                  type: 2,
                  scheduleIds: [
                    hospitalVisitScheduleModel.id,
                  ],
                  beforePush: true,
                  reservedAt: reservedAt.add(const Duration(days: -1)),
                ),
              ),
            if (hospitalVisitScheduleModel.afterPush)
              scheduleNotificationLocalDataSource.createNotification(
                scheduleNotificationModel: ScheduleNotificationModel(
                  userId: userId,
                  type: 2,
                  scheduleIds: [
                    hospitalVisitScheduleModel.id,
                  ],
                  beforePush: true,
                  reservedAt: reservedAt.add(const Duration(hours: -2)),
                ),
              ),
          ]);
        }

        _initNoti(userId);

        return hospitalVisitScheduleModel;
      });

  @override
  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      transaction(() async {
        final schedule = await (select(table)
              ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId)))
            .getSingleOrNull();

        if (schedule == null) return 0;

        final latestSchedule = await (select(table)
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
        }

        final count = (delete(table)
              ..where((h) => h.id.equals(id) & h.userId.equals(userId)))
            .go();

        await scheduleNotificationLocalDataSource.deleteNotificationById(
          id: id,
          type: 2,
          userId: userId,
        );

        return count;
      });

  @override
  Future<HospitalVisitScheduleModel> updateHospitalVisitSchedule({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        await (update(table)
              ..where((h) => h.id.equals(id))
              ..where((h) => h.userId.equals(userId)))
            .write(
          companion.copyWith(updatedAt: Value(DateTime.now())),
        );

        if (companion.visitedAt.value != null) {
          await scheduleNotificationLocalDataSource.deleteNotificationById(
            id: id,
            type: 2,
            userId: userId,
          );
        }

        return (select(table)..where((h) => h.id.equals(id))).getSingle();
      });

  @override
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      (select(table)
            ..where((h) => h.id.equals(id))
            ..where((h) => h.userId.equals(userId)))
          .getSingle();

  @override
  Future<HospitalVisitScheduleModel> toggleHospitalVisitSchedulePush({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final push = companion.push.value;
        await (update(table)
              ..where((h) => h.id.equals(id) & h.userId.equals(userId)))
            .write(
          companion.copyWith(
            afterPush: Value(push),
            beforePush: Value(push),
            updatedAt: Value(DateTime.now()),
          ),
        );

        final hospitalVisitSchedule =
            await (select(table)..where((h) => h.id.equals(id))).getSingle();

        if (push) {
          await Future.wait([
            if (hospitalVisitSchedule.beforePush)
              scheduleNotificationLocalDataSource.createNotification(
                scheduleNotificationModel: ScheduleNotificationModel(
                  userId: userId,
                  type: 2,
                  scheduleIds: [
                    hospitalVisitSchedule.id,
                  ],
                  beforePush: true,
                  reservedAt: hospitalVisitSchedule.reservedAt
                      .add(const Duration(days: -1)),
                ),
              ),
            if (hospitalVisitSchedule.afterPush)
              scheduleNotificationLocalDataSource.createNotification(
                scheduleNotificationModel: ScheduleNotificationModel(
                  userId: userId,
                  type: 2,
                  scheduleIds: [
                    hospitalVisitSchedule.id,
                  ],
                  beforePush: false,
                  reservedAt: hospitalVisitSchedule.reservedAt
                      .add(const Duration(hours: -2)),
                ),
              ),
          ]);
        } else {
          await scheduleNotificationLocalDataSource.deleteNotificationById(
            id: id,
            type: 2,
            userId: userId,
          );
        }

        _initNoti(userId);

        return hospitalVisitSchedule;
      });

  Future<void> _initNoti(String userId) =>
      KiwiContainer().resolve<LocalNotification>().createNotifications(
            scheduleNotificationModels:
                scheduleNotificationLocalDataSource.getValidNotifications(
              userId: userId,
            ),
          );
}
