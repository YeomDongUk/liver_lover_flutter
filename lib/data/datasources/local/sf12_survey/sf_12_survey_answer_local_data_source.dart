// ignore_for_file: one_member_abstracts

// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class SF12SurveyAnswerLocalDataSource {
  Future<List<SF12SurveyAnswerModel>> createSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
    required List<SF12SurveyAnswersCompanion> companions,
  });
  Future<List<SF12SurveyAnswerModel>> getSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
  });
}

class SF12SurveyAnswerLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements SF12SurveyAnswerLocalDataSource {
  SF12SurveyAnswerLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.sF12SurveyAnswers;
  late final maSurveyTable =
      attachedDatabase.medicationAdherenceSurveyHistories;
  late final surveyTable = attachedDatabase.sF12SurveyHistories;

  @override
  Future<List<SF12SurveyAnswerModel>> createSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
    required List<SF12SurveyAnswersCompanion> companions,
  }) =>
      transaction(
        () async {
          await batch((batch) => batch.insertAll(table, companions));
          await (update(surveyTable)
                ..where((t) => t.id.equals(surveyHistoryId)))
              .write(
            const SF12SurveyHistoriesCompanion(
              done: Value(true),
            ),
          );

          final groupedSurvey = await (select(surveyTable).join(
            [
              leftOuterJoin(
                maSurveyTable,
                maSurveyTable.hospitalVisitScheduleId
                    .equalsExp(surveyTable.hospitalVisitScheduleId),
              )
            ],
          )..where(surveyTable.id.equals(surveyHistoryId)))
              .getSingle();
          final forignId =
              groupedSurvey.read(surveyTable.hospitalVisitScheduleId)!;
          final sf12SurveyDone = groupedSurvey.read(surveyTable.done)!;
          final maSurveyDone = groupedSurvey.read(maSurveyTable.done) ?? false;

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
            await into(attachedDatabase.pointHistories).insert(
              PointHistoriesCompanion.insert(
                userId: userId,
                forginId: forignId,
                event: PointHistoryEvent.surveyComplete,
                point: 30,
              ),
            );
          }

          return (select(table)
                ..where((t) => t.sf12SurveyHistoryId.equals(surveyHistoryId))
                ..orderBy([
                  (t) => OrderingTerm.asc(t.questionId),
                ]))
              .get();
        },
      );
  @override
  Future<List<SF12SurveyAnswerModel>> getSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
  }) =>
      (select(table)
            ..where((t) => t.sf12SurveyHistoryId.equals(surveyHistoryId))
            ..orderBy([
              (t) => OrderingTerm.asc(t.questionId),
            ]))
          .get();
}
