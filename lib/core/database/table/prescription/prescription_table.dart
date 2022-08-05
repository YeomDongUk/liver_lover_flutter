// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

/// 처방전 테이블
@DataClassName('PrescriptionModel')
class Prescriptions extends UserReferenceTable {
  TextColumn get doctorName => text()();
  DateTimeColumn get prescribedAt => dateTime()();
  DateTimeColumn get medicationStartAt => dateTime()();
  DateTimeColumn get medicationEndAt => dateTime()();
  BoolColumn get push => boolean().withDefault(const Constant(false))();
  BoolColumn get beforePush => boolean().withDefault(const Constant(false))();
  BoolColumn get afterPush => boolean().withDefault(const Constant(false))();
}
