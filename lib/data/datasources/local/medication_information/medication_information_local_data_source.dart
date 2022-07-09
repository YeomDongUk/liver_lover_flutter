import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class MedicationInformationLocalDataSource {
  Future<List<MedicationInformationModel>> createMedicationInformations(
    Iterable<MedicationInformationsCompanion> companions,
  );
}

class MedicationInformationLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements MedicationInformationLocalDataSource {
  MedicationInformationLocalDataSourceImpl(super.attachedDatabase);
  $MedicationInformationsTable get table =>
      attachedDatabase.medicationInformations;
  @override
  Future<List<MedicationInformationModel>> createMedicationInformations(
    Iterable<MedicationInformationsCompanion> companions,
  ) =>
      Future.wait(companions.map(into(table).insertReturning));
}
