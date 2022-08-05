// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/join/join_cubit.dart';
import 'package:yak/presentation/widget/auth/key_pad_widget.dart';
import 'package:yak/presentation/widget/auth/pin_code_input_widget.dart';

class JoinRegisterPinCodeFormWidget extends StatelessWidget {
  const JoinRegisterPinCodeFormWidget({
    super.key,
    required this.isVerifing,
  });
  final bool isVerifing;

  void onTapNumber({
    required BuildContext context,
    required String numberString,
  }) {
    if (numberString == '취소') {
      context.beamBack();
      return;
    }

    final joinCubit = context.read<JoinCubit>();

    final prevPinCode = isVerifing
        ? joinCubit.state.verifingPinCode.value
        : joinCubit.state.pinCode.value;

    final isNotNumber = int.tryParse(numberString) == null;
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

    return isVerifing
        ? joinCubit.updateverifingPinCode(pinCode)
        : joinCubit.updatePinCode(pinCode);
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final joinCubit = context.read<JoinCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 50),
        ...[
          Text(
            isVerifing ? '동일한 PIN 번호를\n재입력해 주세요' : 'PIN 번호를\n생성해주세요',
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ).rixMGoL,
          ),
          const SizedBox(height: 72),
          BlocBuilder<JoinCubit, JoinState>(
            builder: (context, state) => PinCodeInputWidget(
              visible: true,
              pinCode:
                  (isVerifing ? state.verifingPinCode : state.pinCode).value,
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
            onTapNumber: (numberString) => onTapNumber(
              context: context,
              numberString: numberString,
            ),
          ),
        ),
        BlocBuilder<JoinCubit, JoinState>(
          builder: (context, state) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              fixedSize: const Size.fromHeight(70),
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ).rixMGoB,
            ),
            onPressed: (isVerifing
                    ? (state.verifingPinCode.valid &&
                        state.verifingPinCode.value == state.pinCode.value)
                    : state.pinCode.valid)
                ? () async {
                    if (isVerifing) {
                      final user = await joinCubit.submit();
                      if (user == null) {
                        print('핀번호가 중복됩니다.');
                      } else {
                        authCubit.updateUser(user);
                        joinCubit.next();
                      }
                    } else {
                      joinCubit.next();
                    }
                  }
                : null,
            child: const Text('다음'),
          ),
        ),
      ],
    );
  }
}
