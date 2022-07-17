import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('DrinkingHistoryModel')
class DrinkingHistories extends UserReferenceTable {
  IntColumn get amount => integer()();
  DateTimeColumn get date => dateTime()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
