import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('LiverVirusHistoryModel')
class LiverVirusHstories extends UserReferenceTable {
  DateTimeColumn get date => dateTime()();
  IntColumn get value => integer()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
