part of 'medication_adherence_survey_cubit.dart';

class MedicationAdherenceSurveyAnswerCreateState extends Equatable {
  const MedicationAdherenceSurveyAnswerCreateState({
    this.answers = const ['0', '0', '0', '0', '0', '0', '0', '0'],
  });
  final List<String> answers;

  MedicationAdherenceSurveyAnswerCreateState copyWith({
    List<String>? answers,
  }) =>
      MedicationAdherenceSurveyAnswerCreateState(
        answers: answers ?? this.answers,
      );

  int get _questionLength => medicationAdherenceSurveyQuestions.length;
  int get _answerLength => answers.length;
  bool get canSubmit => _questionLength == _answerLength;

  @override
  List<Object> get props => [answers];
}
