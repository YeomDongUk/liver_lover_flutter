// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';

class CreateSF12SurveyAnswers
    extends UseCase<int, List<SF12SurveyAnswersCompanion>> {
  const CreateSF12SurveyAnswers({
    required this.sf12SurveyAnswerRepository,
  });

  final SF12SurveyAnswerRepository sf12SurveyAnswerRepository;

  @override
  Future<Either<Failure, int>> call(List<SF12SurveyAnswersCompanion> params) =>
      sf12SurveyAnswerRepository.createAnswers(companions: params);
}
