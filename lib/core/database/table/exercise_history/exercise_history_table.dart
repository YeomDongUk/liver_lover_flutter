// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('ExcerciseHistoryModel')
class ExcerciseHistories extends UserReferenceTable {
  DateTimeColumn get date => dateTime()();

  /// 운동 시간 (분)
  IntColumn get minuite => integer()();

  ///  체중(g)
  IntColumn get weight => integer()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
