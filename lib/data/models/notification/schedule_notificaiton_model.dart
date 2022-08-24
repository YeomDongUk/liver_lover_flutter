// IntColumn get id => integer().autoIncrement()();
// TextColumn get userId => text().references(Users, #id)();
// TextColumn get scheduleId => text()();
// IntColumn get status => intEnum<NotificationStatus>()();
// IntColumn get type => intEnum<NotificationType>()();
// IntColumn get subType => intEnum<NotificationSubType>()();
// DateTimeColumn get reservedAt => dateTime()();
// DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
// DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();

import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ScheduleNotificationModel extends Equatable {
  ScheduleNotificationModel({
    this.id = 0,
    required this.userId,
    required this.type,
    required this.scheduleIds,
    required this.beforePush,
    required this.reservedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }

  /// 아이디
  late int id;

  /// 유저 아이디
  late String userId;

  /// 1: 복약일정, 2: 병원 방문 일정
  late int type;

  /// 일정 아이디 그룹
  late List<String> scheduleIds;

  /// 전 푸시인지
  late bool beforePush;

  /// 복용일
  @Property(type: PropertyType.date)
  late DateTime reservedAt;

  /// 생성일
  @Property(type: PropertyType.date)
  late DateTime createdAt;

  /// 수정일
  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  ScheduleNotificationModel copyWith({
    List<String>? scheduleIds,
  }) =>
      ScheduleNotificationModel(
        id: id,
        userId: userId,
        type: type,
        scheduleIds: scheduleIds ?? this.scheduleIds,
        beforePush: beforePush,
        reservedAt: reservedAt,
        createdAt: createdAt,
        updatedAt: DateTime.now(),
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        type,
        scheduleIds,
        beforePush,
        reservedAt,
        createdAt,
        updatedAt,
      ];
}
