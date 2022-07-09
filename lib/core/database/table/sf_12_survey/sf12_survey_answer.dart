import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';
import 'package:yak/core/database/table/sf_12_survey/sf12_survey_history_table.dart';

@DataClassName('SF12SurveyAnswerModel')
class SF12SurveyAnswers extends CommonTable {
  TextColumn get sf12SurveyHistoryId =>
      text().references(SF12SurveyHistories, #id)();
  IntColumn get questionId => integer()();
  TextColumn get answers => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          sf12SurveyHistoryId,
          questionId,
        }
      ];
}
