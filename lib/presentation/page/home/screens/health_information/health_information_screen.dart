// Dart imports:
import 'dart:io';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Project imports:
import 'package:yak/core/class/circulator_result.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/fibrosis_circulator/fibrosis_circulator_cubit.dart';
import 'package:yak/presentation/bloc/page_b_circulator/page_b_circulator_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/health_information/health_information_dialog.dart';

class HealthInformationScreen extends StatefulWidget {
  const HealthInformationScreen({super.key});

  @override
  State<HealthInformationScreen> createState() =>
      HealthInformationStateScreen();
}

class HealthInformationStateScreen extends State<HealthInformationScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('건강정보'),
        leading: IconButton(
          onPressed: () => context.read<PageController>().jumpToPage(5),
          icon: SvgPicture.asset('assets/svg/home.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed(Routes.my),
            icon: SvgPicture.asset('assets/svg/my_info.svg'),
          ),
        ],
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
                      text: '간 건강백서',
                    ),
                    Tab(
                      text: 'B형 간염위험도 계산',
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  LiverHealthWhitePaperTabView(),
                  LiverDiseaseRiskCalculatorTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// ss
class LiverDiseaseRiskCalculatorTabView extends StatefulWidget {
  const LiverDiseaseRiskCalculatorTabView({
    super.key,
  });

  @override
  State<LiverDiseaseRiskCalculatorTabView> createState() =>
      _LiverDiseaseRiskCalculatorTabViewState();
}

class _LiverDiseaseRiskCalculatorTabViewState
    extends State<LiverDiseaseRiskCalculatorTabView> {
  late final FibrosisCirculatorCubit fibrosisCirculatorCubit;
  late final PageBCirculatorCubit pageBCirculatorCubit;

  late final List<FocusNode> focusNodes;
  bool openSexDropDown = false;
  @override
  void initState() {
    fibrosisCirculatorCubit = FibrosisCirculatorCubit();
    pageBCirculatorCubit = PageBCirculatorCubit();
    focusNodes = List.generate(10, (index) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    fibrosisCirculatorCubit.close();
    pageBCirculatorCubit.close();
    focusNodes.map((e) => e.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      children: [
        CommonShadowBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'FIB-4 (간경화 예측 계산)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoEB,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            '나이',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[0],
                              onChanged: (str) => fibrosisCirculatorCubit
                                  .updateAge(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[1]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            'AST (U/L)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[1],
                              onChanged: (str) => fibrosisCirculatorCubit
                                  .updateAst(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[2]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            'ALT(U/L)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[2],
                              onChanged: (str) => fibrosisCirculatorCubit
                                  .updateAlt(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[3]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: '혈소판(',
                                  style: const TextStyle().rixMGoB,
                                ),
                                const TextSpan(
                                  text: '10',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Transform.translate(
                                    offset: const Offset(0, 2),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                const TextSpan(
                                  text: '/mm',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Transform.translate(
                                    offset: const Offset(0, 2),
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ')',
                                  style: const TextStyle().rixMGoB,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[3],
                              onChanged: (str) => fibrosisCirculatorCubit
                                  .updatePlatelet(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[4]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<FibrosisCirculatorCubit,
                    FibrosisCirculatorState>(
                  bloc: fibrosisCirculatorCubit,
                  builder: (context, state) => ElevatedButton(
                    focusNode: focusNodes[4],
                    onPressed: !state.canCirculator
                        ? null
                        : () {
                            final value = (state.age! * state.ast!) /
                                (state.platelet! * pow(state.alt!, 0.5));
                            showDialog<void>(
                              context: context,
                              builder: (_) => HealthInformationDialog(
                                circulatorResult:
                                    Fib4CirculatorResult(value: value),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      textStyle: const TextStyle(fontSize: 17),
                    ),
                    child: const Text('계산'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        ///
        CommonShadowBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'mPAGE-B (간암 예측 계산)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoEB,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            '나이',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[5],
                              onChanged: (str) => pageBCirculatorCubit
                                  .updateAge(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[6]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            '성별',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 120,
                          child: JoinContainer(
                            color: Colors.white,
                            child: BlocBuilder<PageBCirculatorCubit,
                                PageBCirculatorState>(
                              buildWhen: (previous, current) =>
                                  previous.sex != current.sex,
                              bloc: pageBCirculatorCubit,
                              builder: (context, state) => Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          pageBCirculatorCubit.updateSex(0),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        backgroundColor: state.sex == 0
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      child: Text(
                                        '남',
                                        style: TextStyle(
                                          color: state.sex == 0
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
                                          pageBCirculatorCubit.updateSex(1),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        backgroundColor: state.sex == 1
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      child: Text(
                                        '여',
                                        style: TextStyle(
                                          color: state.sex == 1
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: '혈소판(',
                                  style: const TextStyle().rixMGoB,
                                ),
                                const TextSpan(
                                  text: '10',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Transform.translate(
                                    offset: const Offset(0, 2),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                const TextSpan(
                                  text: '/mm',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Transform.translate(
                                    offset: const Offset(0, 2),
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ')',
                                  style: const TextStyle().rixMGoB,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[7],
                              onChanged: (str) => pageBCirculatorCubit
                                  .updatePlatelet(int.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[8]),
                              textInputAction: TextInputAction.next,
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            '알부민(g/dL)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ),
                        Expanded(
                          child: JoinContainer(
                            child: CommonInputFormField(
                              focusNode: focusNodes[8],
                              onChanged: (str) => pageBCirculatorCubit
                                  .updateAlbumin(double.tryParse(str)),
                              onFieldSubmitted: (str) => FocusScope.of(context)
                                  .requestFocus(focusNodes[9]),
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                doubleTextInputFormatter,
                              ],
                              keyboardType: Platform.isIOS
                                  ? const TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<PageBCirculatorCubit, PageBCirculatorState>(
                  bloc: pageBCirculatorCubit,
                  builder: (context, state) => ElevatedButton(
                    focusNode: focusNodes[4],
                    onPressed: !state.canCirculator
                        ? null
                        : () {
                            final age = state.age!;
                            final platelet = state.platelet!;
                            final albumin = state.albumin!;
                            var value = 0;

                            if (age < 30) {
                              value += 0;
                            } else if (age < 40) {
                              value += 3;
                            } else if (age < 50) {
                              value += 5;
                            } else if (age < 60) {
                              value += 7;
                            } else if (age < 70) {
                              value += 9;
                            } else {
                              value += 11;
                            }

                            if (state.sex == 0) {
                              value += 2;
                            } else {
                              value += 0;
                            }

                            if (platelet < 100) {
                              value += 5;
                            } else if (platelet <= 150) {
                              value += 4;
                            } else if (platelet <= 200) {
                              value += 3;
                            } else if (platelet <= 250) {
                              value += 4;
                            } else {
                              value += 5;
                            }
                            if (albumin < 3) {
                              value += 3;
                            } else if (albumin <= 3.5) {
                              value += 2;
                            } else if (albumin <= 4.0) {
                              value += 1;
                            } else {
                              value += 0;
                            }

                            showDialog<void>(
                              context: context,
                              builder: (_) => HealthInformationDialog(
                                circulatorResult:
                                    PageBCirculatorResult(value: value * 1),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      textStyle: const TextStyle(fontSize: 17),
                    ),
                    child: const Text('계산'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LiverHealthWhitePaperTabView extends StatefulWidget {
  const LiverHealthWhitePaperTabView({super.key});

  @override
  State<LiverHealthWhitePaperTabView> createState() =>
      LiverHealthWhitePaperTabViewState();
}

class LiverHealthWhitePaperTabViewState
    extends State<LiverHealthWhitePaperTabView>
    with AutomaticKeepAliveClientMixin {
  late final PageController pageController;
  final pageIndicatorTexts = const ['간 건강 이해하기', '간 질환 바로알기', '생활 관리', '자가체크'];
  final footer = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      CommonShadowBox(
        color: null,
        boxDecoration: BoxDecoration(
          color: AppColors.blueGrayLight.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            '''
본 콘텐츠는 대한간학회와 네이버, 헬스경향의 공동작업으로 본 컨텐츠의 저작권은 저자 또는 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라
법적책임을 질 수 있습니다.

작성 및 감수 : 대한간학회  / 편집 : 헬스경향  / 출처 : 네이버''',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray,
              height: 1.2,
            ).rixMGoM,
          ),
        ),
      ),
      const SizedBox(height: 24),
      GestureDetector(
        onTap: () => launchUrlString('https://www.kasl.org/general/'),
        child: CommonShadowBox(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SvgPicture.asset('assets/svg/footer_logo.svg'),
        ),
      ),
      const SizedBox(height: 24),
    ],
  );
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: 36,
            child: StatefulBuilder(
              builder: (context, setState) => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                itemBuilder: (context, index) => Material(
                  color: pageIndex == index ? AppColors.primary : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: pageIndex == index
                          ? AppColors.primary
                          : AppColors.blueGrayLight,
                    ),
                    borderRadius: BorderRadius.circular(24.5),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() => pageIndex = index);
                      pageController.jumpToPage(pageIndex);
                    },
                    borderRadius: BorderRadius.circular(24.5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        pageIndicatorTexts[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: pageIndex == index
                              ? Colors.white
                              : AppColors.blueGrayLight,
                        ).rixMGoEB,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const _InformationBox(
                    label: '간에 대한 일반 상식',
                    strings: [
                      '간, 구체적으로 무슨 일을 하나요?',
                      '간이란 장기가 갖는 특징은 무엇이 있나요?',
                      '간이 나쁘면 왜 얼굴이 까매지나요?',
                      '간이 나빠지는 것을 알 수 있는 증상은 무엇인가요?',
                      '간건강의 바로미터, 간수치란 무엇인가요?',
                      '콜레스테롤과 간건강과의 상관관계는?',
                      '손톱을 통해 간 건강을 알 수 있나요?',
                      '간은 실제로 부을 수 있나요?',
                      '간이 건강하면 정말 피로감이 적은가요?',
                      '속이 더부룩하고 입냄새가 심해요. 간에 문제가 있는 걸까요?',
                      '간기능이 떨어지면 어떤 변화가 나타나나요?',
                      '침묵의 장기라는 간, 왜 그런건가요?',
                      '간크기는 사람마다 다른가요?',
                    ],
                    urls: [
                      'http://terms.naver.com/entry.nhn?docId=2685505&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2685506&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2685507&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2685508&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2685509&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2685510&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704264&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704265&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704266&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704267&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704268&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704269&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704270&amp;categoryId=55588&amp;cid=55588',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '간에 대한 오해와 진실',
                    strings: const [
                      '제대혈로 간암을 고칠 수 있나요?',
                      '수면제가 간에 부담을 주나요?',
                      '동물의 간을 먹으면 사람의 간이 좋아지나요?',
                      '간해독 음료나 간해독제를 꾸준히 먹는 것이 간 건강에 도움이 되나요?',
                      '간이 안 좋아지면 흰자가 노랗게 되거나 잇솔질 시 피가 많이 난다는게 사실인가요?',
                      '하루 커피 한 잔이 간암 발생을 줄여주나요?',
                      '배변활동으로 알아보는 간 건강',
                      '간 치료제 복용 시 피부질환약을 병용해도 되나요?',
                      '비타민C로 간염이 완치된다는 속설이 사실인가요?',
                      '술이 센 사람은 간이 튼튼해서 약한 사람보다 간암에 걸릴 확률이 낮은가요?',
                      '만성피로하면 간수치가 올라간다는데 의학적인 설명이 가능한가요?',
                      '헬스보충제를 먹으면 왜 간수치가 올라가나요?',
                    ],
                    urls: List<String>.generate(
                      12,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27042${index + 72}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  footer,
                ],
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const _InformationBox(
                    label: '간염',
                    strings: [
                      '간염바이러스의 감염경로',
                      '바이러스 간염 중 A형 B형 C형은 무엇인가요?',
                      'A형 간염은 왜 후진국 병인가요?',
                      'A형 간염 한 번 걸리면 다시 안 걸리나요?',
                      'B형 간염에 걸리는 이유와 진단방법',
                      '만성 B형 간염, 간경변증으로 진행하나요?',
                      '찌개를 같이 먹으면 정말 B형 간염에 걸리나요?',
                      'B형 간염약의 종류',
                      'B형 간염의 예방법',
                      'C형 간염의 증상과 진단법',
                      'C형 간염의 완치율',
                      'C형 간염 치료제는 왜 비싼가요?',
                      'C형 간염 치료는 부작용이 많지 않나요?',
                      'C형 간염 환자가 주의해야할 생활수칙',
                    ],
                    urls: [
                      'http://terms.naver.com/entry.nhn?docId=2704272&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704273&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704274&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704275&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704276&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704277&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704278&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704279&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704280&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704281&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704282&amp;categoryId=55588&amp;cid=55588',
                      'http://terms.naver.com/entry.nhn?docId=2704283&amp;categoryId=55588&amp;cid=55588',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '지방간',
                    strings: const [
                      '지방간에 잘 걸리는 사람이 있나요?',
                      '누구나 조금씩 있다는 지방간, 별로 걱정할 필요 없겠죠?',
                      '뚱뚱하면 정말로 지방간이 될 확률이 높나요?',
                      '지방간은 예방할 수 없나요?',
                      '지방간 환자가 멀리해야 할 음식',
                    ],
                    urls: List<String>.generate(
                      4,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=270430${index + 1}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '알코올성 간질환',
                    strings: const [
                      '술을 끊으면 간기능이 회복 되나요?',
                      '성인의 적당한 음주량은 얼마인가요?',
                      '성인남자에게서 알코올성 간질환이 많은 이유',
                      '최고의 숙취해소음료, 물',
                    ],
                    urls: List<String>.generate(
                      4,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27043${index + 7 >= 10 ? index + 7 : (index + 7).toString().padLeft(2, '0')}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '간경변증',
                    strings: const [
                      '간경변증은 왜 생기나요?',
                      '간이 굳어지면 나타나는 증상은 무엇이 있나요?',
                      '간경변증은 회복이 어려운가요?',
                      '간경변증의 완치방법은 없나요?',
                      '소아청소년에서의 비알코올 지방간질환, 어떻게 치료하나요?',
                      '황달 증상이 있으면 모두 간경변증 인가요?',
                      '간경변증 환자의 식이생활 주의점은?',
                      '간경변증 환자에서 언제 간이식을 시행하는 것이 좋은가요?',
                    ],
                    urls: List<String>.generate(
                      8,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27043${index + 12}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '간성뇌증',
                    strings: const [
                      '간성뇌증의 원인과 진단은 어떻게 하나요?',
                      '치매증상을 보이다 혼수상태에 빠진 노인, 간성뇌증인가요?',
                      '간기능이 나빠지면 왜 혼수상태가 되는 건가요?',
                      '간성혼수 치료법은 무엇이 있으며 진단 후 무조건 사망에 이르나요?',
                      '암 치료 중 약물복용에 의해 간성뇌증이 생길 수도 있나요?',
                      '간성뇌증 환자가 설사약을 먹는 이유는 무엇인가요?',
                      '유산균이 간성뇌증의 예방 및 치료에 도움이 되나요?',
                      '간성뇌증 환자에게 좋은 음식과 나쁜 음식',
                    ],
                    urls: List<String>.generate(
                      8,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27043${index + 21}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  footer,
                ],
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const _InformationBox(
                    label: '운동하기',
                    strings: [
                      '간질환과 운동의 관계?',
                    ],
                    urls: [
                      'https://terms.naver.com/entry.naver?docId=2704346&categoryId=55588&cid=55588'
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '임신과 간 건강',
                    strings: const [
                      'B형 간염은 왜 모체전염이 되나요?',
                      '전염된 신생아의 건강관리법은?',
                      '임신 중 B형 간염, 어떻게 해야 하나요?',
                      '간질환이나 관련 약복용이 생리불순, 무월경 등의 문제를 유발할 수 있나요?',
                      '임신과 바이러스 간염',
                      '임신성 급성 지방간은 어떤 병인가요?',
                    ],
                    urls: List<String>.generate(
                      6,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27043${index + 48}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '간과 음식',
                    strings: const [
                      '간에 좋은 음식은 무엇인가요?',
                      '간 건강에는 녹색음식이 좋다는데요 이유는 무엇입니까?',
                      '간에 특효라는 음식, 정말인가요?',
                      '식이요법으로 간암을 완치할 수 있나요?',
                      '건강기능식품으로 간 기능을 좋게 만들 수 있나요?',
                    ],
                    urls: List<String>.generate(
                      5,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=27043${index + 55}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InformationBox(
                    label: '알코올성 간질환',
                    strings: const [
                      '간에 이상이 있을 때 먹으면 안 되는 음식',
                      '간 건강 지키는 밥상차림표',
                      '계절별 간질환자에게 좋은 식재료',
                    ],
                    urls: List<String>.generate(
                      3,
                      (index) =>
                          'https://terms.naver.com/entry.naver?docId=270436${index + 1}&categoryId=55588&cid=55588',
                    ),
                  ),
                  const SizedBox(height: 16),
                  footer,
                ],
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const _InformationBox(
                    label: '지표로 알아보는 간건강',
                    strings: [
                      '간건강을 체크할 수 있는 자가진단표',
                    ],
                    urls: [
                      'https://terms.naver.com/entry.naver?docId=2704366&categoryId=55588&cid=55588'
                    ],
                  ),
                  const SizedBox(height: 16),
                  footer,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _InformationBox extends StatelessWidget {
  const _InformationBox({
    required this.label,
    required this.strings,
    required this.urls,
  });

  final String label;
  final List<String> strings;
  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return CommonShadowBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                strings.length * 2 - 1,
                (index) => index.isOdd
                    ? const SizedBox(height: 21)
                    : GestureDetector(
                        onTap: () => launchUrlString(urls[index ~/ 2]),
                        child: Text(
                          strings[index ~/ 2],
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blueGrayDark,
                          ).rixMGoM,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
