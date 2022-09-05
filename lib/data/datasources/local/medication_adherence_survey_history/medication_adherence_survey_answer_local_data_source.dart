// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class MedicationAdherenceSurveyAnswerLocalDataSource {
  Future<List<MedicationAdherenceSurveyAnswerModel>> createSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
    required List<MedicationAdherenceSurveyAnswersCompanion> companions,
  });
  Future<List<MedicationAdherenceSurveyAnswerModel>> getSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
  });
}

class MedicationAdherenceSurveyAnswerLocalDataSourceImpl
    extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements MedicationAdherenceSurveyAnswerLocalDataSource {
  MedicationAdherenceSurveyAnswerLocalDataSourceImpl(super.attachedDatabase);
  late final table = attachedDatabase.medicationAdherenceSurveyAnswers;
  late final surveyTable = attachedDatabase.medicationAdherenceSurveyHistories;
  late final sf12SurveyTable = attachedDatabase.sF12SurveyHistories;

  @override
  Future<List<MedicationAdherenceSurveyAnswerModel>> createSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
    required List<MedicationAdherenceSurveyAnswersCompanion> companions,
  }) =>
      transaction(
        () async {
          await batch((batch) => batch.insertAll(table, companions));

          await (update(surveyTable)
                ..where((t) => t.id.equals(surveyHistoryId)))
              .write(
            const MedicationAdherenceSurveyHistoriesCompanion(
              done: Value(true),
            ),
          );

          final groupedSurvey = await (select(surveyTable).join(
            [
              leftOuterJoin(
                sf12SurveyTable,
                sf12SurveyTable.hospitalVisitScheduleId
                    .equalsExp(surveyTable.hospitalVisitScheduleId),
              )
            ],
          )..where(surveyTable.id.equals(surveyHistoryId)))
              .getSingle();

          final forignId =
              groupedSurvey.read(surveyTable.hospitalVisitScheduleId)!;
          final maSurveyDone = groupedSurvey.read(surveyTable.done)!;
          final sf12SurveyDone =
              groupedSurvey.read(sf12SurveyTable.done) ?? false;

          if (sf12SurveyDone && maSurveyDone) {
            final userPoint = await (select(userPoints)
                  ..where((tbl) => tbl.userId.equals(userId)))
                .getSingle();

            await (update(userPoints)
                  ..where((tbl) => tbl.userId.equals(userId)))
                .write(
              UserPointsCompanion(
                point: Value(userPoint.point + 30),
                updatedAt: Value(DateTime.now()),
              ),
            );
            await into(pointHistories).insert(
              PointHistoriesCompanion.insert(
                userId: userId,
                forginId: forignId,
                event: PointHistoryEvent.surveyComplete,
                point: 30,
                createdAt: Value(DateTime.now()),
                updatedAt: Value(DateTime.now()),
              ),
            );
          }
          return (select(table)
                ..where(
                  (t) => t.medicationAdherenceSurveyHistoryId
                      .equals(surveyHistoryId),
                )
                ..orderBy([
                  (t) => OrderingTerm.asc(t.questionId),
                ]))
              .get();
        },
      );
  @override
  Future<List<MedicationAdherenceSurveyAnswerModel>> getSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
  }) =>
      (select(table)
            ..where(
              (t) =>
                  t.medicationAdherenceSurveyHistoryId.equals(surveyHistoryId),
            )
            ..orderBy([
              (t) => OrderingTerm.asc(t.questionId),
            ]))
          .get();
}
