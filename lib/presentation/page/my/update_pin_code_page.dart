// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/update_pin_code.dart';
import 'package:yak/presentation/bloc/my/update_pin_code/update_pin_code_cubit.dart';
import 'package:yak/presentation/widget/auth/key_pad_widget.dart';
import 'package:yak/presentation/widget/auth/pin_code_input_widget.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';

class UpdatePinCodePage extends StatefulWidget {
  const UpdatePinCodePage({super.key});

  @override
  State<UpdatePinCodePage> createState() => _UpdatePinCodePageState();
}

class _UpdatePinCodePageState extends State<UpdatePinCodePage> {
  late final UpdatePinCodeCubit updatePinCodeCubit;

  @override
  void initState() {
    updatePinCodeCubit = UpdatePinCodeCubit(
      updatePinCode: KiwiContainer().resolve<UpdatePinCode>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    updatePinCodeCubit.close();
    super.dispose();
  }

  void onTapNumber(
    String numberString,
  ) {
    if (numberString == '취소') {
      context.beamBack();
      return;
    }
    final isCreateStep =
        updatePinCodeCubit.state.step == UpdatePinCodeStep.create;
    final prevPinCode = isCreateStep
        ? updatePinCodeCubit.state.pinCode.value
        : updatePinCodeCubit.state.verifiedPinCode.value;

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

    return isCreateStep
        ? updatePinCodeCubit.enterPinCode(pinCode)
        : updatePinCodeCubit.enterVerifiedPinCode(pinCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        automaticallyImplyLeading: false,
        title: const Text('PIN 번호 수정'),
        actions: [
          IconButton(
            onPressed: () => context.beamBack(),
            icon: SvgPicture.asset('assets/svg/close.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<UpdatePinCodeCubit, UpdatePinCodeState>(
          bloc: updatePinCodeCubit,
          listener: (context, state) {
            if (state.status == FormzStatus.submissionFailure) {
              /// TODO: 실패시 에러 처리 필요
            }

            if (state.status == FormzStatus.submissionSuccess) {
              context.beamBack();
            }
          },
          child: BlocBuilder<UpdatePinCodeCubit, UpdatePinCodeState>(
            bloc: updatePinCodeCubit,
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                ...[
                  Text(
                    state.step == UpdatePinCodeStep.create
                        ? 'PIN 번호를\n생성해주세요'
                        : '동일한 PIN 번호를\n재입력해 주세요',
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ).rixMGoL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 72),
                  PinCodeInputWidget(
                    visible: true,
                    pinCode: state.step == UpdatePinCodeStep.create
                        ? state.pinCode.value
                        : state.verifiedPinCode.value,
                  ),
                  const SizedBox(height: 72),
                ].map(
                  (e) => e is Spacer
                      ? e
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: e is KeyPadWidget ? 22.5 : 50,
                          ),
                          child: e,
                        ),
                ),
                Expanded(
                  child: KeyPadWidget(
                    onTapNumber: onTapNumber,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    fixedSize: const Size.fromHeight(70),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ).rixMGoB,
                  ),
                  onPressed: state.step == UpdatePinCodeStep.create
                      ? state.canNextStep
                          ? updatePinCodeCubit.nextStep
                          : null
                      : state.canSubmit
                          ? updatePinCodeCubit.submit
                          : null,
                  child: Text(
                    state.step == UpdatePinCodeStep.create ? '다음' : '저장',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ).rixMGoB,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
