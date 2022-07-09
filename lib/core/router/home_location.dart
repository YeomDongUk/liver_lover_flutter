import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/presentation/page/home/home_page.dart';

/// 홈 로케이션
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('home'),
          name: 'homePage',
          title: '홈페이지',
          child: HomePage(),
        )
      ];

  @override
  List<Pattern> get pathPatterns => ['/'];
}
