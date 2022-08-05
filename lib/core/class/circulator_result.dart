// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

abstract class CirculatorResult {
  CirculatorResult({required this.value}) {
    _circulate();
  }
  late final String text;
  final double value;
  late final Color color;
  late final String resultText;

  void _circulate() {
    if (this is Fib4CirculatorResult) {
      if (value < 1.45) {
        color = AppColors.green;
        resultText = '정상';
      } else if (value < 3.25) {
        color = AppColors.orange;
        resultText = '주의';
      } else {
        color = AppColors.magenta;
        resultText = '주의';
      }
    }
    if (this is PageBCirculatorResult) {
      if (value <= 8) {
        color = AppColors.green;
        resultText = '정상';
      } else if (value <= 12) {
        color = AppColors.orange;
        resultText = '주의';
      } else {
        color = AppColors.magenta;
        resultText = '주의';
      }
    }
  }
}

class Fib4CirculatorResult extends CirculatorResult {
  Fib4CirculatorResult({required super.value}) {
    text = 'FIB-4 계산결과';
  }
}

class PageBCirculatorResult extends CirculatorResult {
  PageBCirculatorResult({required super.value}) {
    text = 'Modified PAGE-B 계산결과';
  }
}
