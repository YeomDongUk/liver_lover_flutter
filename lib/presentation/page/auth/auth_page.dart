// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/auto_login.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/auto_login/auto_login_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AutoLoginCubit autoLoginCubit;

  @override
  void initState() {
    autoLoginCubit = AutoLoginCubit(
      autoLogin: KiwiContainer().resolve<AutoLogin>(),
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(
          const Duration(milliseconds: 1500),
          autoLoginCubit.login,
        ).then((value) => null);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    autoLoginCubit.close();
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
                      return const SizedBox();
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
