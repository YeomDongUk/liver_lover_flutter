// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('SmokingHistoryModel')
class SmokingHistories extends UserReferenceTable {
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
