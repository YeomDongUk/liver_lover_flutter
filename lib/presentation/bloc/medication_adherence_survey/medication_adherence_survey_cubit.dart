// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/create_medication_adherence_survey_answers.dart';

part 'medication_adherence_survey_state.dart';

class MedicationAdherenceSurveyAnswerCreateCubit
    extends Cubit<MedicationAdherenceSurveyAnswerCreateState> {
  MedicationAdherenceSurveyAnswerCreateCubit({
    required this.surveyId,
    required this.createMedicationAdherenceSurveyAnswers,
  }) : super(const MedicationAdherenceSurveyAnswerCreateState());

  final String surveyId;
  final CreateMedicationAdherenceSurveyAnswers
      createMedicationAdherenceSurveyAnswers;

  void updateAnswer({
    required int id,
    required String answer,
  }) {
    if (state.answers[id] == answer) return;

    final answers = List<String>.from(state.answers).toList()..[id] = answer;

    emit(
      MedicationAdherenceSurveyAnswerCreateState(answers: answers),
    );
  }

  Future<int?> submit() async {
    final either = await createMedicationAdherenceSurveyAnswers.call(
      List.generate(
        state.answers.length,
        (index) => MedicationAdherenceSurveyAnswersCompanion.insert(
          medicationAdherenceSurveyHistoryId: surveyId,
          questionId: index,
          answers: state.answers[index],
        ),
      ),
    );
    final result = either.fold((l) => l, (r) => r);

    if (result is int) {
      return result;
    }

    return null;
  }
}
