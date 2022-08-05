// Package imports:
import 'package:equatable/equatable.dart';

class MedicationAdherenceSurveyQuestion extends Equatable {
  const MedicationAdherenceSurveyQuestion({
    required this.id,
    required this.question,
    required this.options,
  });

  factory MedicationAdherenceSurveyQuestion.fromJson(
    Map<String, dynamic> json,
  ) =>
      MedicationAdherenceSurveyQuestion(
        id: json['id'] as int,
        question: json['question'] as String,
        options: json['options'] as List<String>,
      );

  final int id;
  final String question;
  final List<String> options;

  @override
  List<Object?> get props => [
        id,
        question,
        options,
      ];
}
