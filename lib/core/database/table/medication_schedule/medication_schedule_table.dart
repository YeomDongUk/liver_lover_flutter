import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/medication_information/medication_information_table.dart';

@DataClassName('MedicationScheduleModel')
class MedicationSchedules extends CommonTable {
  TextColumn get medicationInformationId =>
      text().references(MedicationInformations, #id)();

  /// 복용 예정일
  DateTimeColumn get reservedAt => dateTime()();

  /// 실제 복용일
  DateTimeColumn get medicatedAt => dateTime().nullable()();

  /// 알림 사용
  BoolColumn get push => boolean().withDefault(const Constant(false))();

  /// 30분 전 알림
  BoolColumn get beforePush => boolean().withDefault(const Constant(false))();

  /// 30분 후 알림
  BoolColumn get afterPush => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
        {
          medicationInformationId,
          reservedAt,
        }
      ];
}
