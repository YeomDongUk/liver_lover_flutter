// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class SF12SurveyHistoryLocalDataSource {
  Future<SF12SurveyHistoryModel> getSurveyHistoryFromHospitalVisitScheduleId({
    required String hospitalVisitScheduleId,
    required String userId,
  });
}

class SF12SurveyHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements SF12SurveyHistoryLocalDataSource {
  SF12SurveyHistoryLocalDataSourceImpl(super.attachedDatabase);
  late final table = attachedDatabase.sF12SurveyHistories;

  // @overrid

  @override
  Future<SF12SurveyHistoryModel> getSurveyHistoryFromHospitalVisitScheduleId({
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
