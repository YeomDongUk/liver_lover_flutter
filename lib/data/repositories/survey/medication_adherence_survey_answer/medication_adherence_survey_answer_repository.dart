// Package imports:
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_adherence_survey_history/medication_adherence_survey_answer_local_data_source.dart';
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_answer.dart';
import 'package:yak/domain/repositories/survey/medication_adherence_survey_answer/medication_adherence_survey_answer_repository.dart';

class MedicationAdherenceSurveyAnswerRepositoryImpl
    implements MedicationAdherenceSurveyAnswerRepository {
  MedicationAdherenceSurveyAnswerRepositoryImpl({
    required this.userId,
    required this.medicationAdherenceSurveyAnswerLocalDataSource,
  });

  final UserId userId;
  String get _userId => userId.value;
  final MedicationAdherenceSurveyAnswerLocalDataSource
      medicationAdherenceSurveyAnswerLocalDataSource;
  @override
  Future<Either<Failure, int>> createAnswers({
    required List<MedicationAdherenceSurveyAnswersCompanion> companions,
  }) async {
    try {
      final surveyAnswerModels =
          await medicationAdherenceSurveyAnswerLocalDataSource
              .createSurveyAnswers(
        userId: userId.value,
        surveyHistoryId:
            companions.first.medicationAdherenceSurveyHistoryId.value,
        companions: companions,
      );
      return Right(surveyAnswerModels.length);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<MedicationAdherenceAnswer>>> getAnswers({
    required String surveyId,
  }) async {
    try {
      final surveyAnswerModels =
          await medicationAdherenceSurveyAnswerLocalDataSource.getSurveyAnswers(
        userId: _userId,
        surveyHistoryId: surveyId,
      );

      return Right(
        surveyAnswerModels
            .map(
              (e) => MedicationAdherenceAnswer(
                id: e.id,
                questionId: e.questionId,
                answer: int.parse(e.answers),
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
              ),
            )
            .toList(),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
