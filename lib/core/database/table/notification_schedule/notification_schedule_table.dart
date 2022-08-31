import 'package:drift/drift.dart';
import 'package:yak/core/database/table/user/user_table.dart';

@DataClassName('NotificationScheduleModel')
class NotificationSchedules extends Table {
  /// 아이디
  IntColumn get id => integer().autoIncrement()();

  /// 유저 아이디
  TextColumn get userId => text().references(Users, #id)();

  /// 0: 복약일정, 1: 병원방문 일정
  IntColumn get type => integer()();

  /// 이전 알림인지
  BoolColumn get isBeforePush => boolean()();

  /// 알림 예정일
  DateTimeColumn get reservedAt => dateTime()();

  /// 생성일
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();

  /// 수정일
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(Constant(DateTime.now()))();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
        {
          userId,
          type,
          isBeforePush,
          reservedAt,
        }
      ];
}
