// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('HospitalModel')
class Hospitals extends CommonTable {
  TextColumn get name => text()();
  TextColumn get logo => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          name,
        },
        {
          logo,
        },
      ];
}
