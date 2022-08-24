// Flutter imports:
import 'package:flutter/material.dart';

class ExpandedSectionWidget extends StatefulWidget {
  const ExpandedSectionWidget({
    super.key,
    this.expand = false,
    required this.child,
  });
  final bool expand;
  final Widget child;

  @override
  State<ExpandedSectionWidget> createState() => _ExpandedSectionWidgetState();
}

class _ExpandedSectionWidgetState extends State<ExpandedSectionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController expandController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = expandController.drive(
      CurveTween(curve: Curves.easeIn),
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: expandController.view,
      child: widget.child,
      builder: (context, child) => Opacity(
        opacity: animation.value < 0.9 ? 0 : animation.value,
        child: Align(
          heightFactor: animation.value,
          child: child,
        ),
      ),
    );
  }
}
