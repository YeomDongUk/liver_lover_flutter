// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/survey_group/survey_group_empty_widget.dart';
import 'package:yak/presentation/widget/survey_group/survey_group_widget.dart';

class SurveyGroupsScreen extends StatefulWidget {
  const SurveyGroupsScreen({
    super.key,
  });

  @override
  State<SurveyGroupsScreen> createState() => _SurveyGroupsScreenState();
}

class _SurveyGroupsScreenState extends State<SurveyGroupsScreen>
    with AutomaticKeepAliveClientMixin {
  late final SurveyGroupsCubit surveyGroupsCubit;

  @override
  void initState() {
    surveyGroupsCubit = context.read<SurveyGroupsCubit>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SurveyGroupsCubit, SurveyGroupsState>(
      bloc: surveyGroupsCubit,
      builder: (context, state) => state.groups.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 24),
              alignment: Alignment.topCenter,
              child: const SurveyGroupEmptyWidget(
                isShownBtn: true,
              ),
            )
          : ListView.separated(
              itemCount: state.groups.length,
              padding: const EdgeInsets.symmetric(vertical: 24),
              itemBuilder: (context, index) =>
                  SurveyGroupWidget(group: state.groups[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
