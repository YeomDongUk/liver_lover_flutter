import 'package:drift/drift.dart';
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';

@DataClassName('MedicationNotificationModel')
class MedicationNotifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get medicationScheduleId =>
      text().references(MedicationSchedules, #id)();
  IntColumn get status => intEnum<NotificationStatus>()();
  IntColumn get type => intEnum<NotificationType>()();
  DateTimeColumn get reservedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          medicationScheduleId,
          type,
        },
      ];
}
