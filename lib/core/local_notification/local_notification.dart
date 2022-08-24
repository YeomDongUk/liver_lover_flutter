// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:yak/core/static/static.dart';

// Project imports:
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';

abstract class LocalNotification {
  Future<void> initialize();

  // Future<bool> createNotification({
  //   required ScheduleNotificationModel scheduleNotificationModel,
  // });
  Future<List<bool>> createNotifications({
    required List<ScheduleNotificationModel> scheduleNotificationModels,
  });

  Future<void> deleteNotification({
    required int scheduleNotificationId,
  });

  Future<void> deleteAllMedicationScheduleNotification();

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

  @override
  Future<void> initialize() => AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: 'hospital_visits',
            channelKey: 'hospital_visit',
            channelName: 'Hospital Visit Notification Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Default,
            channelShowBadge: false,
            ledColor: Colors.white,
            locked: true,
          ),
          NotificationChannel(
            channelGroupKey: 'medications',
            channelKey: 'medication',
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
  Future<List<NotificationModel>> getScheduledNotifications() =>
      AwesomeNotifications().listScheduledNotifications();

  Future<bool> createNotification({
    required ScheduleNotificationModel scheduleNotificationModel,
  }) async {
    final id = scheduleNotificationModel.id;
    final isMedicationSchedule = scheduleNotificationModel.type == 1;
    final channelKey = isMedicationSchedule ? 'medication' : 'hospital_visit';
    final isBeforePush = scheduleNotificationModel.beforePush;
    final title = isMedicationSchedule
        ? '복약시간 30분 ${isBeforePush ? '전' : '후'} 알림'
        : '병원방문 ${isBeforePush ? '하루' : '2시간'}전 알림';

    final body = isMedicationSchedule
        ? '''[${hhmmFormat.format(scheduleNotificationModel.reservedAt)}] ${isBeforePush ? 'OOO님 복약시간이 다가옵니다.\n지금 약을 준비해 주세요.' : '복약시간이 지났습니다.\n더 늦지 않게 약을 복용하세요!'}'''
        : '''[${hhmmFormat.format(scheduleNotificationModel.reservedAt)}] 방문 ${isBeforePush ? '하루' : '2시간'} 전 입니다.''';

    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        displayOnForeground: true,
        displayOnBackground: true,
        channelKey: channelKey,
        title: title,
        body: body,
        category: NotificationCategory.Reminder,
        payload: {
          'reservedAt':
              '${scheduleNotificationModel.reservedAt.add(Duration(minutes: isBeforePush ? 30 : -30)).millisecondsSinceEpoch}',
          'beforePush': '$isBeforePush',
          'scheduleIds': scheduleNotificationModel.scheduleIds.join(','),
        },
      ),
      schedule: NotificationCalendar.fromDate(
        date: scheduleNotificationModel.reservedAt,
      ),
    );
  }

  @override
  Stream<ReceivedAction> receiveStream() => AwesomeNotifications().actionStream;

  @override
  Future<void> deleteNotification({
    required int scheduleNotificationId,
  }) =>
      AwesomeNotifications().cancelSchedule(scheduleNotificationId);

  @override
  Future<List<bool>> createNotifications({
    required List<ScheduleNotificationModel> scheduleNotificationModels,
  }) =>
      Future.wait(
        scheduleNotificationModels
            .map((e) => createNotification(scheduleNotificationModel: e))
            .toList(),
      );

  @override
  Future<void> deleteAllMedicationScheduleNotification() async {
    final notifications = await getScheduledNotifications();

    await Future.wait(
      notifications
          .where((e) => e.content?.channelKey == 'medication')
          .map((e) => AwesomeNotifications().cancel(e.content!.id!))
          .toList(),
    );
  }
}
