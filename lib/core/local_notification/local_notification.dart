// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/notification_schedule/notification_schedule_table.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/user/user_id.dart';

abstract class LocalNotification {
  Future<void> initialize();

  Future<void> onLoginCallback({
    required String userId,
    required List<NotificationScheduleModel> notificationScheduleModels,
  });

  Future<bool> createNotification({
    required NotificationScheduleModel notificationScheduleModel,
  });

  Future<void> cancel({
    required int notificationScheduleId,
  });

  Future<void> cancelAll();

  Future<bool> getPermissionAllowed();

  Future<bool> requestPermission();

  Future<List<NotificationModel>> getScheduledNotifications();

  Stream<ReceivedAction> receiveStream();
}

class LocalNotificationImpl implements LocalNotification {
  LocalNotificationImpl({
    required this.userId,
  });

  final UserId userId;
  final hospitalVisitChannelKey = 'hospital_visit';
  final medicationChannelKey = 'medication';
  String? prevUserId;
  List<NotificationModel>? _scheduledNotificationModels;

  @override
  Future<void> initialize() => AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: '${hospitalVisitChannelKey}s',
            channelKey: hospitalVisitChannelKey,
            channelName: 'Hospital Visit Notification Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Default,
            channelShowBadge: false,
            ledColor: Colors.white,
            locked: true,
          ),
          NotificationChannel(
            channelGroupKey: '${medicationChannelKey}s',
            channelKey: medicationChannelKey,
            channelName: 'Medication Schedule Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Default,
            channelShowBadge: false,
            ledColor: Colors.white,
            locked: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupkey: 'medications',
            channelGroupName: 'Medication Channel Group ',
          ),
          NotificationChannelGroup(
            channelGroupkey: 'hospital_visits',
            channelGroupName: 'Hospital Visit Notification Channel Group',
          ),
        ],
        debug: kDebugMode,
      );

  @override
  Future<bool> getPermissionAllowed() =>
      AwesomeNotifications().isNotificationAllowed();

  @override
  Future<bool> requestPermission() async {
    final isAllowed = await getPermissionAllowed();

    return isAllowed
        ? Future(() => true)
        : AwesomeNotifications().requestPermissionToSendNotifications();
  }

  @override
  Future<List<NotificationModel>> getScheduledNotifications() async {
    if (prevUserId == null || prevUserId != userId.value) {
      prevUserId = userId.value;

      _scheduledNotificationModels =
          await AwesomeNotifications().listScheduledNotifications();

      return _scheduledNotificationModels!
        ..sort(
          (prev, curr) =>
              _scheduleToDateTime(prev.schedule! as NotificationCalendar)
                  .compareTo(
            _scheduleToDateTime(curr.schedule! as NotificationCalendar),
          ),
        );
    } else {
      if (_scheduledNotificationModels!.isEmpty) {
        _scheduledNotificationModels =
            await AwesomeNotifications().listScheduledNotifications();
      }

      return _scheduledNotificationModels!
        ..removeWhere(
          (notificationModel) => _scheduleToDateTime(
            notificationModel.schedule! as NotificationCalendar,
          ).isBefore(DateTime.now()),
        )
        ..sort(
          (prev, curr) =>
              _scheduleToDateTime(prev.schedule! as NotificationCalendar)
                  .compareTo(
            _scheduleToDateTime(curr.schedule! as NotificationCalendar),
          ),
        );
    }
  }

  @override
  Stream<ReceivedAction> receiveStream() => AwesomeNotifications().actionStream;

  @override
  Future<void> cancel({
    required int notificationScheduleId,
  }) async {
    final scheduledNotifications = await getScheduledNotifications();

    await AwesomeNotifications().cancelSchedule(notificationScheduleId);

    return scheduledNotifications.removeWhere(
      (element) => element.content!.id == notificationScheduleId,
    );
  }

  @override
  Future<void> cancelAll() => AwesomeNotifications().cancelAll();

  @override
  Future<bool> createNotification({
    required NotificationScheduleModel notificationScheduleModel,
  }) async {
    final date = notificationScheduleModel.reservedAt;

    if (date.isBefore(DateTime.now())) {
      return false;
    }

    final scheduledNotificaitons = await getScheduledNotifications();

    final lastScheduledNotification = scheduledNotificaitons.lastOrNull;

    final id = lastScheduledNotification?.content?.id;

    late final String channelKey;
    late final String title;
    late final String body;

    /// 노티 일정 타입이 복약일정이면
    if (notificationScheduleModel.type == 0) {
      channelKey = medicationChannelKey;
      title =
          '복약시간 ${notificationScheduleModel.pushType == PushType.onTime ? '' : notificationScheduleModel.pushType == PushType.before ? '30분 전' : '30분  후'} 알림';

      body =
          '[${hhmmFormat.format(notificationScheduleModel.reservedAt)}] ${notificationScheduleModel.pushType == PushType.onTime ? '복약시간입니다. 약을 복용해주세요!' : notificationScheduleModel.pushType == PushType.before ? '복약시간이 다가옵니다.\n지금 약을 준비해 주세요.' : '복약시간이 지났습니다.\n더 늦지 않게 약을 복용하세요!'}';
    } else {
      channelKey = hospitalVisitChannelKey;
      title =
          '병원방문 ${notificationScheduleModel.pushType == PushType.onTime ? '' : notificationScheduleModel.pushType == PushType.before ? '하루 전' : '2시간 전'} 알림';

      body =
          '''[${hhmmFormat.format(notificationScheduleModel.reservedAt)}] 병원 방문 ${notificationScheduleModel.pushType == PushType.onTime ? '시간입니다.' : notificationScheduleModel.pushType == PushType.before ? '하루 전 입니다.\n늦지 않게 준비해 주세요.' : '2시간 전 입니다.\n늦지 않게 준비해 주세요.'}''';
    }

    if (id != null && scheduledNotificaitons.length >= 64) {
      await AwesomeNotifications().cancelSchedule(id);
      scheduledNotificaitons.removeWhere(
        (element) => element.content?.id == id,
      );
    }

    final content = NotificationContent(
      id: notificationScheduleModel.id,
      groupKey: '${channelKey}s',
      channelKey: channelKey,
      title: title,
      body: body,
      displayOnForeground: true,
      displayOnBackground: true,
      category: NotificationCategory.Reminder,
      payload: {
        'userId': notificationScheduleModel.userId,
        'reservedAt': '${date.millisecondsSinceEpoch}',
        'pushType': '${notificationScheduleModel.pushType.index}',
      },
    );

    final schedule = NotificationCalendar.fromDate(
      date: date,
    );

    final createResult = await AwesomeNotifications().createNotification(
      content: content,
      schedule: schedule,
    );

    if (createResult) {
      _scheduledNotificationModels
        ?..add(
          NotificationModel(
            content: content,
            schedule: schedule,
          ),
        )
        ..sort(
          (prev, curr) =>
              _scheduleToDateTime(prev.schedule! as NotificationCalendar)
                  .compareTo(
            _scheduleToDateTime(curr.schedule! as NotificationCalendar),
          ),
        );
    }

    return createResult;
  }

  DateTime _scheduleToDateTime(NotificationCalendar notificationSchedule) =>
      DateTime(
        notificationSchedule.year!,
        notificationSchedule.month!,
        notificationSchedule.day!,
        notificationSchedule.hour!,
        notificationSchedule.minute!,
      );

  @override
  Future<void> onLoginCallback({
    required String userId,
    required List<NotificationScheduleModel> notificationScheduleModels,
  }) async {
    final scheduledNotifications = await getScheduledNotifications();

    await Future.wait(
      (notificationScheduleModels
            ..removeWhere(
              (element) => scheduledNotifications
                  .map(
                    (e) => e.content!.id,
                  )
                  .contains(element.id),
            ))
          .map(
        (e) => createNotification(notificationScheduleModel: e),
      ),
    );
  }
}
