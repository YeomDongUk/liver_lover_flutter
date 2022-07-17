part of 'health_question_write_cubit.dart';

class WriteHealthQuestionState extends Equatable {
  const WriteHealthQuestionState({
    this.status = FormzStatus.pure,
    this.question = '',
  });
  final FormzStatus status;
  final String question;

  WriteHealthQuestionState copyWith({
    FormzStatus? status,
    String? question,
  }) =>
      WriteHealthQuestionState(
        status: status ?? this.status,
        question: question ?? this.question,
      );

  @override
  List<Object> get props => [
        status,
        question,
      ];
}
