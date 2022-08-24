// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';

class CommonInputDateField extends StatelessWidget {
  const CommonInputDateField({
    super.key,
    this.dateTime,
    this.label,
    this.dateFormat,
    this.onTap,
  });
  final String? label;
  final DateTime? dateTime;
  final void Function()? onTap;
  final DateFormat? dateFormat;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.gray,
            ).rixMGoB,
          ),
          const SizedBox(height: 12),
        ],
        GestureDetector(
          onTap: onTap,
          child: JoinContainer(
            color: Colors.white,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                dateTime == null
                    ? ''
                    : (dateFormat ?? reservedAtDateFormat).format(dateTime!),
                style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blueGrayDark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
