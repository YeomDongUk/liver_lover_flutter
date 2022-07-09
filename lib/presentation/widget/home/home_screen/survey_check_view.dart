import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';

class SurveyCheckView extends StatelessWidget {
  const SurveyCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyGroupsCubit, SurveyGroupsState>(
      buildWhen: (previous, current) =>
          previous.groups.isEmpty ||
          current.groups.isEmpty ||
          previous.groups.first != current.groups.first,
      builder: (context, state) {
        final groups =
            state.groups.where((element) => element.visitedAt == null);
        if (groups.isEmpty) return const SizedBox.shrink();

        final group = groups.first;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomeLabel(
                primaryText: '설문',
              ),
            ),
            const SizedBox(height: 10),
            HomeContainer(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          group.sf12surveyHistory.done
                              ? '검진/외래 일정 전에 설문을 완료해주세요.'
                              : '모든 설문이 완료되었습니다.',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          group.sf12surveyHistory.done
                              ? '검진/외래 일정까지 ${DdayParser.parseDday(group.reseverdAt).replaceAll('D-', '')}일 남았습니다.'
                              : '검진/외래 시 담당의에게 결과를 제시해 주세요.',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.magenta,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(6),
                    ),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: _SurveyStateButton(
                              onTap: group.sf12surveyHistory.done
                                  ? null
                                  : () {
                                      // print(Routes.sf12SurveyAnswerCreate);
                                      context.beamToNamed(
                                        '${Routes.sf12Surveys}/${group.sf12surveyHistory.id}${Routes.answerCreate}',
                                      );
                                    },
                              isBetweenSurveyDateTime:
                                  group.isBetweenSurveyDateTime,
                              surveyName: '삶의 질(SF-12)',
                              done: group.sf12surveyHistory.done,
                            ),
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: _SurveyStateButton(
                              onTap: group.medicationAdherenceSurveyHistory.done
                                  ? null
                                  : () {
                                      // print(Routes.sf12SurveyAnswerCreate);
                                      context.beamToNamed(
                                        '${Routes.sf12Surveys}/${group.sf12surveyHistory.id}${Routes.answerCreate}',
                                      );
                                    },
                              isBetweenSurveyDateTime:
                                  group.isBetweenSurveyDateTime,
                              surveyName: '복약 순응도',
                              done: group.medicationAdherenceSurveyHistory.done,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SurveyStateButton extends StatelessWidget {
  const _SurveyStateButton({
    this.onTap,
    required this.surveyName,
    required this.done,
    required this.isBetweenSurveyDateTime,
  });

  final void Function()? onTap;
  final String surveyName;
  final bool done;
  final bool isBetweenSurveyDateTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(6),
      ),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 24,
          bottom: isBetweenSurveyDateTime ? 15 : 24,
        ),
        child: Column(
          children: [
            Text(
              surveyName,
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
            if (isBetweenSurveyDateTime) ...[
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/svg/check.svg',
                color: done ? AppColors.green : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
