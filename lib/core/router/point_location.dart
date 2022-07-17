import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/point/point_history_page.dart';
import 'package:yak/presentation/page/point/point_information_page.dart';

class PointLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      if (Routes.pointHistory == state.uri.path)
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('point-history'),
          name: 'PointHistoryPage',
          title: '포인트 히스토리',
          child: PointHistoryPage(),
        ),
      if (Routes.pointInformation == state.uri.path)
        const BeamPage(
          type: BeamPageType.slideTransition,
          key: ValueKey('point-information'),
          name: 'PointInformationPage',
          title: '포인트 히스토리',
          child: PointInformationPage(),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.pointInformation,
        Routes.pointHistory,
      ];
}
