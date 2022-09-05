// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';
import 'package:yak/data/models/survey_group/survey_group_model.dart';

abstract class SurveyGroupLocalDataSource {
  Stream<List<SurveyGroupModel>> getSurveyGroupsStream({
    required String userId,
  });
}

class SurveyGroupLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements SurveyGroupLocalDataSource {
  SurveyGroupLocalDataSourceImpl(super.attachedDatabase);

  @override
  Stream<List<SurveyGroupModel>> getSurveyGroupsStream({
    required String userId,
  }) {
    return (select(sF12SurveyHistories).join(
      [
        leftOuterJoin(
          medicationAdherenceSurveyHistories,
          medicationAdherenceSurveyHistories.hospitalVisitScheduleId.equalsExp(
            sF12SurveyHistories.hospitalVisitScheduleId,
          ),
          useColumns: true,
        ),
        leftOuterJoin(
          hospitalVisitSchedules,
          hospitalVisitSchedules.id
              .equalsExp(sF12SurveyHistories.hospitalVisitScheduleId),
          useColumns: true,
        ),
      ],
    )
          ..where(hospitalVisitSchedules.userId.equals(userId))
          ..orderBy([
            OrderingTerm.asc(hospitalVisitSchedules.reservedAt),
          ]))
        .watch()
        .map(
          (results) => results
              .map(
                (result) => SurveyGroupModel(
                  reseverdAt:
                      result.readTable(hospitalVisitSchedules).reservedAt,
                  visitedAt: result.readTable(hospitalVisitSchedules).visitedAt,
                  sf12surveyHistoryModel: result.readTable(sF12SurveyHistories),
                  medicationAdherenceSurveyHistoryModel:
                      result.readTable(medicationAdherenceSurveyHistories),
                ),
              )
              .toList(),
        );
  }
}
