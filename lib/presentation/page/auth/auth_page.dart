// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:version/version.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/auto_login.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/auto_login/auto_login_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late final AutoLoginCubit autoLoginCubit;
  late final animationController = AnimationController(
    vsync: this,
    upperBound: 3,
  );

  bool showDatabseInitialText = false;
  @override
  void initState() {
    autoLoginCubit = AutoLoginCubit(autoLogin: KiwiContainer().resolve<AutoLogin>());

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'liverlover.sqlite'));
        final dbExist = file.existsSync();

        if (!dbExist) {
          setState(() => showDatabseInitialText = true);
          animationController.repeat(min: 0, max: 3, period: const Duration(milliseconds: 2000));
        }

        final packageInfo = await PackageInfo.fromPlatform();
        final version = packageInfo.version;

        await FirebaseRemoteConfig.instance.setDefaults(
          <String, dynamic>{'appVersion': version},
        );

        await FirebaseRemoteConfig.instance.fetchAndActivate();

        final remoteVersion = Version.parse(
          FirebaseRemoteConfig.instance.getValue('appVersion').asString(),
        );

        Logger().i(remoteVersion);

        if (remoteVersion > Version.parse(version)) {
          await showDialog<void>(
            context: context,
            builder: (_) => CommonDialog(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '업데이트 알림',
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.primary,
                    ).rixMGoEB,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '새로운 업데이트가 있어요. 원활한 이용을 위해 앱을 업데이트 해주세요',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.blueGrayLight,
                    ).rixMGoB,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final downloadLinkMap = FirebaseRemoteConfig.instance.getString('downloadLink');

                      // ignore: avoid_dynamic_calls
                      final downloadLink = (jsonDecode(downloadLinkMap)
                          as Map<String, dynamic>)[Platform.isAndroid ? 'android' : 'ios'] as String?;

                      if (downloadLink == null) return;

                      canLaunchUrlString(downloadLink).then(
                        (value) {
                          if (value) launchUrlString(downloadLink);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      '업데이트 하기',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ).rixMGoEB,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          await Future.delayed(
            const Duration(milliseconds: 1500),
            autoLoginCubit.login,
          );
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    autoLoginCubit.close();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AutoLoginCubit, AutoLoginState>(
        bloc: autoLoginCubit,
        listener: (context, state) {
          if (state is AutoLoginSucceess) {
            context.read<AuthCubit>().updateUser(state.user);

            context.beamToReplacementNamed(Routes.home);
          }
        },
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '만성간염관리',
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoB,
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/svg/symbol.svg',
                  width: 147,
                  height: 162,
                ),
                BlocBuilder<AutoLoginCubit, AutoLoginState>(
                  bloc: autoLoginCubit,
                  builder: (context, state) {
                    if (state is! AutoLoginFailure) {
                      return Offstage(
                        offstage: !showDatabseInitialText,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 140),
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                    3,
                                    (index) => Opacity(
                                      opacity: 0,
                                      child: Text(
                                        '.',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: AppColors.primary,
                                        ).rixMGoB,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'DB 초기화 중입니다',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: AppColors.primary,
                                    ).rixMGoB,
                                  ),
                                  ...List.generate(
                                    3,
                                    (index) => Opacity(
                                      opacity: animationController.value.round() > index ? 1 : 0,
                                      child: Text(
                                        '.',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: AppColors.primary,
                                        ).rixMGoB,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        const SizedBox(height: 140),
                        InkWell(
                          onTap: () => context.beamToNamed('login'),
                          child: Padding(
                            padding: const EdgeInsets.all(10.5),
                            child: Text(
                              '등록된 사용자입니다.',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ).rixMGoB,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context.beamToNamed('join'),
                          child: Padding(
                            padding: const EdgeInsets.all(10.5),
                            child: Text(
                              '처음 사용자입니다.',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ).rixMGoB,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
