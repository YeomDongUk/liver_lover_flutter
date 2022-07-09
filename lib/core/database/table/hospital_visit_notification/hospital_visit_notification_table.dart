import 'package:drift/drift.dart';
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';

@DataClassName('HospitalVisitNotificationModel')
class HospitalVisitNotifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hospitalVisitSchedulesId =>
      text().references(HospitalVisitSchedules, #id)();
  IntColumn get status => intEnum<NotificationStatus>()();
  IntColumn get type => intEnum<NotificationType>()();
  DateTimeColumn get reservedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          hospitalVisitSchedulesId,
          type,
        },
      ];
}
