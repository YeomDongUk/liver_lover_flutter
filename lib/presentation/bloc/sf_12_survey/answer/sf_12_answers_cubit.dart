// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/survey/sf12/sf12_answer.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/get_sf_12_survey_answers.dart';

part 'sf_12_answers_state.dart';

class SF12AnswersCubit extends Cubit<SF12AnswersState> {
  SF12AnswersCubit({required this.surveyId, required this.getSF12SurveyAnswers})
      : super(const SF12AnswersState());

  final String surveyId;
  final GetSF12SurveyAnswers getSF12SurveyAnswers;

  Future<void> load() async {
    emit(state.copyWith(status: SF12AnswersStatus.loadInProgress));

    final either = await getSF12SurveyAnswers.call(surveyId);

    emit(
      either.fold(
        (l) => state.copyWith(
          status: SF12AnswersStatus.loadFailure,
          answers: [],
        ),
        (r) => state.copyWith(
          status: SF12AnswersStatus.loadSuccess,
          answers: r,
        ),
      ),
    );
  }

  Future<void> refresh() async {
    emit(
      state.copyWith(status: SF12AnswersStatus.loadInProgress),
    );

    final either = await getSF12SurveyAnswers.call(surveyId);

    emit(
      either.fold(
        (l) => state.copyWith(
          status: SF12AnswersStatus.loadFailure,
          answers: [],
        ),
        (r) => state.copyWith(
          status: SF12AnswersStatus.loadSuccess,
          answers: r,
        ),
      ),
    );
  }
}
