part of 'write_health_question_answer_cubit.dart';

class WriteHealthQuestionAnswerState extends Equatable {
  const WriteHealthQuestionAnswerState({
    this.status = FormzStatus.pure,
    this.answer = '',
    this.doctorName = '',
  });

  final FormzStatus status;
  final String answer;
  final String doctorName;

  WriteHealthQuestionAnswerState copyWith({
    FormzStatus? status,
    String? answer,
    String? doctorName,
  }) =>
      WriteHealthQuestionAnswerState(
        status: status ?? this.status,
        answer: answer ?? this.answer,
        doctorName: doctorName ?? this.doctorName,
      );

  @override
  List<Object> get props => [
        status,
        answer,
        doctorName,
      ];
}
