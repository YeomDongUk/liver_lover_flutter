// Project imports:

// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';

abstract class MedicationInformationLocalDataSource {
  Stream<List<MedicationInformationModel>>
      getMedicationInformationModelsStream({
    required String userId,
  });
}

class MedicationInformationLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements MedicationInformationLocalDataSource {
  MedicationInformationLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
  }) : super(attachedDatabase);

  MedicationScheduleLocalDataSource get medicationScheduleLocalDataSource =>
      KiwiContainer().resolve<MedicationScheduleLocalDataSource>();

  @override
  Stream<List<MedicationInformationModel>>
      getMedicationInformationModelsStream({
    required String userId,
  }) =>
          (select(medicationInformations).join([
            leftOuterJoin(
              prescriptions,
              prescriptions.id.equalsExp(medicationInformations.prescriptionId),
              useColumns: false,
            )
          ])
                ..where(prescriptions.userId.equals(userId)))
              .watch()
              .map(
                (results) => results
                    .map((e) => e.readTable(medicationInformations))
                    .toList(),
              );
}
