// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/survey/medication_adherence_survey_answer/medication_adherence_survey_answer_repository.dart';

class CreateMedicationAdherenceSurveyAnswers
    extends UseCase<int, List<MedicationAdherenceSurveyAnswersCompanion>> {
  const CreateMedicationAdherenceSurveyAnswers({
    required this.medicationAdherenceSurveyAnswerRepository,
  });

  final MedicationAdherenceSurveyAnswerRepository
      medicationAdherenceSurveyAnswerRepository;

  @override
  Future<Either<Failure, int>> call(
    List<MedicationAdherenceSurveyAnswersCompanion> params,
  ) =>
      medicationAdherenceSurveyAnswerRepository.createAnswers(
        companions: params,
      );
}
