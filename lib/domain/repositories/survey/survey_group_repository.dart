// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';

abstract class SurveyGroupRepository {
  Either<Failure, Stream<List<SurveyGroup>>> getSurveyGroupsStream();
}
