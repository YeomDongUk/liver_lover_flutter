// Package imports:
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/notification_schedule/notification_schedule_table.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class NotificationScheduleLocalDataSource {
  Future<void> createHospitalVisitScheduleNotification({
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  });

  Future<void> createMedicationScheduleNotifications({
    required String userId,
    required PushType pushType,
    required Set<DateTime> reservedAts,
  });

  Future<void> deleteHospitalVisitScheduleNotification({
    required PushType pushType,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  });

  Future<void> deleteNotificationScheduleByReservedAt({
    required String userId,
    required int type,
    required PushType pushType,
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
  Future<void> deleteNotificationScheduleByReservedAt({
    required String userId,
    required int type,
    required PushType pushType,
    required DateTime reservedAt,
  }) async {
    final notificationScheduleModel = await (select(notificationSchedules)
          ..where(
            (tbl) =>
                tbl.userId.equals(userId) &
                tbl.type.equals(type) &
                tbl.pushType.equals(pushType.index) &
                tbl.reservedAt.equals(reservedAt),
          ))
        .getSingleOrNull();

    if (notificationScheduleModel != null) {
      await (delete(notificationSchedules)
            ..where((tbl) => tbl.id.equals(notificationScheduleModel.id)))
          .go();

      await localNotification.cancel(
        notificationScheduleId: notificationScheduleModel.id,
      );
    }
  }

  @override
  Future<void> deleteNotificationById({
    required String id,
    required int type,
    required String userId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> createHospitalVisitScheduleNotification({
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    await _createHospitalVisitScheduleNotification(
      pushType: PushType.onTime,
      hospitalVisitScheduleModel: hospitalVisitScheduleModel,
    );

    if (hospitalVisitScheduleModel.beforePush) {
      await _createHospitalVisitScheduleNotification(
        pushType: PushType.before,
        hospitalVisitScheduleModel: hospitalVisitScheduleModel,
      );
    }

    if (hospitalVisitScheduleModel.afterPush) {
      await _createHospitalVisitScheduleNotification(
        pushType: PushType.after,
        hospitalVisitScheduleModel: hospitalVisitScheduleModel,
      );
    }
  }

  Future<void> _createHospitalVisitScheduleNotification({
    required PushType pushType,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    final duration = pushType == PushType.onTime
        ? Duration.zero
        : pushType == PushType.before
            ? const Duration(days: -1)
            : const Duration(hours: -2);

    final reservedAt = hospitalVisitScheduleModel.reservedAt.add(duration);

    Logger().d(reservedAt);
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
          pushType: pushType,
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
    required PushType pushType,
    required HospitalVisitScheduleModel hospitalVisitScheduleModel,
  }) async {
    final duration = pushType == PushType.onTime
        ? Duration.zero
        : pushType == PushType.before
            ? const Duration(days: -1)
            : const Duration(hours: -2);

    final reservedAt = hospitalVisitScheduleModel.reservedAt.add(duration);

    final notificaitonSchedule = await (select(notificationSchedules)
          ..where(
            (tbl) =>
                tbl.userId.equals(hospitalVisitScheduleModel.userId) &
                tbl.type.equals(1) &
                tbl.pushType.equals(pushType.index) &
                tbl.reservedAt.equals(reservedAt),
          ))
        .getSingleOrNull();

    if (notificaitonSchedule != null) {
      await (delete(notificationSchedules)
            ..where((tbl) => tbl.id.equals(notificaitonSchedule.id)))
          .go();

      await localNotification.cancel(
        notificationScheduleId: notificaitonSchedule.id,
      );
    }
  }

  @override
  Future<void> createMedicationScheduleNotifications({
    required String userId,
    required PushType pushType,
    required Set<DateTime> reservedAts,
  }) async {
    final notificationScheduleModels = await (select(notificationSchedules)
          ..where(
            (tbl) =>
                tbl.userId.equals(userId) &
                tbl.pushType.equals(pushType.index) &
                tbl.reservedAt.isIn(reservedAts),
          ))
        .get();

    final notInReservedAts = reservedAts.where(
      (reservedAt) => notificationScheduleModels
          .where(
            (notificationScheduleModel) =>
                notificationScheduleModel.reservedAt == reservedAt,
          )
          .isEmpty,
    );

    final newNotificationScheduleModels = await Future.wait(
      notInReservedAts.map(
        (reservedAt) => into(notificationSchedules).insertReturning(
          NotificationSchedulesCompanion.insert(
            userId: userId,
            type: 0,
            pushType: pushType,
            reservedAt: reservedAt,
          ),
        ),
      ),
    );

    if (newNotificationScheduleModels.isNotEmpty) {
      for (final notificationScheduleModel in newNotificationScheduleModels) {
        await localNotification.createNotification(
          notificationScheduleModel: notificationScheduleModel,
        );
      }
    }
  }
}
