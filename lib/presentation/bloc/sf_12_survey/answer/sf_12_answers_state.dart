part of 'sf_12_answers_cubit.dart';

enum SF12AnswersStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class SF12AnswersState extends Equatable {
  const SF12AnswersState({
    this.status = SF12AnswersStatus.initial,
    this.answers = const [],
  });

  final SF12AnswersStatus status;
  final List<SF12Answer> answers;

  SF12AnswersState copyWith({
    SF12AnswersStatus? status,
    List<SF12Answer>? answers,
  }) =>
      SF12AnswersState(
        status: status ?? this.status,
        answers: answers ?? this.answers,
      );

  @override
  List<Object> get props => [
        status,
        answers,
      ];
}
