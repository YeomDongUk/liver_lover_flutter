// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';

// Project imports:
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/database.dart' as db;

abstract class LocalNotification {
  Future<void> initialize();
  Future<bool> createMedicationNotification(
    db.NotificationModel notificationModel,
  );
  Future<bool> createHospitalVisitNotification(
    db.NotificationModel notificationModel,
  );

  Future<bool> getPermissionAllowed();
  Future<bool> requestPermission();
  Future<List<NotificationModel>> getScheduledNotifications();
}

class LocalNotificationImpl implements LocalNotification {
  LocalNotificationImpl();

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
            importance: NotificationImportance.Max,
            ledColor: Colors.white,
            locked: true,
          ),
          NotificationChannel(
            channelGroupKey: 'medications',
            channelKey: 'medication',
            channelName: 'Medication Schedule Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Max,
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
  Future<bool> createMedicationNotification(
    db.NotificationModel notificationModel,
  ) {
    if (DateTime.now().isAfter(notificationModel.reservedAt)) {
      return Future(() => false);
    }

    return _createNotification(
      id: notificationModel.id,
      title: '복약 일정 알림',
      body:
          '''복약 시간 30분 ${notificationModel.subType == NotificationSubType.beforeHalfHour ? '전' : '후'} 입니다''',
      channelKey: 'medication',
      date: notificationModel.reservedAt,
    );
  }

  Future<bool> _createNotification({
    required int id,
    required String channelKey,
    required String title,
    required String body,
    required DateTime date,
  }) =>
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: channelKey,
          title: title,
          body: body,
          category: NotificationCategory.Reminder,
        ),
        schedule: NotificationCalendar.fromDate(
          date: date,
        ),
      );

  @override
  Future<bool> createHospitalVisitNotification(
    db.NotificationModel notificationModel,
  ) {
    if (DateTime.now().isAfter(notificationModel.reservedAt)) {
      return Future(() => false);
    }

    return _createNotification(
      id: notificationModel.id,
      title: '병원 방문 알림',
      body:
          '''방문 ${notificationModel.type == NotificationSubType.beforeDay ? '하루' : '2시간'}전 입니다''',
      channelKey: 'hospital_visit',
      date: notificationModel.reservedAt,
    );
  }

  @override
  Future<bool> getPermissionAllowed() =>
      AwesomeNotifications().isNotificationAllowed();

  @override
  Future<bool> requestPermission() async {
    final isAllowed = await getPermissionAllowed();

    if (isAllowed) return true;

    return AwesomeNotifications().requestPermissionToSendNotifications();
  }

  @override
  Future<List<NotificationModel>> getScheduledNotifications() =>
      AwesomeNotifications().listScheduledNotifications();
}
