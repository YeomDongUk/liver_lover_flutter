part of 'medication_adherence_survey_create_cubit.dart';

class MedicationAdherenceSurveyAnswerCreateState extends Equatable {
  const MedicationAdherenceSurveyAnswerCreateState({
    this.answers = const ['', '', '', '', '', '', '', ''],
  });
  final List<String> answers;

  MedicationAdherenceSurveyAnswerCreateState copyWith({
    List<String>? answers,
  }) =>
      MedicationAdherenceSurveyAnswerCreateState(
        answers: answers ?? this.answers,
      );

  int get _questionLength => medicationAdherenceSurveyQuestions.length;
  int get _answerLength =>
      answers.where((element) => element.isNotEmpty).length;
  bool get canSubmit => _questionLength == _answerLength;

  @override
  List<Object> get props => [answers];
}
