// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/pill/pill_table.dart';
import 'package:yak/core/database/table/prescription/prescription_table.dart';

@DataClassName('MedicationInformationModel')
class MedicationInformations extends CommonTable {
  TextColumn get prescriptionId => text().references(Prescriptions, #id)();

  TextColumn get pillId => text().references(Pills, #id)();

  IntColumn get dayDuration => integer()();

  IntColumn get takeCount => integer()();

  IntColumn get moring => integer()
      .check(
        moring.isBetween(
          const Constant(7),
          const Constant(9),
        ),
      )
      .nullable()();

  IntColumn get afternoon => integer()
      .check(
        afternoon.isBetween(
          const Constant(11),
          const Constant(13),
        ),
      )
      .nullable()();

  IntColumn get evening => integer()
      .check(
        evening.isBetween(
          const Constant(18),
          const Constant(20),
        ),
      )
      .nullable()();

  IntColumn get night => integer()
      .check(
        night.isBetween(
          const Constant(22),
          const Constant(24),
        ),
      )
      .nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          prescriptionId,
          pillId,
        },
      ];
}
