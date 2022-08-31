// import 'package:dartz/dartz.dart';
// import 'package:yak/core/error/failure.dart';

// abstract class SF12SurveyHistoryRepository {
//   Future<Either<Failure,Sf12SurveyHistor
// }

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_survey_history.dart';

abstract class SF12SurveyHistoryRepository {
  Future<Either<Failure, List<SF12SurveyHistory>>> getSurveyGroupsStream();
  Future<Either<Failure, SF12SurveyHistory>> getSurveyHistory({
    required String scheduleId,
  });
}
