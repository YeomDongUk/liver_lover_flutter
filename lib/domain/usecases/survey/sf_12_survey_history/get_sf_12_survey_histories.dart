import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_survey_history.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_history/sf_12_survey_history_repository.dart';

class GetSF12SurveyHistories extends UseCase<List<SF12SurveyHistory>, void> {
  const GetSF12SurveyHistories(this.sf12surveyHistoryRepository);

  final SF12SurveyHistoryRepository sf12surveyHistoryRepository;

  @override
  Future<Either<Failure, List<SF12SurveyHistory>>> call(void params) =>
      sf12surveyHistoryRepository.getSurveyHistories();
}
