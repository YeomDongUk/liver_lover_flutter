import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/data/models/survey_group/survey_group_model.dart';

abstract class SurveyGroupLocalDataSource {
  Future<List<SurveyGroupModel>> getSurveyGroups({required String userId});
  Future<SurveyGroupModel> getSurveyGroup({
    required String userId,
    required String hospitalVisitScheduleId,
  });
}

class SurveyGroupLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements SurveyGroupLocalDataSource {
  SurveyGroupLocalDataSourceImpl(super.attachedDatabase);

  late final sf12historyTable = attachedDatabase.sF12SurveyHistories;
  late final medicationAdherenceHistorieTable =
      attachedDatabase.medicationAdherenceSurveyHistories;
  late final hospitalVisitScheduleTable =
      attachedDatabase.hospitalVisitSchedules;
  @override
  Future<SurveyGroupModel> getSurveyGroup({
    required String userId,
    required String hospitalVisitScheduleId,
  }) async {
    final result = await (select(sf12historyTable).join(
      [
        leftOuterJoin(
          medicationAdherenceHistorieTable,
          medicationAdherenceHistorieTable.hospitalVisitScheduleId.equalsExp(
            sf12historyTable.hospitalVisitScheduleId,
          ),
        ),
        leftOuterJoin(
          hospitalVisitScheduleTable,
          hospitalVisitScheduleTable.id
              .equalsExp(sf12historyTable.hospitalVisitScheduleId),
          useColumns: true,
        ),
      ],
    )
          ..where(
            sf12historyTable.hospitalVisitScheduleId.equals(
                  hospitalVisitScheduleId,
                ) &
                hospitalVisitScheduleTable.userId.equals(
                  userId,
                ),
          )
          ..orderBy([
            OrderingTerm.asc(hospitalVisitScheduleTable.reservedAt),
          ]))
        .getSingle();

    return SurveyGroupModel(
      reseverdAt: result.readTable(hospitalVisitScheduleTable).reservedAt,
      visitedAt: result.readTable(hospitalVisitScheduleTable).visitedAt,
      sf12surveyHistoryModel: result.readTable(sf12historyTable),
      medicationAdherenceSurveyHistoryModel:
          result.readTable(medicationAdherenceHistorieTable),
    );
  }

  @override
  Future<List<SurveyGroupModel>> getSurveyGroups({
    required String userId,
  }) async {
    final results = await (select(sf12historyTable).join(
      [
        leftOuterJoin(
          medicationAdherenceHistorieTable,
          medicationAdherenceHistorieTable.hospitalVisitScheduleId.equalsExp(
            sf12historyTable.hospitalVisitScheduleId,
          ),
        ),
        leftOuterJoin(
          hospitalVisitScheduleTable,
          hospitalVisitScheduleTable.id
              .equalsExp(sf12historyTable.hospitalVisitScheduleId),
          useColumns: true,
        ),
      ],
    )
          ..where(
            hospitalVisitScheduleTable.userId.equals(userId) &
                hospitalVisitScheduleTable.visitedAt.isNull(),
          )
          ..orderBy([
            OrderingTerm.asc(hospitalVisitScheduleTable.reservedAt),
          ]))
        .get();

    return results
        .map(
          (result) => SurveyGroupModel(
            reseverdAt: result.readTable(hospitalVisitScheduleTable).reservedAt,
            visitedAt: result.readTable(hospitalVisitScheduleTable).visitedAt,
            sf12surveyHistoryModel: result.readTable(sf12historyTable),
            medicationAdherenceSurveyHistoryModel:
                result.readTable(medicationAdherenceHistorieTable),
          ),
        )
        .toList();
  }
}
