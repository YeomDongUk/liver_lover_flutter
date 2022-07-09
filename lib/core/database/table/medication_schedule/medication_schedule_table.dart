import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/prescription/prescription_table.dart';

enum MedicationScheduleType {
  moring,
  afternoon,
  evening,
  night,
}

/// 복용 스케쥴 테이블
@DataClassName('MedicationScheduleModel')
class MedicationSchedules extends CommonTable {
  /// 스케쥴 그룹 아이디
  TextColumn get prescriptionId => text().references(Prescriptions, #id)();
  IntColumn get type => intEnum<MedicationScheduleType>()();
  DateTimeColumn get reservedAt => dateTime()();
  DateTimeColumn get medicatedAt => dateTime().nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          prescriptionId,
          type,
          reservedAt,
        }
      ];
}
