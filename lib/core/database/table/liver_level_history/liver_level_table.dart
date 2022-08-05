// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

enum LiverLevelType { ast, alt }

@DataClassName('LiverLevelHistoryModel')
class LiverLevelHistories extends UserReferenceTable {
  DateTimeColumn get date => dateTime()();
  IntColumn get type => intEnum<LiverLevelType>()();
  IntColumn get value => integer()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
          type,
        }
      ];
}
