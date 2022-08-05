// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_answer.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';

class GetSF12SurveyAnswers extends UseCase<List<SF12Answer>, String> {
  const GetSF12SurveyAnswers({
    required this.sf12SurveyAnswerRepository,
  });

  final SF12SurveyAnswerRepository sf12SurveyAnswerRepository;

  @override
  Future<Either<Failure, List<SF12Answer>>> call(String params) =>
      sf12SurveyAnswerRepository.getAnswers(surveyId: params);
}
