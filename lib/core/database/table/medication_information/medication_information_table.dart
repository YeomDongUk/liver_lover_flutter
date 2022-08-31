import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/pill/pill_table.dart';
import 'package:yak/core/database/table/prescription/prescription_table.dart';

@DataClassName('MedicationInformationModel')
class MedicationInformations extends CommonTable {
  TextColumn get prescriptionId => text().references(Prescriptions, #id)();
  TextColumn get pillId => text().references(Pills, #id)();

  /// 첫번째 복용 시간
  IntColumn get timeOne => integer().nullable()();

  /// 두번째 복용 시간
  IntColumn get timeTwo => integer().nullable()();

  /// 세번째 복용 시간
  IntColumn get timeThree => integer().nullable()();

  /// 복용량
  IntColumn get takeCount => integer()();

  /// 복용주기
  IntColumn get takeCycle => integer()();

  /// 알림 사용
  BoolColumn get push => boolean().withDefault(const Constant(false))();

  /// 30분 전 알림
  BoolColumn get beforePush => boolean().withDefault(const Constant(false))();

  /// 30분 후 알림
  BoolColumn get afterPush => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
        {
          prescriptionId,
          pillId,
        }
      ];
}
