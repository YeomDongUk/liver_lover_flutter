// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class NotificationScheduleLocalDataSource {
  List<NotificationScheduleModel> getValidNotifications({
    required String userId,
  });

  List<NotificationScheduleModel> getNotifications({
    required DateTime reservedAt,
  });

  Future<NotificationScheduleModel> createNotification({
    required NotificationScheduleModel notificationScheduleModel,
  });

  Future<void> createHospitalVisitScheduleNotification({
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  });

  Future<void> deleteHospitalVisitScheduleNotification({
    required bool isBeforePush,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  });

  NotificationScheduleModel updateNotification({
    required NotificationScheduleModel notificationScheduleModel,
  });

  Future<void> deleteNotification({
    required String userId,
    required int type,
    required DateTime reservedAt,
  });

  Future<void> deleteNotificationById({
    required String id,
    required int type,
    required String userId,
  });
}

class NotificationScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements NotificationScheduleLocalDataSource {
  NotificationScheduleLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
    required this.localNotification,
  }) : super(attachedDatabase);

  final LocalNotification localNotification;

  @override
  Future<NotificationScheduleModel> createNotification({
    required NotificationScheduleModel notificationScheduleModel,
  }) {
    // TODO: implement createNotification
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNotification({
    required String userId,
    required int type,
    required DateTime reservedAt,
  }) {
    // TODO: implement deleteNotification
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNotificationById({
    required String id,
    required int type,
    required String userId,
  }) {
    // TODO: implement deleteNotificationById
    throw UnimplementedError();
  }

  @override
  List<NotificationScheduleModel> getNotifications({
    required DateTime reservedAt,
  }) {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  List<NotificationScheduleModel> getValidNotifications({
    required String userId,
  }) {
    // TODO: implement getValidNotifications
    throw UnimplementedError();
  }

  @override
  NotificationScheduleModel updateNotification({
    required NotificationScheduleModel notificationScheduleModel,
  }) {
    // TODO: implement updateNotification
    throw UnimplementedError();
  }

  @override
  Future<void> createHospitalVisitScheduleNotification({
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    if (hospitalVisitScheduleModel.beforePush) {
      await _createHospitalVisitScheduleNotification(
        isBeforePush: true,
        hospitalVisitScheduleModel: hospitalVisitScheduleModel,
      );
    }

    if (hospitalVisitScheduleModel.afterPush) {
      await _createHospitalVisitScheduleNotification(
        isBeforePush: false,
        hospitalVisitScheduleModel: hospitalVisitScheduleModel,
      );
    }
  }

  Future<void> _createHospitalVisitScheduleNotification({
    required bool isBeforePush,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    final duration =
        isBeforePush ? const Duration(days: -1) : const Duration(hours: -2);

    final reservedAt = hospitalVisitScheduleModel.reservedAt.add(duration);

    final notificaitonSchedule = await (select(notificationSchedules)
          ..where(
            (tbl) =>
                tbl.userId.equals(hospitalVisitScheduleModel.userId) &
                tbl.type.equals(1) &
                tbl.reservedAt.equals(reservedAt),
          ))
        .getSingleOrNull();

    if (notificaitonSchedule == null) {
      final notificationScheduleModel =
          await into(notificationSchedules).insertReturning(
        NotificationSchedulesCompanion.insert(
          userId: hospitalVisitScheduleModel.userId,
          isBeforePush: isBeforePush,
          type: 1,
          reservedAt: reservedAt,
        ),
      );

      await localNotification.createNotification(
        notificationScheduleModel: notificationScheduleModel,
      );
    }
  }

  @override
  Future<void> deleteHospitalVisitScheduleNotification({
    required bool isBeforePush,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    final duration =
        isBeforePush ? const Duration(days: -1) : const Duration(hours: -2);

    final reservedAt = hospitalVisitScheduleModel.reservedAt.add(duration);

    final notificaitonSchedule = await (select(notificationSchedules)
          ..where(
            (tbl) =>
                tbl.userId.equals(hospitalVisitScheduleModel.userId) &
                tbl.type.equals(1) &
                tbl.isBeforePush.equals(isBeforePush) &
                tbl.reservedAt.equals(reservedAt),
          ))
        .getSingleOrNull();

    if (notificaitonSchedule != null) {
      await (delete(notificationSchedules)
            ..where((tbl) => tbl.id.equals(notificaitonSchedule.id)))
          .go();

      await localNotification.cancel(
        scheduleNotificationId: notificaitonSchedule.id,
      );
    }
  }
}
