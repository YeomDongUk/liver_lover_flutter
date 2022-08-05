// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/create_sf_12_survey_answers.dart';

part 'sf_12_survey_state.dart';

class SF12SurveyAnswerCreateCubit extends Cubit<SF12SurveyAnswerCreateState> {
  SF12SurveyAnswerCreateCubit({
    required this.surveyId,
    required this.createSF12SurveyAnswers,
  }) : super(const SF12SurveyAnswerCreateState());

  final String surveyId;
  final CreateSF12SurveyAnswers createSF12SurveyAnswers;

  void updateAnswer({
    required int id,
    required List<String> answer,
  }) {
    if (listEquals(state.answers[id], answer)) return;

    final answers = List<List<String>>.from(
      state.answers.map(List<String>.from).toList(),
    )..[id] = answer;
    emit(
      SF12SurveyAnswerCreateState(answers: answers),
    );
  }

  Future<int?> submit() async {
    final either = await createSF12SurveyAnswers.call(
      List.generate(
        state.answers.length,
        (index) => SF12SurveyAnswersCompanion.insert(
          sf12SurveyHistoryId: surveyId,
          questionId: index,
          answers: state.answers[index].join(','),
        ),
      ),
    );
    final result = either.fold((l) => l, (r) => r);

    if (result is int) {
      return result;
    }

    return null;
  }
}
