// ignore_for_file: one_member_abstracts

import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class SF12SurveyAnswerLocalDataSource {
  Future<List<SF12SurveyAnswerModel>> createSurveyAnswers({
    required String surveyHistoryId,
    required List<SF12SurveyAnswersCompanion> companions,
  });
  Future<List<SF12SurveyAnswerModel>> getSurveyAnswers({
    required String userId,
    required String surveyHistoryId,
  });
}

class SF12SurveyAnswerLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements SF12SurveyAnswerLocalDataSource {
  SF12SurveyAnswerLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.sF12SurveyAnswers;
  late final surveyTable = attachedDatabase.sF12SurveyHistories;

  @override
  Future<List<SF12SurveyAnswerModel>> createSurveyAnswers({
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
