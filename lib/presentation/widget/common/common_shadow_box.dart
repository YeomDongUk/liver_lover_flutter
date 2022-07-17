import 'package:flutter/material.dart';

class CommonShadowBox extends StatelessWidget {
  const CommonShadowBox({
    super.key,
    this.margin,
    this.padding,
    this.boxDecoration,
    this.child,
    this.color = Colors.white,
  });
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? boxDecoration;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x7ecdced2),
            blurRadius: 20,
          )
        ],
        color: color,
      ).copyWith(
        color: boxDecoration?.color,
        borderRadius: boxDecoration?.borderRadius,
        border: boxDecoration?.border,
        boxShadow: boxDecoration?.boxShadow,
      ),
      child: child,
    );
  }
}
