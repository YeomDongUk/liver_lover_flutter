// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/sf_12_survey/sf_12_survey_answer_create_page.dart';
import 'package:yak/presentation/page/sf_12_survey/sf_12_survey_answer_detail_page.dart';

class SF12SurveyLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.pathParameters['id'];
    final hasAnswersPath =
        state.pathPatternSegments.contains(Routes.answers.replaceAll('/', ''));
    final hasCreatePath =
        state.pathPatternSegments.contains(Routes.create.replaceAll('/', ''));

    return [
      ...HomeLocation().buildPages(context, state),
      if (id != null) ...[
        if (hasAnswersPath && hasCreatePath)
          BeamPage(
            type: BeamPageType.cupertino,
            key: const ValueKey('sf-12-survey-answer-create'),
            name: 'sf12SurveyAnswerCreatePage',
            title: '',
            child: SF12SurveyAnswerCreatePage(
              surveyId: id,
            ),
          )
        else if (hasAnswersPath)
          BeamPage(
            type: BeamPageType.slideTransition,
            key: const ValueKey('sf-12-survey-answer-detail'),
            name: 'sf12SurveyAnswerDetailPage',
            title: '',
            child: SF12SurveyAnswerDetailPage(
              surveyId: id,
            ),
          )
      ],
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '${Routes.sf12Surveys}/:id${Routes.answers}',
        '${Routes.sf12Surveys}/:id${Routes.answerCreate}',
        '${Routes.sf12Surveys}/:id',
      ];
}
