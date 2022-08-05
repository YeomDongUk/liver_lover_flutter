// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/domain/repositories/survey/survey_group_repository.dart';

class GetSurveyGroupHistories extends UseCase<List<SurveyGroup>, void> {
  const GetSurveyGroupHistories({
    required this.surveyGroupRepository,
  });

  final SurveyGroupRepository surveyGroupRepository;

  @override
  Future<Either<Failure, List<SurveyGroup>>> call(void params) =>
      surveyGroupRepository.getSurveyHistories();
}
