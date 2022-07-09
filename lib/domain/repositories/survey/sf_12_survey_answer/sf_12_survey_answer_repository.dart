import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_answer.dart';

abstract class SF12SurveyAnswerRepository {
  Future<Either<Failure, int>> createAnswers({
    required List<SF12SurveyAnswersCompanion> companions,
  });

  Future<Either<Failure, List<SF12Answer>>> getAnswers({
    required String surveyId,
  });
}
