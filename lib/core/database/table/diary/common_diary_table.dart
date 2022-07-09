import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

class CommonDiaryTable extends UserReferenceTable {
  DateTimeColumn get writtenAt => dateTime()();
}
