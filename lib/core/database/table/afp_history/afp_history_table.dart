// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('AFPHistoryModel')
class AFPHistories extends UserReferenceTable {
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
