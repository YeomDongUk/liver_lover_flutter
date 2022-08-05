// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';

class HospitalScheduleInputDateField extends StatelessWidget {
  const HospitalScheduleInputDateField({
    super.key,
    required this.label,
    required this.strDateTimeAt,
    this.onTap,
  });
  final String label;
  final String strDateTimeAt;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoB,
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 48,
            child: JoinContainer(
              color: Colors.white,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  strDateTimeAt.isEmpty
                      ? strDateTimeAt
                      : reservedAtDateFormat.format(
                          DateTime.fromMillisecondsSinceEpoch(
                            int.parse(strDateTimeAt),
                          ),
                        ),
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blueGrayDark,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
