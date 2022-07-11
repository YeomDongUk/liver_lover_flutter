import 'package:flutter/material.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class JoinContainer extends StatelessWidget {
  const JoinContainer({
    super.key,
    this.label,
    required this.child,
  });
  final String? label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.gray,
            ).rixMGoB,
          ),
          const SizedBox(height: 10),
        ],
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGray,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: child,
        ),
      ],
    );
  }
}
