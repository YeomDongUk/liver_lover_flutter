// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

class PageviewIndicator extends StatefulWidget {
  const PageviewIndicator({
    super.key,
    required this.pageController,
    required this.pageCoount,
  }) : assert(
          pageCoount > 0,
          '페이지의 수는 반드시 0보다 커야함',
        );

  final PageController pageController;
  final int pageCoount;

  @override
  State<PageviewIndicator> createState() => _PageviewIndicatorState();
}

class _PageviewIndicatorState extends State<PageviewIndicator> {
  late int pageIndex;

  @override
  void initState() {
    pageIndex = widget.pageController.initialPage;
    widget.pageController.addListener(listener);

    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(listener);
    super.dispose();
  }

  void listener() => setState(
        () => pageIndex = (widget.pageController.page?.round() ?? pageIndex) %
            widget.pageCoount,
      );

  @override
  void didUpdateWidget(covariant PageviewIndicator oldWidget) {
    if (oldWidget.pageController != widget.pageController) {
      pageIndex = widget.pageController.initialPage;
      widget.pageController
        ..removeListener(listener)
        ..addListener(listener);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.pageCoount * 2 - 1,
        (index) => index.isOdd
            ? const SizedBox(width: 8)
            : Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: pageIndex == index ~/ 2
                      ? AppColors.magenta
                      : AppColors.lightGray,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }
}
