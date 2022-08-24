// Package imports:
import 'package:equatable/equatable.dart';

class MedicationAdherenceAnswer extends Equatable {
  const MedicationAdherenceAnswer({
    required this.id,
    required this.questionId,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final int questionId;
  final int answer;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        questionId,
        answer,
        createdAt,
        updatedAt,
      ];
}
