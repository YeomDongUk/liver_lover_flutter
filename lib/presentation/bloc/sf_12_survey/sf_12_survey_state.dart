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

  bool get canSubmit =>
      sf12Questions.map((e) {
        if (e.items == null) {
          return 1;
        } else {
          return e.items!.length;
        }
      }).fold<int>(
        0,
        (previousValue, element) => previousValue + element,
      ) ==
      answers
          .where((element) => !element.contains(''))
          .map((e) => e.length)
          .fold<int>(
            0,
            (previousValue, element) => previousValue + element,
          );

  @override
  List<Object> get props => [answers];
}
