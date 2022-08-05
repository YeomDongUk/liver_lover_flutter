// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/my/my_page.dart';
import 'package:yak/presentation/page/my/update_pin_code_page.dart';

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
      ),
      if (state.uri.path == Routes.myPinCodeUpdate)
        const BeamPage(
          type: BeamPageType.slideTransition,
          key: ValueKey('update-pin-code'),
          name: 'UpdatePinCodePage',
          title: '핀 코드 수정',
          child: UpdatePinCodePage(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.my,
        Routes.myPinCodeUpdate,
      ];
}
