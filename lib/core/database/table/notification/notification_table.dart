// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/class/notification.dart';
import 'package:yak/core/database/table/user/user_table.dart';

@DataClassName('NotificationModel')
class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get scheduleId => text()();
  IntColumn get status => intEnum<NotificationStatus>()();
  IntColumn get type => intEnum<NotificationType>()();
  IntColumn get subType => intEnum<NotificationSubType>()();
  DateTimeColumn get reservedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          scheduleId,
          type,
          subType,
        },
      ];
}
