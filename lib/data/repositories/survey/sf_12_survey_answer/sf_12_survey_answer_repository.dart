// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/sf12_survey/sf_12_survey_answer_local_data_source.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_answer.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';

class SF12SurveyAnswerRepositoryImpl implements SF12SurveyAnswerRepository {
  SF12SurveyAnswerRepositoryImpl({
    required this.userId,
    required this.sf12SurveyAnswerLocalDataSource,
  });

  final UserId userId;
  String get _userId => userId.value;
  final SF12SurveyAnswerLocalDataSource sf12SurveyAnswerLocalDataSource;
  @override
  Future<Either<Failure, int>> createAnswers({
    required List<SF12SurveyAnswersCompanion> companions,
  }) async {
    try {
      final surveyAnswerModels =
          await sf12SurveyAnswerLocalDataSource.createSurveyAnswers(
        userId: userId.value,
        surveyHistoryId: companions.first.sf12SurveyHistoryId.value,
        companions: companions,
      );
      return Right(surveyAnswerModels.length);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<SF12Answer>>> getAnswers({
    required String surveyId,
  }) async {
    final surveyAnswerModels =
        await sf12SurveyAnswerLocalDataSource.getSurveyAnswers(
      userId: _userId,
      surveyHistoryId: surveyId,
    );

    return Right(
      surveyAnswerModels
          .map(
            (e) => SF12Answer(
              id: e.id,
              questionId: e.questionId,
              answers: e.answers.split(',').map(int.parse).toList(),
              createdAt: e.createdAt,
              updatedAt: e.updatedAt,
            ),
          )
          .toList(),
    );
  }
}
