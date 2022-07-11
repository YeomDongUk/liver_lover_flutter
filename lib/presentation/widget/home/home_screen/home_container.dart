import 'package:flutter/material.dart';
import 'package:yak/core/static/color.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.boxColor = Colors.white,
    this.alignment,
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final Color? boxColor;
  final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueGrayLight,
            blurRadius: 10,
          )
        ],
      ),
      child: child,
    );
  }
}
