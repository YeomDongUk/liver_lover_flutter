import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

/// 유저 테이블
@DataClassName('UserModel')
class Users extends CommonTable {
  TextColumn get name =>
      text().check(name.length.isBiggerThan(const Constant(0)))();

  TextColumn get phone =>
      text().check(phone.length.equalsExp(const Constant(11)))();

  IntColumn get birthYear =>
      integer().check(birthYear.isBiggerThan(const Constant(1900)))();

  IntColumn get sex =>
      integer().customConstraint('NOT NULL CHECK (sex IN (0, 1))')();

  IntColumn get height => integer()();

  IntColumn get weight => integer()();

  TextColumn get pinCode =>
      text().check(pinCode.length.equalsExp(const Constant(6)))();

  IntColumn get point => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          pinCode,
        },
      ];
}
