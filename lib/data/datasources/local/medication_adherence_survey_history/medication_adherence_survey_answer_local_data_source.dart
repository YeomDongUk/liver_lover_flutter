// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class MedicationAdherenceSurveyAnswerLocalDataSource {
  Future<List<MedicationAdherenceSurveyAnswerModel>> createSurveyAnswers({
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
    implements MedicationAdherenceSurveyAnswerLocalDataSource {
  MedicationAdherenceSurveyAnswerLocalDataSourceImpl(super.attachedDatabase);
  late final table = attachedDatabase.medicationAdherenceSurveyAnswers;
  late final surveyTable = attachedDatabase.medicationAdherenceSurveyHistories;

  @override
  Future<List<MedicationAdherenceSurveyAnswerModel>> createSurveyAnswers({
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
