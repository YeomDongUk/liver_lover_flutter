import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('ExcerciseHistoryModel')
class ExcerciseHistories extends UserReferenceTable {
  IntColumn get minuite => integer()();
  DateTimeColumn get date => dateTime()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
