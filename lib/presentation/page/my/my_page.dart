// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// Project imports:
import 'package:yak/core/input_formtters/input_formatter.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/user/update_user.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/my/update_user/update_user_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/metabolic_disease/update_metabolic_disease_tab_view.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('내 정보'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.white,
                    child: const Divider(
                      height: 4,
                      thickness: 4,
                      color: AppColors.blueGrayLight,
                    ),
                  ),
                ),
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: '정보수정',
                    ),
                    Tab(
                      text: '내 상태',
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  UpdateUserTabView(),
                  UpdateMetabolicDiseaseTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateUserTabView extends StatefulWidget {
  const UpdateUserTabView({super.key});

  @override
  State<UpdateUserTabView> createState() => _UpdateUserTabViewState();
}

class _UpdateUserTabViewState extends State<UpdateUserTabView>
    with AutomaticKeepAliveClientMixin {
  late final List<FocusNode> focusNodes;

  late final UpdateUserCubit updateUserCubit;

  late final MaskTextInputFormatter phoneInputFormatter;
  late final MaskTextInputFormatter birthYearInputFormatter;
  late final MaskTextInputFormatter weightInputFormatter;
  late final MaskTextInputFormatter heightInputFormatter;

  @override
  void initState() {
    final user = context.read<AuthCubit>().state.user;
    final phone =
        getPhoneInputFormatter(initialText: user.phone).getMaskedText();
    focusNodes = List.generate(
      5,
      (index) => FocusNode(),
    );

    updateUserCubit = UpdateUserCubit(
      updateUser: KiwiContainer().resolve<UpdateUser>(),
      user: user.copyWith(phone: phone),
    );
    phoneInputFormatter = getPhoneInputFormatter(
      initialText: phone,
    );
    birthYearInputFormatter = getBirthYearInputFormatter(
      initialText: '${user.birthYear}',
    );
    weightInputFormatter =
        getHeightInputFormatter(initialText: '${user.weight}');
    heightInputFormatter =
        getHeightInputFormatter(initialText: '${user.height}');
    super.initState();
  }

  @override
  void dispose() {
    focusNodes.map((e) => e.dispose());
    updateUserCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UpdateUserCubit, UpdateUserState>(
      bloc: updateUserCubit,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: CommonShadowBox(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24),
                  children: [
                    JoinContainer(
                      fontSize: 15,
                      label: '성명',
                      color: Colors.white,
                      child: CommonInputFormField(
                        focusNode: focusNodes[0],
                        initialValue: state.name.value,
                        onChanged: updateUserCubit.updateName,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (str) =>
                            FocusScope.of(context).requestFocus(focusNodes[1]),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(height: 20),
                    JoinContainer(
                      fontSize: 15,
                      label: '휴대폰 번호',
                      color: Colors.white,
                      child: CommonInputFormField(
                        textStyle: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        focusNode: focusNodes[1],
                        initialValue: state.phone.value,
                        onChanged: (str) => state.phone.value != str
                            ? updateUserCubit.updatePhone(str)
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
                            fontSize: 15,
                            label: '생년',
                            color: Colors.white,
                            child: CommonInputFormField(
                              textStyle: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              focusNode: focusNodes[2],
                              initialValue: '${state.birthYear.value ?? ''}',
                              onChanged: (str) => updateUserCubit
                                  .updateBirthYear(int.tryParse(str)),
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
                            fontSize: 15,
                            label: '성별',
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        updateUserCubit.updateSex(0),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: state.sex.value == 0
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
                                const VerticalDivider(),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        updateUserCubit.updateSex(1),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: state.sex.value == 1
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
                            fontSize: 15,
                            label: '신장(CM)',
                            color: Colors.white,
                            child: CommonInputFormField(
                              textStyle: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              focusNode: focusNodes[3],
                              initialValue: '${state.height.value ?? ''}',
                              onChanged: (str) => updateUserCubit
                                  .updateHeight(int.tryParse(str)),
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
                            fontSize: 15,
                            label: '체중(KG)',
                            color: Colors.white,
                            child: CommonInputFormField(
                              textStyle: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              focusNode: focusNodes[4],
                              initialValue: '${state.weight.value ?? ''}',
                              onChanged: (str) => updateUserCubit
                                  .updateWeight(int.tryParse(str)),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                              inputFormatters: [
                                weightInputFormatter,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          context.beamToNamed(Routes.myPinCodeUpdate),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        fixedSize: const Size.fromHeight(60),
                        textStyle: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      child: const Text('PIN 번호 수정'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: state.isValid
                ? () async {
                    final authCubit = context.read<AuthCubit>();
                    final user = await updateUserCubit.submit();

                    if (user != null) {
                      authCubit.updateUser(user);
                    } else {
                      /// TODO: 업데이트 실패 에러 표시
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(70),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
