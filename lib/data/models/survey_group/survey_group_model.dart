// Project imports:
import 'package:yak/core/database/database.dart';

class SurveyGroupModel {
  const SurveyGroupModel({
    required this.reseverdAt,
    required this.visitedAt,
    required this.sf12surveyHistoryModel,
    required this.medicationAdherenceSurveyHistoryModel,
  });

  final DateTime reseverdAt;
  final DateTime? visitedAt;
  final SF12SurveyHistoryModel sf12surveyHistoryModel;
  final MedicationAdherenceSurveyHistoryModel
      medicationAdherenceSurveyHistoryModel;
}
