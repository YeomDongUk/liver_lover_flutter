// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/medication_adherence_survey_history/medication_adherence_survey_history.dart';

@DataClassName('MedicationAdherenceSurveyAnswerModel')
class MedicationAdherenceSurveyAnswers extends CommonTable {
  TextColumn get medicationAdherenceSurveyHistoryId =>
      text().references(MedicationAdherenceSurveyHistories, #id)();
  IntColumn get questionId => integer()();
  TextColumn get answers => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          medicationAdherenceSurveyHistoryId,
          questionId,
        }
      ];
}
