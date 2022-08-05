// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

enum PointHistoryEvent {
  medicationComplete,
  hospitalVisitScheduleCreate,
  examinationResultCreate,
  surveyComplete,
}

@DataClassName('PointHistoryModel')
class PointHistories extends UserReferenceTable {
  IntColumn get event => intEnum<PointHistoryEvent>()();
  IntColumn get point => integer()();
  TextColumn get forginId => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          event,
          forginId,
        }
      ];
}
