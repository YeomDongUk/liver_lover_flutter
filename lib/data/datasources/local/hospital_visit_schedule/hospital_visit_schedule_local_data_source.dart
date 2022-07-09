import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class HospitalVisitScheduleLocalDataSource {
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  });
  Future<List<HospitalVisitScheduleModel>> getHospitalVisitSchedules({
    required String userId,
    required bool visited,
  });

  Future<HospitalVisitScheduleModel> createHospitalVisitSchedule({
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<HospitalVisitScheduleModel> updateHospitalVisitSchedule({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  });
}

class HospitalVisitScheduleLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements HospitalVisitScheduleLocalDataSource {
  HospitalVisitScheduleLocalDataSourceImpl(super.attachedDatabase);
  $HospitalVisitSchedulesTable get table =>
      attachedDatabase.hospitalVisitSchedules;

  @override
  Future<List<HospitalVisitScheduleModel>> getHospitalVisitSchedules({
    required String userId,
    required bool visited,
  }) =>
      (select(table)
            ..where((h) => h.visitedAt.isNull())
            ..where((h) => h.userId.equals(userId))
            ..orderBy(
              [(h) => OrderingTerm.asc(h.reservedAt)],
            ))
          .get();

  @override
  Future<HospitalVisitScheduleModel> createHospitalVisitSchedule({
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) =>
      transaction(() async {
        final hospitalVisitScheduleModel = await into(table).insertReturning(
          companion.copyWith(
            userId: Value(userId),
          ),
        );

        await into(attachedDatabase.sF12SurveyHistories).insertReturning(
          SF12SurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        await into(attachedDatabase.medicationAdherenceSurveyHistories)
            .insertReturning(
          MedicationAdherenceSurveyHistoriesCompanion.insert(
            hospitalVisitScheduleId: hospitalVisitScheduleModel.id,
          ),
        );

        return hospitalVisitScheduleModel;
      });

  @override
  Future<int> deleteHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      (delete(table)
            ..where((h) => h.id.equals(id))
            ..where((h) => h.userId.equals(userId)))
          .go();

  @override
  Future<HospitalVisitScheduleModel> updateHospitalVisitSchedule({
    required String id,
    required String userId,
    required HospitalVisitSchedulesCompanion companion,
  }) async {
    await (update(table)
          ..where((h) => h.id.equals(id))
          ..where((h) => h.userId.equals(userId)))
        .write(companion);
    return (select(table)..where((h) => h.id.equals(id))).getSingle();
  }

  @override
  Future<HospitalVisitScheduleModel> getHospitalVisitSchedule({
    required String id,
    required String userId,
  }) =>
      (select(table)
            ..where((h) => h.id.equals(id))
            ..where((h) => h.userId.equals(userId)))
          .getSingle();
}
