import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/sf_12_survey/sf_12_survey_answer_create_page.dart';

class SF12SurveyLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.pathParameters['id'];

    return [
      ...HomeLocation().buildPages(context, state),
      if (state.pathPatternSegments.contains('answers') &&
          state.pathPatternSegments.contains('create'))
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('sf-12-survey-answer-create'),
          name: 'sf12SurveyAnswerCreatePage',
          title: '',
          child: SF12SurveyAnswerCreatePage(
            surveyId: id!,
          ),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '${Routes.sf12Surveys}/:id${Routes.answers}',
        '${Routes.sf12Surveys}/:id${Routes.answerCreate}',
      ];
}
