// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';

class SurveyCheckView extends StatelessWidget {
  const SurveyCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyGroupsCubit, SurveyGroupsState>(
      builder: (context, state) {
        final groups =
            state.groups.where((element) => element.visitedAt == null);

        if (groups.isEmpty) {
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
                            '외래/검진 등록 후 설문이 가능합니다.',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                          const SizedBox(height: 6),
                          BlocBuilder<CurrentTimeCubit, DateTime>(
                            builder: (context, _) => Text(
                              '외래/검진 일정을 등록하세요.',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.magenta,
                              ).rixMGoB,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Expanded(
                          child: _SurveyStateButton(
                            done: false,
                            isBetweenSurveyDateTime: false,
                            surveyName: '삶의 질(SF-12)',
                          ),
                        ),
                        SizedBox(
                          height: 67,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          child: _SurveyStateButton(
                            done: false,
                            isBetweenSurveyDateTime: false,
                            surveyName: '복약순응도',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }

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
                          !group.isBetweenSurveyDateTime
                              ? '설문은 외래/검진 예약일 3일전 부터 가능합니다.'
                              : !group.sf12surveyHistory.done
                                  ? '외래/검진 일정 전에 설문을 완료해주세요.'
                                  : '모든 설문이 완료되었습니다.',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 6),
                        BlocBuilder<CurrentTimeCubit, DateTime>(
                          builder: (context, _) => Text(
                            !group.isBetweenSurveyDateTime
                                ? '다음 외래/검진 예약일은 [${DateFormat('yyyy.MM.dd').format(group.reseverdAt)}] 입니다.'
                                : !group.sf12surveyHistory.done
                                    ? '외래/검진 일정까지 ${DdayParser.parseDday(group.reseverdAt).replaceAll('D-', '')}일 남았습니다.'
                                    : '외래/검진 시 담당의에게 결과를 제시해 주세요.',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.magenta,
                            ).rixMGoB,
                          ),
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
                    child: BlocBuilder<CurrentTimeCubit, DateTime>(
                      builder: (context, _) => Row(
                        children: [
                          Expanded(
                            child: _SurveyStateButton(
                              onTap: () => context.beamToNamed(
                                '${Routes.sf12Surveys}/${group.sf12surveyHistory.id}${group.sf12surveyHistory.done ? Routes.answers : Routes.answerCreate}',
                              ),
                              isBetweenSurveyDateTime:
                                  group.isBetweenSurveyDateTime,
                              surveyName: '삶의 질(SF-12)',
                              done: group.sf12surveyHistory.done,
                            ),
                          ),
                          SizedBox(
                            height: group.visitedAt == null &&
                                    !group.isBetweenSurveyDateTime
                                ? 67
                                : 98,
                            child: const VerticalDivider(
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Expanded(
                            child: _SurveyStateButton(
                              onTap: () {
                                // print(Routes.sf12SurveyAnswerCreate);
                                // context.beamToNamed(
                                //   '${Routes.sf12Surveys}/${group.sf12surveyHistory.id}${Routes.answerCreate}',
                                // );
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
      onTap: isBetweenSurveyDateTime || done ? onTap : null,
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
                color: !done && !isBetweenSurveyDateTime
                    ? AppColors.gray
                    : Theme.of(context).primaryColor,
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
