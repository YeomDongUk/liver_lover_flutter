import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

enum PointHistoryEvent {
  survey,
  medication,
  hospitalVisit,
  liverLevel,
  booldGlucose,
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
