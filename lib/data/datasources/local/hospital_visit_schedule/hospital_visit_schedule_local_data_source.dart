// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';

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

  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  });
}

class HospitalVisitScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements HospitalVisitScheduleLocalDataSource {
  HospitalVisitScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.localNotification,
  }) : super(attachedDatabase);

  $HospitalVisitSchedulesTable get table =>
      attachedDatabase.hospitalVisitSchedules;

  final LocalNotification localNotification;

  @override
  Future<List<HospitalVisitScheduleModel>> getHospitalVisitSchedules({
    required String userId,
    required bool visited,
  }) =>
      (select(table)
            ..where((h) => h.visitedAt.isNull())
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

        await into(attachedDatabase.sF12SurveyHistories).insertReturning(
          SF12SurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        await into(attachedDatabase.medicationAdherenceSurveyHistories)
            .insertReturning(
          MedicationAdherenceSurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        if (hospitalVisitScheduleModel.push) {
          final hospitalVisitNotifications = await Future.wait([
            /// 하루 전 로컬 노티 생성
            if (hospitalVisitScheduleModel.beforePush)
              into(attachedDatabase.notifications).insertReturning(
                NotificationsCompanion.insert(
                  userId: userId,
                  scheduleId: hospitalVisitScheduleModel.id,
                  status: hospitalVisitScheduleModel.push
                      ? NotificationStatus.on
                      : NotificationStatus.off,
                  type: NotificationType.hospitalVisit,
                  subType: NotificationSubType.beforeDay,
                  reservedAt: hospitalVisitScheduleModel.reservedAt.add(
                    const Duration(days: -1),
                  ),
                ),
              ),

            /// 두시간 전 로컬 노티 생성
            if (hospitalVisitScheduleModel.afterPush)
              into(attachedDatabase.notifications).insertReturning(
                NotificationsCompanion.insert(
                  userId: userId,
                  scheduleId: hospitalVisitScheduleModel.id,
                  status: hospitalVisitScheduleModel.push
                      ? NotificationStatus.on
                      : NotificationStatus.off,
                  type: NotificationType.hospitalVisit,
                  subType: NotificationSubType.beforeTwoHours,
                  reservedAt: hospitalVisitScheduleModel.reservedAt.add(
                    const Duration(hours: -2),
                  ),
                ),
              ),
          ]);

          if (localNotification is LocalNotificationImpl) {
            await Future.wait(
              hospitalVisitNotifications
                  .map(localNotification.createHospitalVisitNotification)
                  .toList(),
            );
          }
        }

        return hospitalVisitScheduleModel;
      });

  @override
  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  }) {
    return transaction(() async {
      return (delete(table)
            ..where((h) => h.id.equals(id))
            ..where((h) => h.userId.equals(userId)))
          .go();
    });
  }

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
            .write(companion);

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
}
