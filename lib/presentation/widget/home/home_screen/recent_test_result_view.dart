// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/home/home_screen/value_column.dart';

class RecentTestResultView extends StatefulWidget {
  const RecentTestResultView({super.key});

  @override
  State<RecentTestResultView> createState() => _RecentTestResultViewState();
}

class _RecentTestResultViewState extends State<RecentTestResultView> {
  late final PageController pageController;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HomeLabel(
            grayText: '최근 ',
            primaryText: '혈액검사',
          ),
        ),
        SizedBox(
          height: 192,
          child: PageView(
            controller: pageController,
            children: [
              HomeContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '간효소',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.magenta,
                        ).rixMGoEB,
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: Row(
                        children: const [
                          Expanded(
                            child: ValueColumn(
                              label: 'AST',
                              value: null,
                              unitText: 'IU/mL',
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: ValueColumn(
                              label: 'ALT',
                              value: null,
                              unitText: 'IU/mL',
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: ValueColumn(
                              label: 'GGT',
                              value: null,
                              unitText: 'IU/mL',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HomeContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'B형/C형 간염바이러스',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.magenta,
                        ).rixMGoEB,
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: ValueColumn(
                              label: 'HBV',
                              value: null,
                              unitText: 'IU/mL',
                            ),
                          ),
                          const VerticalDivider(),
                          const Expanded(
                            child: ValueColumn(
                              label: 'HCV',
                              value: null,
                              unitText: 'IU/mL',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HomeContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '빌리루빈',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.magenta,
                        ).rixMGoEB,
                      ),
                    ),
                    const Divider(),
                    const Expanded(
                      child: ValueColumn(
                        label: 'Bilirubin',
                        value: null,
                        unitText: 'mg/dL',
                      ),
                    ),
                  ],
                ),
              ),
              HomeContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '알부민',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.magenta,
                        ).rixMGoEB,
                      ),
                    ),
                    const Divider(),
                    const Expanded(
                      child: ValueColumn(
                        label: 'Albumin',
                        value: null,
                        unitText: 'mg/dL',
                      ),
                    ),
                  ],
                ),
              ),
              HomeContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '알파태아단백질',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.magenta,
                        ).rixMGoEB,
                      ),
                    ),
                    const Divider(),
                    const Expanded(
                      child: ValueColumn(
                        label: 'AFP',
                        value: null,
                        unitText: 'mg/dL',
                      ),
                    ),
                  ],
                ),
              ),
            ]
                .map(
                  (e) => Center(
                    child: SizedBox(
                      height: 172,
                      child: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: PageviewIndicator(
            pageController: pageController,
            pageCoount: 5,
          ),
        ),
      ],
    );
  }
}
