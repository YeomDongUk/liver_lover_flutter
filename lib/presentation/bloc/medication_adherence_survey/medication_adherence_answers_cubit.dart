// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_answer.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/get_medication_adherence_survey_answers.dart';

part 'medication_adherence_answers_state.dart';

class MedicationAdherenceAnswersCubit
    extends Cubit<MedicationAdherenceAnswersState> {
  MedicationAdherenceAnswersCubit({
    required this.surveyId,
    required this.getMedicationAdherenceSurveyAnswers,
  }) : super(const MedicationAdherenceAnswersState());

  final String surveyId;
  final GetMedicationAdherenceSurveyAnswers getMedicationAdherenceSurveyAnswers;

  Future<void> load() async {
    emit(
      state.copyWith(
        status: MedicationAdherenceAnswersStatus.loadInProgress,
      ),
    );

    final either = await getMedicationAdherenceSurveyAnswers.call(surveyId);

    emit(
      either.fold(
        (l) => state.copyWith(
          status: MedicationAdherenceAnswersStatus.loadFailure,
          answers: [],
        ),
        (r) => state.copyWith(
          status: MedicationAdherenceAnswersStatus.loadSuccess,
          answers: r,
        ),
      ),
    );
  }

  Future<void> refresh() async {
    emit(
      state.copyWith(status: MedicationAdherenceAnswersStatus.loadInProgress),
    );

    final either = await getMedicationAdherenceSurveyAnswers.call(surveyId);

    emit(
      either.fold(
        (l) => state.copyWith(
          status: MedicationAdherenceAnswersStatus.loadFailure,
          answers: [],
        ),
        (r) => state.copyWith(
          status: MedicationAdherenceAnswersStatus.loadSuccess,
          answers: r,
        ),
      ),
    );
  }
}
