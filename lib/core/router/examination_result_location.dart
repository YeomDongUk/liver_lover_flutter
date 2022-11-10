// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/examination_result/examination_result_history_page.dart';

class ExaminationResultLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      const BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('examination_result_history'),
        name: 'examination_result_history_page',
        title: '검사 이력 페이지',
        child: ExaminationResultHistoryPage(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.examinationResultHistories,
      ];
}
