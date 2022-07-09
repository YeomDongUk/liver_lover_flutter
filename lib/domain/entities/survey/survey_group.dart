import 'package:equatable/equatable.dart';
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

  bool get isBetweenSurveyDateTime =>
      DateTime.now().isBefore(
        reseverdAt,
      ) &&
      DateTime.now().isAfter(
        reseverdAt.add(
          const Duration(hours: -3),
        ),
      );
  @override
  List<Object?> get props => [
        reseverdAt,
        visitedAt,
        medicationAdherenceSurveyHistory,
        sf12surveyHistory,
      ];
}
