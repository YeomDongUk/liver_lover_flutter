// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

enum HospitalVisitScheduleType {
  /// 정기 검진
  regular,

  /// 외래 진료
  outpatient,
}

/// 병원 방문일 테이블
@DataClassName('HospitalVisitScheduleModel')
class HospitalVisitSchedules extends UserReferenceTable {
  /// 진료 타입
  IntColumn get type => intEnum<HospitalVisitScheduleType>()();

  /// 병원 이름
  TextColumn get hospitalName => text()();

  /// 진료 과목
  TextColumn get medicalSubject => text().withDefault(const Constant(''))();

  /// 의사 이름
  TextColumn get doctorName => text().withDefault(const Constant(''))();

  /// 방문 예약일
  DateTimeColumn get reservedAt =>
      dateTime().check(reservedAt.isBiggerThan(currentDate))();

  /// 방문일
  DateTimeColumn get visitedAt =>
      dateTime().check(visitedAt.isBiggerThan(currentDate)).nullable()();

  /// 알림
  BoolColumn get push => boolean().withDefault(const Constant(false))();

  /// 30분 전 알림
  BoolColumn get beforePush => boolean().withDefault(const Constant(false))();

  /// 30분 후 알림
  BoolColumn get afterPush => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          reservedAt,
        }
      ];
}
