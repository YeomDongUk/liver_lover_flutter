// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_answer.dart';
import 'package:yak/domain/repositories/survey/medication_adherence_survey_answer/medication_adherence_survey_answer_repository.dart';

class GetMedicationAdherenceSurveyAnswers
    extends UseCase<List<MedicationAdherenceAnswer>, String> {
  const GetMedicationAdherenceSurveyAnswers({
    required this.medicationAdherenceSurveyAnswerRepository,
  });

  final MedicationAdherenceSurveyAnswerRepository
      medicationAdherenceSurveyAnswerRepository;

  @override
  Future<Either<Failure, List<MedicationAdherenceAnswer>>> call(
    String params,
  ) =>
      medicationAdherenceSurveyAnswerRepository.getAnswers(
        surveyId: params,
      );
}
