import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/auth/auth_page.dart';
import 'package:yak/presentation/page/auth/join/join_page.dart';
import 'package:yak/presentation/page/auth/login/login_page.dart';

/// 인증 로케이션
class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('auth'),
          name: 'authPage',
          title: '스플래시',
          child: AuthPage(),
        ),
        if (state.pathPatternSegments.contains('login'))
          const BeamPage(
            type: BeamPageType.cupertino,
            key: ValueKey('login'),
            name: 'loginPage',
            title: '로그인 페이지',
            child: LoginPage(),
          ),
        if (state.pathPatternSegments.contains('join'))
          const BeamPage(
            type: BeamPageType.cupertino,
            key: ValueKey('join'),
            name: 'joinPage',
            title: '회원가입 페이지',
            child: JoinPage(),
          )
      ];

  @override
  List<Pattern> get pathPatterns => [
        Routes.auth,
        Routes.login,
        Routes.join,
      ];
}
