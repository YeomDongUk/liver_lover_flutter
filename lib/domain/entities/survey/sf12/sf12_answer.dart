import 'package:equatable/equatable.dart';

class SF12Answer extends Equatable {
  const SF12Answer({
    required this.id,
    required this.questionId,
    required this.answers,
  });

  final String id;
  final int questionId;
  final List<int> answers;

  @override
  List<Object?> get props => [
        id,
        questionId,
        answers,
      ];
}
