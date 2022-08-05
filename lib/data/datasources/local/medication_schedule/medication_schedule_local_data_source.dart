// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';

abstract class MedicationScheduleLocalDataSource {
  Future<List<MedicationScheduleModel>> createMedicationSchedules(
    Iterable<MedicationSchedulesCompanion> companions,
  );

  Future<List<MedicationScheduleModel>>
      getMedicationSchedulesBetweenReservedAt({
    required String userId,
    required DateTime startAt,
    DateTime? endAt,
  });

  Future<List<MedicationScheduleModel>> getMedicationScheduelsByPrescriptionId({
    required String userId,
    required String prescriptionId,
  });

  // Future updateMedicationScheduels({
  //   required String prescriptionId,

  // });
}

class MedicationScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements MedicationScheduleLocalDataSource {
  MedicationScheduleLocalDataSourceImpl(
    super.attachedDatabase,
  );
  $MedicationSchedulesTable get table => attachedDatabase.medicationSchedules;

  @override
  Future<List<MedicationScheduleModel>> createMedicationSchedules(
    Iterable<MedicationSchedulesCompanion> companions,
  ) =>
      Future.wait(companions.map(into(table).insertReturning));

  List<MedicationSchedulesCompanion> convertMedicationSchedulesCompanions({
    required String prescriptionId,
    required Iterable<MedicationInformationModel> medicationInformationModels,
    required MedicationScheduleType type,
    required DateTime medicationDate,
  }) =>
      medicationInformationModels
          .where((element) {
            if (type == MedicationScheduleType.moring) {
              return element.moring != null;
            }
            if (type == MedicationScheduleType.afternoon) {
              return element.afternoon != null;
            }
            if (type == MedicationScheduleType.evening) {
              return element.evening != null;
            }
            if (type == MedicationScheduleType.night) {
              return element.night != null;
            }
            throw Error();
          })
          .map(
            (e) => MedicationSchedulesCompanion.insert(
              prescriptionId: prescriptionId,
              type: type,
              reservedAt: medicationDate.add(
                Duration(
                  hours: type == MedicationScheduleType.moring
                      ? e.moring!
                      : type == MedicationScheduleType.afternoon
                          ? e.afternoon!
                          : type == MedicationScheduleType.evening
                              ? e.evening!
                              : e.night!,
                ),
              ),
            ),
          )
          .toList();

  @override
  Future<List<MedicationScheduleModel>>
      getMedicationSchedulesBetweenReservedAt({
    required String userId,
    required DateTime startAt,
    DateTime? endAt,
  }) async {
    final queryResults = await (select(table).join([
      leftOuterJoin(
        attachedDatabase.prescriptions,
        attachedDatabase.prescriptions.id.equalsExp(table.prescriptionId),
        useColumns: false,
      ),
    ])
          ..where(
            attachedDatabase.prescriptions.userId.equals(userId) &
                table.reservedAt.isBetweenValues(
                  startAt,
                  endAt ?? DateTime(9999),
                ),
          ))
        .get();

    return queryResults.map((e) => e.readTable(table)).toList();
  }

  @override
  Future<List<MedicationScheduleModel>> getMedicationScheduelsByPrescriptionId({
    required String userId,
    required String prescriptionId,
  }) async {
    final queryResults = await (select(table).join([
      leftOuterJoin(
        attachedDatabase.prescriptions,
        attachedDatabase.prescriptions.id.equalsExp(table.prescriptionId),
        useColumns: false,
      ),
    ])
          ..where(
            attachedDatabase.prescriptions.userId.equals(userId) &
                attachedDatabase.prescriptions.id.equals(prescriptionId),
          ))
        .get();

    return queryResults.map((e) => e.readTable(table)).toList();
  }
}
