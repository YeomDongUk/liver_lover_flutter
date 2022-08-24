// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/health_diary/excercise_history/excercise_history_graph_page.dart';

class ExcerciseHistoryLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      const BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('excercise-history-graph-page'),
        name: 'ExcerciseHistoryGraphPage',
        title: '운동 기록 그래프',
        child: ExcerciseHistoryGraphPage(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.excerciseHistories,
        Routes.excerciseHistoriesGraphs,
      ];
}
