// Project imports:
import 'package:yak/core/database/database.dart';

class SF12SurveyModel {
  const SF12SurveyModel({
    required this.history,
    required this.answers,
  });

  final SF12SurveyHistoryModel history;
  final List<SF12SurveyAnswerModel> answers;
}
