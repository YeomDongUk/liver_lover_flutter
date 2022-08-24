// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';

@DataClassName('UserPointModel')
class UserPoints extends UserReferenceTable {
  IntColumn get point => integer().withDefault(const Constant(0))();
  TextColumn get hospitalVisitScheduleId =>
      text().references(HospitalVisitSchedules, #id).nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
        },
        {
          hospitalVisitScheduleId,
        }
      ];
}
