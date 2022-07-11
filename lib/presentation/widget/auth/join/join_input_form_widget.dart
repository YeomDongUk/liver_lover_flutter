import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:yak/core/input_formtters/input_formatter.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/auth/join/join_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/auth/join/join_input_form_field.dart';
import 'package:yak/presentation/widget/common/opacity_check_box.dart';

class JoinInputFormWidget extends StatefulWidget {
  const JoinInputFormWidget({super.key});

  @override
  State<JoinInputFormWidget> createState() => _JoinInputFormWidgetState();
}

class _JoinInputFormWidgetState extends State<JoinInputFormWidget> {
  late final joinCubit = context.read<JoinCubit>();
  late final MaskTextInputFormatter phoneInputFormatter =
      getPhoneInputFormatter();
  late final MaskTextInputFormatter birthYearInputFormatter =
      getBirthYearInputFormatter();
  late final MaskTextInputFormatter heightInputFormatter =
      getHeightInputFormatter();
  final List<FocusNode> focusNodes = List.generate(
    5,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    focusNodes.map((e) => e.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinCubit, JoinState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50).copyWith(top: 50),
              children: [
                Text(
                  '개인정보를\n입력해주세요.',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                  ).rixMGoL,
                ),
                const SizedBox(height: 20),
                Text(
                  '입력하신 개인 정보는\n본인의 휴대폰에만 저장됩니다.',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ).rixMGoB,
                ),
                const SizedBox(height: 50),
                JoinContainer(
                  label: '성명',
                  child: JoinInputFormField(
                    focusNode: focusNodes[0],
                    initialValue: state.name.value,
                    onChanged: joinCubit.updateName,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (str) =>
                        FocusScope.of(context).requestFocus(focusNodes[1]),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 20),
                JoinContainer(
                  label: '휴대폰 번호',
                  child: JoinInputFormField(
                    focusNode: focusNodes[1],
                    initialValue: state.phone.value,
                    onChanged: (str) => state.phone.value != str
                        ? joinCubit.updatePhone(str)
                        : null,
                    keyboardType: Platform.isIOS
                        ? const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          )
                        : TextInputType.number,
                    onFieldSubmitted: (str) =>
                        FocusScope.of(context).requestFocus(focusNodes[2]),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      phoneInputFormatter,
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: JoinContainer(
                        label: '생년',
                        child: JoinInputFormField(
                          focusNode: focusNodes[2],
                          initialValue: '${state.birthYear.value ?? ''}',
                          onChanged: (str) =>
                              joinCubit.updateBirthYear(int.tryParse(str)),
                          onFieldSubmitted: (str) => FocusScope.of(context)
                              .requestFocus(focusNodes[3]),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            birthYearInputFormatter,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: JoinContainer(
                        label: '성별',
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => joinCubit.updateSex(0),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: state.sex.value == 0
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(),
                                ),
                                child: Text(
                                  '남',
                                  style: TextStyle(
                                    color: state.sex.value == 0
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                  ).rixMGoB,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => joinCubit.updateSex(1),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: state.sex.value == 1
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(),
                                ),
                                child: Text(
                                  '여',
                                  style: TextStyle(
                                    color: state.sex.value == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                  ).rixMGoB,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: JoinContainer(
                        label: '신장(CM)',
                        child: JoinInputFormField(
                          focusNode: focusNodes[3],
                          initialValue: '${state.height.value ?? ''}',
                          onChanged: (str) =>
                              joinCubit.updateHeight(int.tryParse(str)),
                          onFieldSubmitted: (str) => FocusScope.of(context)
                              .requestFocus(focusNodes[4]),
                          textInputAction: TextInputAction.next,
                          keyboardType: Platform.isIOS
                              ? const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                )
                              : TextInputType.number,
                          inputFormatters: [
                            heightInputFormatter,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: JoinContainer(
                        label: '체중(KG)',
                        child: JoinInputFormField(
                          focusNode: focusNodes[4],
                          initialValue: '${state.weight.value ?? ''}',
                          onChanged: (str) =>
                              joinCubit.updateWeight(int.tryParse(str)),
                          textInputAction: TextInputAction.next,
                          keyboardType: Platform.isIOS
                              ? const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                )
                              : TextInputType.number,
                          inputFormatters: [
                            heightInputFormatter,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    OpacityCheckBox(
                      onChanged: joinCubit.updateMetabolicDisease,
                      value: state.metabolicDisease.value,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '현재 대사질환이 있습니다.',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ).rixMGoB,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
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
            onPressed: Formz.validate(
              List<FormzInput>.from(state.props..remove(state.joinForm))
                ..remove(state.pinCode)
                ..remove(state.verifingPinCode),
            ).isValid
                ? joinCubit.next
                : null,
            child: const Text('다음'),
          ),
        ],
      ),
    );
  }
}
