// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/health_diary/drinking_history/drinking_history_graph_page.dart';

class DrinkingHistoryLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      const BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('drinking-history-graph-page'),
        name: 'DrinkingHistoryGraphPage',
        title: '음주 기록 그래프',
        child: DrinkingHistoryGraphPage(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.dringkingHistoriesGraphs,
      ];
}
