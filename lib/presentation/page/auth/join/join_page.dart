// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/create_user.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/join/join_cubit.dart';
import 'package:yak/presentation/bloc/auth/join/join_form.dart';
import 'package:yak/presentation/widget/auth/join/join_input_form_widget.dart';
import 'package:yak/presentation/widget/auth/join/join_register_pin_code_form_widget.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  late final JoinCubit joinCubit;

  @override
  void initState() {
    joinCubit = JoinCubit(
      authCubit: context.read<AuthCubit>(),
      createUser: KiwiContainer().resolve<CreateUser>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    joinCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<JoinCubit>.value(
          value: joinCubit,
          child: BlocBuilder<JoinCubit, JoinState>(
            bloc: joinCubit,
            buildWhen: (prev, curr) => prev.joinForm != curr.joinForm,
            builder: (context, state) {
              if (state.joinForm == JoinForm.inputing) {
                return const JoinInputFormWidget();
              }

              if (state.joinForm == JoinForm.registeringPin) {
                return const JoinRegisterPinCodeFormWidget(isVerifing: false);
              }

              if (state.joinForm == JoinForm.verifingPin) {
                return const JoinRegisterPinCodeFormWidget(isVerifing: true);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '사용자 등록이\n완료되었습니다.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoL,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '안전한 사용을 위하여\nPIN 번호는 중요하게 \n관리해 주세요.',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      fixedSize: const Size.fromHeight(70),
                    ),
                    onPressed: context.read<AuthCubit>().state.user.id != '-'
                        ? () => context.beamToReplacementNamed(Routes.home)
                        : null,
                    child: Text(
                      '홈으로',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ).rixMGoB,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
