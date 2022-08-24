// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class JoinContainer extends StatelessWidget {
  const JoinContainer({
    super.key,
    required this.child,
    this.label,
    this.labelWidget,
    this.color,
  });
  final String? label;
  final Widget? labelWidget;
  final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null || labelWidget != null) ...[
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.gray,
              ).rixMGoB,
            )
          else if (labelWidget != null)
            labelWidget!,
          const SizedBox(height: 10),
        ],
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightGray,
            ),
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
          child: child,
        ),
      ],
    );
  }
}
