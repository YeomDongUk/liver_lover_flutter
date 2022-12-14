// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_survey_history.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_survey_history.dart';

class SurveyGroup extends Equatable {
  const SurveyGroup({
    required this.reseverdAt,
    required this.visitedAt,
    required this.medicationAdherenceSurveyHistory,
    required this.sf12surveyHistory,
  });

  final DateTime reseverdAt;
  final DateTime? visitedAt;
  final MedicationAdherenceSurveyHistory medicationAdherenceSurveyHistory;
  final SF12SurveyHistory sf12surveyHistory;

  SurveyGroup copyWith({
    DateTime? reseverdAt,
    DateTime? visitedAt,
    MedicationAdherenceSurveyHistory? medicationAdherenceSurveyHistory,
    SF12SurveyHistory? sf12surveyHistory,
  }) =>
      SurveyGroup(
        reseverdAt: reseverdAt ?? this.reseverdAt,
        visitedAt: visitedAt ?? this.visitedAt,
        medicationAdherenceSurveyHistory: medicationAdherenceSurveyHistory ??
            this.medicationAdherenceSurveyHistory,
        sf12surveyHistory: sf12surveyHistory ?? this.sf12surveyHistory,
      );

  bool get canSurvey => visitedAt == null && isBetweenSurveyDateTime;

  bool get done =>
      medicationAdherenceSurveyHistory.done && sf12surveyHistory.done;

  bool get isOverdue => reseverdAt.isBefore(DateTime.now());

  bool get isBetweenSurveyDateTime {
    final now = DateTime.now();
    return reseverdAt.isAfter(
          now,
        ) &&
        now.isAfter(
          reseverdAt.add(
            const Duration(days: -3),
          ),
        );
  }

  @override
  List<Object?> get props => [
        reseverdAt,
        visitedAt,
        medicationAdherenceSurveyHistory,
        sf12surveyHistory,
      ];
}
