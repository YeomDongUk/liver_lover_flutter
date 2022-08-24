// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/get_user.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/login/login_cubit.dart';
import 'package:yak/presentation/widget/auth/key_pad_widget.dart';
import 'package:yak/presentation/widget/auth/pin_code_input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = LoginCubit(
      authCubit: context.read<AuthCubit>(),
      getUser: KiwiContainer().resolve<GetUser>(),
    );
  }

  @override
  void dispose() {
    loginCubit.close();
    super.dispose();
  }

  void onTapNumber(
    String numberString,
  ) {
    if (numberString == '취소') {
      context.beamBack();
      return;
    }
    final prevPinCode = loginCubit.state.pinCode.value;

    final isNotNumber = int.tryParse(numberString) == null;
    if (!isNotNumber && prevPinCode.length >= 6) {
      return;
    }

    final pinCode = isNotNumber
        ? prevPinCode.isEmpty
            ? prevPinCode
            : prevPinCode.substring(
                0,
                prevPinCode.length - 1,
              )
        : prevPinCode.length == 6
            ? prevPinCode
            : prevPinCode + numberString;

    return loginCubit.updatePinCode(pinCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            context.beamToReplacementNamed(Routes.home);
          }

          if (state.status == FormzStatus.submissionFailure) {
            /// TODO: 로그인 실패 액션 필요
            // showAboutDialog(
            //   context: context,
            // );
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              ...[
                Text(
                  'PIN 번호를\n입력해 주세요',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoL,
                ),
                const SizedBox(height: 72),
                BlocBuilder<LoginCubit, LoginState>(
                  bloc: loginCubit,
                  builder: (context, state) => PinCodeInputWidget(
                    visible: true,
                    pinCode: state.pinCode.value,
                  ),
                ),
                const SizedBox(height: 72),
              ].map(
                (e) => e is Spacer
                    ? e
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: e,
                      ),
              ),
              Expanded(
                child: KeyPadWidget(
                  onTapNumber: onTapNumber,
                ),
              ),
              BlocBuilder<LoginCubit, LoginState>(
                bloc: loginCubit,
                buildWhen: (prev, curr) => prev.status != curr.status,
                builder: (context, state) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    fixedSize: const Size.fromHeight(70),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ).rixMGoB,
                  ),
                  onPressed: state.status == FormzStatus.valid
                      ? loginCubit.submit
                      : null,
                  child: const Text('로그인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
