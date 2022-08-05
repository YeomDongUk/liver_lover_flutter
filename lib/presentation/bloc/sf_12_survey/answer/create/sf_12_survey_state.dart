part of 'sf_12_survey_cubit.dart';

class SF12SurveyAnswerCreateState extends Equatable {
  const SF12SurveyAnswerCreateState({
    this.answers = const [[], [], [], [], [], [], []],
  });
  final List<List<String>> answers;
  SF12SurveyAnswerCreateState copyWith({List<List<String>>? answers}) =>
      SF12SurveyAnswerCreateState(
        answers: answers ?? this.answers,
      );
  int get itemCount =>
      sf12Questions.map((e) => e.items == null ? 1 : e.items!.length).fold<int>(
            0,
            (previousValue, element) => previousValue + element,
          );
  int get answersCount => answers
      .where((element) => !element.contains(''))
      .map((e) => e.length)
      .fold<int>(
        0,
        (previousValue, element) => previousValue + element,
      );
  bool get canSubmit => itemCount == answersCount;

  @override
  List<Object> get props => [answers];
}
