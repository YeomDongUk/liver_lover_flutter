// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

class MedicationScheduleTimeButton extends StatelessWidget {
  const MedicationScheduleTimeButton({
    super.key,
    required this.hour,
    required this.isSelected,
    required this.onTap,
  });

  final int hour;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.blueGrayLight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          color: isSelected ? AppColors.primary : null,
        ),
        child: Text(
          '${'$hour'.padLeft(2, '0')}:00',
          style: GoogleFonts.lato(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
