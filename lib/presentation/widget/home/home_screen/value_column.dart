// Flutter imports:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class ValueColumn extends StatelessWidget {
  const ValueColumn({
    super.key,
    required this.label,
    required this.value,
    required this.unitText,
  });
  final String label;
  final int? value;
  final String unitText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).airbnbM,
        ),
        const SizedBox(height: 10),
        Text(
          '${value ?? '-'}',
          style: GoogleFonts.lato(
            fontSize: 35,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          unitText,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).airbnbBo,
        ),
      ],
    );
  }
}
