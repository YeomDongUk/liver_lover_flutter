// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

class PageIndexIndicator extends StatefulWidget {
  const PageIndexIndicator({
    super.key,
    required this.pageController,
    required this.pageCount,
  });
  final PageController pageController;
  final int pageCount;

  @override
  State<PageIndexIndicator> createState() => _PageIndexIndicatorState();
}

class _PageIndexIndicatorState extends State<PageIndexIndicator> {
  @override
  void initState() {
    widget.pageController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(listener);
    super.dispose();
  }

  void listener() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Wrap(
          spacing: 8,
          children: List.generate(
            widget.pageCount,
            (index) => Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: index == (widget.pageController.page ?? 0).round()
                    ? AppColors.magenta
                    : AppColors.lightGray,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollIndexIndicator extends StatefulWidget {
  const ScrollIndexIndicator({
    super.key,
    required this.scollController,
    required this.pageCount,
    required this.childWidth,
  });
  final ScrollController scollController;
  final int pageCount;
  final double childWidth;

  @override
  State<ScrollIndexIndicator> createState() => _ScrollIndexIndicatorState();
}

class _ScrollIndexIndicatorState extends State<ScrollIndexIndicator> {
  int index = 0;
  @override
  void initState() {
    widget.scollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scollController.removeListener(listener);
    super.dispose();
  }

  double _getPage(ScrollMetrics position) =>
      position.pixels / (widget.childWidth);

  void listener() =>
      setState(() => index = _getPage(widget.scollController.position).toInt());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Wrap(
          spacing: 8,
          children: List.generate(
            widget.pageCount,
            (index) => Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: index == this.index
                    ? AppColors.magenta
                    : AppColors.lightGray,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
