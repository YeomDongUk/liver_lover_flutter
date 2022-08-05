// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class SF12SurveyHistoryLocalDataSource {
  Future<SF12SurveyHistoryModel> getSurveyHistoryFromHospitalVisitScheduleId({
    required String hospitalVisitScheduleId,
    required String userId,
  });

  // Future<SF12SurveyHistoryModel> createSurveyHistory({
  //   required String userId,
  //   required SF12SurveyHistoriesCompanion companion,
  // });

  // Future<SF12SurveyHistoryModel> updateSurveyHistory({
  //   required String id,
  //   required String userId,
  //   required SF12SurveyHistoriesCompanion companion,
  // });

  // Future<int> deleteSurveyHistory({
  //   required String id,
  //   required String userId,
  // });
}

class SF12SurveyHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements SF12SurveyHistoryLocalDataSource {
  SF12SurveyHistoryLocalDataSourceImpl(super.attachedDatabase);
  late final table = attachedDatabase.sF12SurveyHistories;

  // @override
  // Future<SF12SurveyHistoryModel> createSurveyHistory({
  //   required String userId,
  //   required SF12SurveyHistoriesCompanion companion,
  // }) {
  //   // TODO: implement createSurveyHistory
  //   throw UnimplementedError();
  // }

  // @override
  // Future<int> deleteSurveyHistory({
  //   required String id,
  //   required String userId,
  // }) {
  //   // TODO: implement deleteSurveyHistory
  //   throw UnimplementedError();
  // }

  // @override
  // Future<SF12SurveyHistoryModel> getSurveyHistory({
  //   required String id,
  //   required String userId,
  // }) {
  //   // TODO: implement getSurveyHistory
  //   throw UnimplementedError();
  // }

  // @override
  // Future<SF12SurveyHistoryModel> updateSurveyHistory({
  //   required String id,
  //   required String userId,
  //   required SF12SurveyHistoriesCompanion companion,
  // }) {
  //   // TODO: implement updateSurveyHistory
  //   throw UnimplementedError();
  // }

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
