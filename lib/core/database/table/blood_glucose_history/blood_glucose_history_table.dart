import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

enum BloodGlucosesTime {
  befroeBreakfast,
  afterBreakfast,
  afterLaunch,
  afterDinner,
}

@DataClassName('BloodGlucoseHistoryModel')
class BloodGlucoseHistories extends UserReferenceTable {
  DateTimeColumn get date => dateTime()();
  IntColumn get time => intEnum<BloodGlucosesTime>()();
  IntColumn get value => integer()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
          time,
        },
      ];
}
