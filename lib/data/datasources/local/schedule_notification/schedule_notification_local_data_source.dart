import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:collection/collection.dart';
import 'package:yak/core/object_box/objectbox.g.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';

abstract class ScheduleNotificationLocalDataSource {
  List<ScheduleNotificationModel> getValidNotifications({
    required String userId,
  });

  List<ScheduleNotificationModel> getNotifications({
    required DateTime reservedAt,
  });

  Future<ScheduleNotificationModel> createNotification({
    required ScheduleNotificationModel scheduleNotificationModel,
  });

  ScheduleNotificationModel updateNotification({
    required ScheduleNotificationModel scheduleNotificationModel,
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

class ScheduleNotificationLocalDataSourceImpl
    with ObjectBoxMixin
    implements ScheduleNotificationLocalDataSource {
  ScheduleNotificationLocalDataSourceImpl({
    required this.localNotification,
  });

  final LocalNotification localNotification;
  // StreamSubscription? _medicationScheduleBoxSubscription;

  @override
  List<ScheduleNotificationModel> getValidNotifications({
    required String userId,
  }) {
    final queryBuilder = scheduleNotificationBox.query(
      ScheduleNotificationModel_.userId.equals(userId).and(
            ScheduleNotificationModel_.reservedAt.greaterThan(
              DateTime.now().millisecondsSinceEpoch,
            ),
          ),
    )..order(ScheduleNotificationModel_.reservedAt);

    final query = queryBuilder.build()..limit = 64;

    final medicationScheduleNotifications = query.find();

    return medicationScheduleNotifications;
  }

  @override
  Future<ScheduleNotificationModel> createNotification({
    required ScheduleNotificationModel scheduleNotificationModel,
  }) async {
    /// 노티 일정 생성
    final id = scheduleNotificationBox.put(scheduleNotificationModel);

    /// 로컬 노티생성
    // await localNotification.createNotification(
    //   scheduleNotificationModel: scheduleNotificationModel,
    // );

    return scheduleNotificationBox.get(id)!;
  }

  @override
  ScheduleNotificationModel updateNotification({
    required ScheduleNotificationModel scheduleNotificationModel,
  }) {
    final id = scheduleNotificationBox.put(
      scheduleNotificationModel,
      mode: PutMode.update,
    );

    return scheduleNotificationBox.get(id)!;
  }

  @override
  Future<void> deleteNotification({
    required String userId,
    required int type,
    required DateTime reservedAt,
  }) async {
    final query = scheduleNotificationBox
        .query(
          ScheduleNotificationModel_.userId.equals(userId) &
              ScheduleNotificationModel_.type.equals(type) &
              ScheduleNotificationModel_.reservedAt
                  .equals(reservedAt.millisecondsSinceEpoch),
        )
        .build();

    final scheduleNotificationModels = query.find();

    final scheduleNotificationModel = scheduleNotificationModels.firstOrNull;

    if (scheduleNotificationModel != null) {
      query.remove();
    }

    query.close();

    if (scheduleNotificationModel == null) return;

    await Future.wait(
      scheduleNotificationModels.map(
        (e) => localNotification.deleteNotification(
          scheduleNotificationId: e.id,
        ),
      ),
    );

    return null;
  }

  @override
  List<ScheduleNotificationModel> getNotifications({
    required DateTime reservedAt,
  }) {
    final query = scheduleNotificationBox
        .query(
          ScheduleNotificationModel_.reservedAt.between(
            DateTime(reservedAt.year, reservedAt.month, reservedAt.day)
                .millisecondsSinceEpoch,
            DateTime(reservedAt.year, reservedAt.month, reservedAt.day + 1)
                .millisecondsSinceEpoch,
          ),
        )
        .build();

    final scheduleNotifications = query.find();

    query.close();

    return scheduleNotifications;
  }

  @override
  Future<void> deleteNotificationById({
    required String id,
    required int type,
    required String userId,
  }) async {
    final query = scheduleNotificationBox
        .query(
          ScheduleNotificationModel_.userId.equals(userId) &
              ScheduleNotificationModel_.type.equals(type) &
              ScheduleNotificationModel_.scheduleIds.contains(id),
        )
        .build();

    final ids = query.findIds();

    query.remove();

    await Future.wait(
      ids.map(
        (scheduleNotificationId) => localNotification.deleteNotification(
          scheduleNotificationId: scheduleNotificationId,
        ),
      ),
    );

    return;
  }
}
