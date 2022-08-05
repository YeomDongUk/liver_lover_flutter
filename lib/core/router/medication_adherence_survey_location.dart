// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/medication_adherenece_survey/medication_adherence_survey_answer_create_page.dart';

class MedicationAdherenceSurveyLocation extends BeamLocation<BeamState> {
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
          name: 'medicationAdherenceSurveyAnswerCreatePage',
          title: '',
          child: MedicationAdherenceSurveyAnswerCreatePage(
            surveyId: id!,
          ),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '${Routes.medicationAdherenceSurveys}/:id${Routes.answers}',
        '${Routes.medicationAdherenceSurveys}/:id${Routes.answerCreate}',
      ];
}
