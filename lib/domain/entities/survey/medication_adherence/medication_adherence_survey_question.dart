// Package imports:

// Project imports:
import 'package:yak/domain/entities/survey/survey_question.dart';

class MedicationAdherenceSurveyQuestion extends SurveryQuestion {
  const MedicationAdherenceSurveyQuestion({
    required super.id,
    required super.question,
    required super.options,
  });

  factory MedicationAdherenceSurveyQuestion.fromJson(
    Map<String, dynamic> json,
  ) =>
      MedicationAdherenceSurveyQuestion(
        id: json['id'] as int,
        question: json['question'] as String,
        options: json['options'] as List<String>,
      );
}
