import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_done_check_dialog.dart';

class MedicationInformationPageview extends StatelessWidget {
  const MedicationInformationPageview({
    super.key,
    required this.medicationInformation,
    required this.medicationSchedule,
    required this.isOver,
    required this.medicate,
  });

  final Function(String scheduleId) medicate;
  final MedicationInformation medicationInformation;
  final MedicationSchedule medicationSchedule;

  final bool isOver;

  @override
  Widget build(BuildContext context) {
    final isMedicated = medicationSchedule.medicatedAt != null;

    return GestureDetector(
      onTap: isMedicated
          ? null
          : () => showDialog<void>(
                context: context,
                builder: (context) => MedicationDoneCheckDialog(
                  onTap: () => medicate(medicationSchedule.id),
                ),
              ),
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              'assets/svg/check.svg',
              color: isMedicated
                  ? AppColors.primary
                  : isOver
                      ? AppColors.magenta
                      : null,
            ),
            const SizedBox(height: 7),
            if (!isMedicated && !isOver)
              Text(
                '복용전',
                style: const TextStyle(
                  color: AppColors.gray,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                ).rixMGoB,
                textAlign: TextAlign.center,
              )
            else if (!isMedicated && isOver)
              Text(
                '미복용',
                style: const TextStyle(
                  color: AppColors.magenta,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                ).rixMGoB,
                textAlign: TextAlign.center,
              )
            else
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${hhmmFormat.format(medicationSchedule.medicatedAt!)} ',
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '복약완료',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                      ).rixMGoB,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
