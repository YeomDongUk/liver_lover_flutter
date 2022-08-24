// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/survey_group/survey_group_empty_widget.dart';
import 'package:yak/presentation/widget/survey_group/survey_group_widget.dart';

class SurveyCheckView extends StatelessWidget {
  const SurveyCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyGroupsCubit, SurveyGroupsState>(
      builder: (context, state) {
        final groups = state.groups.where(
          (element) =>
              element.visitedAt == null &&
              element.reseverdAt.isAfter(DateTime.now()),
        );

        if (groups.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HomeLabel(
                  primaryText: '설문',
                ),
              ),
              SizedBox(height: 10),
              SurveyGroupEmptyWidget(),
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
            SurveyGroupWidget(group: group),
          ],
        );
      },
    );
  }
}
