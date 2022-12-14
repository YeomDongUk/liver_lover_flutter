// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/icon.dart';

class GlobalNavigationBar extends StatefulWidget {
  const GlobalNavigationBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  State<GlobalNavigationBar> createState() => _GlobalNavigationBarState();
}

class _GlobalNavigationBarState extends State<GlobalNavigationBar> {
  late int currentPageIndex = widget.pageController.initialPage;
  final iconDatas = [
    IconDatas.medication,
    IconDatas.hospitalVisit,
    IconDatas.blood,
    IconDatas.survey,
    IconDatas.diary,
  ];
  final strings = [
    '복약관리',
    '외래/검진',
    '검사결과',
    '건강일기',
    '건강정보',
  ];
  @override
  void initState() {
    widget.pageController.addListener(_pageControllerListener);

    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageControllerListener);

    super.dispose();
  }

  void _pageControllerListener() =>
      setState(() => currentPageIndex = widget.pageController.page!.round());

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.blueGrayLight,
              blurRadius: 5,
            ),
          ],
        ),
        child: Material(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Container(
              height: kBottomNavigationBarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Expanded(
                    child: InkResponse(
                      onTap: () => widget.pageController.jumpToPage(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            iconDatas[index],
                            color: index == currentPageIndex
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedItemColor,
                            size: 19,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            strings[index],
                            style: index == currentPageIndex
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedLabelStyle
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
