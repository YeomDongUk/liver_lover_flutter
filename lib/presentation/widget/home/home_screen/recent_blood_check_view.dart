import 'package:flutter/material.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/physics.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';

class RecentBloodCheckView extends StatefulWidget {
  const RecentBloodCheckView({super.key});

  @override
  State<RecentBloodCheckView> createState() => _RecentBloodCheckViewState();
}

class _RecentBloodCheckViewState extends State<RecentBloodCheckView> {
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
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            controller: pageController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const CustomScrollPhysics(childWidth: 286),
            itemBuilder: (context, i) {
              final index = i % 4;
              return Center(
                child: HomeContainer(
                  margin: const EdgeInsets.only(right: 16),
                  width: 270,
                  height: 172,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            ['혈당', '간효소', 'B형/C형 간염바이러스', '알파테아단백질'][index],
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                      ),
                      const Divider(),
                      // SizedBox(
                      //   height: 118,
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: RecentBloodCheckValueBox(
                      //           label: ['공복','AST','HBV',],
                      //         ),
                      //       ),
                      //       const VerticalDivider(),
                      //       Expanded(
                      //         child: RecentBloodCheckValueBox(),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: PageviewIndicator(
            pageController: pageController,
            pageCoount: 4,
          ),
        ),
      ],
    );
  }
}

class RecentBloodCheckValueBox extends StatelessWidget {
  const RecentBloodCheckValueBox({
    super.key,
    required this.label,
    required this.value,
    required this.unitText,
  });
  final String label;
  final int value;
  final String unitText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoB,
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 35,
            color: AppColors.primary,
          ).airbnbEB,
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).airbnbBo,
        ),
      ],
    );
  }
}
