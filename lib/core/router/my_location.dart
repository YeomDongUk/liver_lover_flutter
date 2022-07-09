import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/presentation/page/my/my_page.dart';

class MyLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      const BeamPage(
        type: BeamPageType.cupertino,
        key: ValueKey('my'),
        name: 'MyPage',
        title: '내 정보',
        child: MyPage(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '/my',
      ];
}
