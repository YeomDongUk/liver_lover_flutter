import 'package:flutter/material.dart';
import 'package:yak/core/static/color.dart';

class CustomProgressBarPainter extends CustomPainter {
  const CustomProgressBarPainter({required this.percent});

  final num percent;
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(10),
        ),
      );
    canvas
      ..drawPath(
        backgroundPath,
        Paint()..color = AppColors.blueGrayLight,
      )
      ..clipPath(backgroundPath);

    final linePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width * percent, size.height),
          const Radius.circular(10),
        ),
      );

    canvas
      ..drawPath(
        linePath,
        Paint()..color = AppColors.skyBlue,
      )
      ..clipPath(linePath);
  }

  @override
  bool shouldRepaint(covariant CustomProgressBarPainter oldDelegate) =>
      oldDelegate.percent != percent;
}
