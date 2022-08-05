// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_answer.dart';

abstract class MedicationAdherenceSurveyAnswerRepository {
  Future<Either<Failure, int>> createAnswers({
    required List<MedicationAdherenceSurveyAnswersCompanion> companions,
  });

  Future<Either<Failure, List<MedicationAdherenceAnswer>>> getAnswers({
    required String surveyId,
  });
}
