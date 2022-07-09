import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/domain/repositories/survey/survey_group_repository.dart';

class GetSurveyGroupHistory extends UseCase<SurveyGroup, String> {
  const GetSurveyGroupHistory({
    required this.surveyGroupRepository,
  });

  final SurveyGroupRepository surveyGroupRepository;

  @override
  Future<Either<Failure, SurveyGroup>> call(String params) =>
      surveyGroupRepository.getSurveyHistory(scheduleId: params);
}
