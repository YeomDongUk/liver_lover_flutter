import 'package:flutter/material.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({
    super.key,
    this.grayText,
    this.primaryText,
  });

  final String? grayText;
  final String? primaryText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 15,
        ).rixMGoB,
        children: [
          TextSpan(
            text: grayText,
            style: const TextStyle(
              color: AppColors.gray,
            ),
          ),
          TextSpan(
            text: primaryText,
            style: const TextStyle(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
