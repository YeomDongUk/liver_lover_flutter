// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/survey/survey_group.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/survey_group/survey_stay_button.dart';

class SurveyGroupWidget extends StatelessWidget {
  const SurveyGroupWidget({
    super.key,
    required this.group,
  });

  final SurveyGroup group;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentTimeCubit, DateTime>(
      builder: (context, now) => HomeContainer(
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
                    group.isOverdue
                        ? '완료된 설문입니다.'
                        : group.done
                            ? '모든 설문이 완료되었습니다.'
                            : !group.isBetweenSurveyDateTime
                                ? '설문은 외래/검진 예약일 3일전 부터 가능합니다.'
                                : '외래/검진 일정 전에 설문을 완료해주세요.',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                    ).rixMGoB,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    group.isOverdue
                        ? reservedAtDateFormat.format(group.reseverdAt)
                        : group.done
                            ? '외래/검진 시 담당의에게 결과를 제시해 주세요.'
                            : !group.isBetweenSurveyDateTime
                                ? '다음 외래/검진 예약일은 [${yyyyMMddFormat.format(group.reseverdAt)}] 입니다.'
                                : '외래/검진 일정까지 ${DdayParser.parseDday(group.reseverdAt).replaceAll('D-', '')}일 남았습니다.',
                    style: TextStyle(
                      fontSize: 13,
                      color: group.isOverdue
                          ? AppColors.blueGrayDark
                          : AppColors.magenta,
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
              child: Row(
                children: [
                  Expanded(
                    child: SurveyStateButton(
                      onTap: () => context.beamToNamed(
                        '${Routes.sf12Surveys}/${group.sf12surveyHistory.id}${group.sf12surveyHistory.done ? Routes.answers : Routes.answerCreate}',
                      ),
                      isBetweenSurveyDateTime: group.isBetweenSurveyDateTime,
                      surveyName: '삶의 질(SF-12)',
                      done: group.sf12surveyHistory.done,
                      isOverdue: group.isOverdue,
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
                    child: SurveyStateButton(
                      onTap: () => context.beamToNamed(
                        '${Routes.medicationAdherenceSurveys}/${group.medicationAdherenceSurveyHistory.id}${group.medicationAdherenceSurveyHistory.done ? Routes.answers : Routes.answerCreate}',
                      ),
                      isBetweenSurveyDateTime: group.isBetweenSurveyDateTime,
                      surveyName: '복약 순응도',
                      done: group.medicationAdherenceSurveyHistory.done,
                      isOverdue: group.isOverdue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
