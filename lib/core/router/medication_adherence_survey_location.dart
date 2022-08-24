// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/medication_adherence_survey/medication_adherence_survey_answer_create_page.dart';
import 'package:yak/presentation/page/medication_adherence_survey/medication_adherence_survey_answer_detail_page.dart';

class MedicationAdherenceSurveyLocation extends BeamLocation<BeamState> {
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
            key: const ValueKey('medication-adherence-survey-answer-create'),
            name: 'medicationAdherenceSurveyAnswerCreatePage',
            title: '',
            child: MedicationAdherenceSurveyAnswerCreatePage(
              surveyId: id,
            ),
          )
        else if (hasAnswersPath)
          BeamPage(
            type: BeamPageType.slideTransition,
            key: const ValueKey('medication-adherence-survey-answer-detail'),
            name: 'medicationAdherenceSurveyAnswerDetailPage',
            title: '',
            child: MedicationAdherenceSurveyAnswerDetailPage(
              surveyId: id,
            ),
          )
      ],
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '${Routes.medicationAdherenceSurveys}/:id${Routes.answers}',
        '${Routes.medicationAdherenceSurveys}/:id${Routes.answerCreate}',
        '${Routes.medicationAdherenceSurveys}/:id',
      ];
}
