// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

/// 처방전 테이블
@DataClassName('PrescriptionModel')
class Prescriptions extends UserReferenceTable {
  /// 의사 이름
  TextColumn get doctorName => text()();

  /// 처방일
  DateTimeColumn get prescriptedAt => dateTime()();

  /// 복약 시작일
  DateTimeColumn get medicatedAt => dateTime()();

  /// 복약 기간
  IntColumn get duration =>
      integer().check(duration.isBiggerOrEqual(const Constant(0)))();
}
