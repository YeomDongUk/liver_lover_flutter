// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/survey_group/survey_stay_button.dart';

class SurveyGroupEmptyWidget extends StatelessWidget {
  const SurveyGroupEmptyWidget({
    super.key,
    this.isShownBtn = false,
  });

  final bool isShownBtn;
  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
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
                child: SurveyStateButton(
                  done: false,
                  isBetweenSurveyDateTime: false,
                  surveyName: '삶의 질(SF-12)',
                  isOverdue: false,
                ),
              ),
              SizedBox(
                height: 67,
                child: VerticalDivider(),
              ),
              Expanded(
                child: SurveyStateButton(
                  done: false,
                  isBetweenSurveyDateTime: false,
                  surveyName: '복약순응도',
                  isOverdue: false,
                ),
              ),
            ],
          ),
          if (isShownBtn) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () =>
                    context.beamToNamed(Routes.hospitalVisitScheduleCreate),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  '외래/검진 일정 등록',
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ).rixMGoEB,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
