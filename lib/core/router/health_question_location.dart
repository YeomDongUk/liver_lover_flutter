import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/presentation/page/health_diary/health_question/create_health_question_page.dart';
import 'package:yak/presentation/page/health_diary/health_question/health_question_page.dart';
import 'package:yak/presentation/page/health_diary/health_question/update_health_question_page.dart';

class HealthQuestionLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.pathParameters['id'];
    return [
      ...HomeLocation().buildPages(context, state),
      if (state.uri.path == Routes.healthQuestionCreate)
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('create-health-question-page'),
          name: 'CreateHealthQuestionPage',
          title: '건강 질문 생성',
          child: CreateHealthQuestionPage(
            onCreate: data as void Function(HealthQuestion)?,
          ),
        ),
      if (id != null)
        BeamPage(
          type: BeamPageType.slideTransition,
          key: ValueKey('health-question-$id-page'),
          name: 'HealthQuestionPage',
          title: '건강 질문 조회',
          child: HealthQuestionPage(
            id: id,
            healthQuestion: (data as Map<String, dynamic>?)!['healthQuestion']
                as HealthQuestion,
            onUpdate: (data as Map<String, dynamic>?)!['onUpdate'] as void
                Function(HealthQuestion)?,
          ),
        ),
      if (id != null && state.pathPatternSegments.contains('update'))
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('update-health-question-page'),
          name: 'UpdateHealthQuestionPage',
          title: '건강 질문 수정',
          child: UpdateHealthQuestionPage(
            id: id,
            healthQuestion: (data as Map<String, dynamic>?)!['healthQuestion']
                as HealthQuestion,
            onUpdate: (data as Map<String, dynamic>?)!['onUpdate'] as void
                Function(HealthQuestion)?,
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.healthQuestionCreate,
        '${Routes.healthQuestions}/:id${Path.update}',
        '${Routes.healthQuestions}/:id',
      ];
}
