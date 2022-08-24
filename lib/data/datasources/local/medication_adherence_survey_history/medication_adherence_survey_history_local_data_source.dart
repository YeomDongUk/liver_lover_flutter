// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class MedicationAdherenceSurveyHistoryLocalDataSource {
  Future<MedicationAdherenceSurveyHistoryModel>
      getSurveyHistoryFromHospitalVisitScheduleId({
    required String hospitalVisitScheduleId,
    required String userId,
  });
}

class MedicationAdherenceSurveyHistoryLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    implements MedicationAdherenceSurveyHistoryLocalDataSource {
  MedicationAdherenceSurveyHistoryLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.medicationAdherenceSurveyHistories;

  @override
  Future<MedicationAdherenceSurveyHistoryModel>
      getSurveyHistoryFromHospitalVisitScheduleId({
    required String hospitalVisitScheduleId,
    required String userId,
  }) async {
    final result = await (select(table).join(
      [
        leftOuterJoin(
          attachedDatabase.hospitalVisitSchedules,
          attachedDatabase.hospitalVisitSchedules.id
              .equalsExp(table.hospitalVisitScheduleId),
        )
      ],
    )..where(
            table.hospitalVisitScheduleId.equals(hospitalVisitScheduleId) &
                attachedDatabase.hospitalVisitSchedules.userId.equals(userId),
          ))
        .getSingle();

    return result.readTable(table);
  }
}
