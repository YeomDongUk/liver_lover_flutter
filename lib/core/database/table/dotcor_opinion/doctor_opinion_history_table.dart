import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('DoctorOpinionHistoryModel')
class DoctorOpinionHistories extends UserReferenceTable {
  DateTimeColumn get date => dateTime()();
  TextColumn get content => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
