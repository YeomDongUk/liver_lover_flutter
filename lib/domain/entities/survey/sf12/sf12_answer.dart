// Package imports:
import 'package:equatable/equatable.dart';

class SF12Answer extends Equatable {
  const SF12Answer({
    required this.id,
    required this.questionId,
    required this.answers,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final int questionId;
  final List<int> answers;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        questionId,
        answers,
        createdAt,
        updatedAt,
      ];
}
