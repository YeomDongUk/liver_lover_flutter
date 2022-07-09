import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';

abstract class SurveyGroupRepository {
  Future<Either<Failure, List<SurveyGroup>>> getSurveyHistories();

  Future<Either<Failure, SurveyGroup>> getSurveyHistory({
    required String scheduleId,
  });
}
