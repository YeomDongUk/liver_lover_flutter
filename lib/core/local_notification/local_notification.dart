import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/database/database.dart';

abstract class LocalNotification {
  Future<bool> createMedicationScheduleNotification(
    MedicationScheduleModel medicationScheduleModels,
  );
}

class LocalNotificationImpl implements LocalNotification {
  LocalNotificationImpl();

  Future<void> initialize() => AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: 'medication_schedules',
            channelKey: 'medication_schedule',
            channelName: 'Medication Schedule Channel',
            channelDescription: 'Channel with alarm ringtone',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.Max,
            ledColor: Colors.white,
            channelShowBadge: true,
            locked: true,
            defaultRingtoneType: DefaultRingtoneType.Alarm,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupkey: 'medication_schedules',
            channelGroupName: 'Medication Schedule Channel Group ',
          ),
        ],
        debug: kDebugMode,
      );

  @override
  Future<bool> createMedicationScheduleNotification(
    MedicationScheduleModel medicationScheduleModel,
  ) {
    return Future(() => true);
    // return _createNotification(
    //   id: medicationScheduleModel,
    //   channelKey: 'medication_schedule',
    //   year: medicationScheduleModel.year,
    //   month: medicationScheduleModel.month,
    //   day: medicationScheduleModel.day,
    //   hour: medicationScheduleModel.hour,
    //   minute: medicationScheduleModel.minute,
    // );
  }

  Future<bool> _createNotification({
    required int id,
    required String channelKey,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required int second,
  }) =>
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: channelKey,
        ),
        schedule: NotificationCalendar(
          year: year,
          month: month,
          day: day,
          hour: hour,
          minute: minute,
          second: second,
          timeZone: 'asia/seoul',
          allowWhileIdle: true,
          preciseAlarm: true,
        ),
      );
}
