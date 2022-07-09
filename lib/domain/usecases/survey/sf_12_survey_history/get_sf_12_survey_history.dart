import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_survey_history.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_history/sf_12_survey_history_repository.dart';

class GetSF12SurveyHistory extends UseCase<SF12SurveyHistory, String> {
  const GetSF12SurveyHistory(this.sf12surveyHistoryRepository);

  final SF12SurveyHistoryRepository sf12surveyHistoryRepository;

  @override
  Future<Either<Failure, SF12SurveyHistory>> call(String params) =>
      sf12surveyHistoryRepository.getSurveyHistory(scheduleId: params);
}
