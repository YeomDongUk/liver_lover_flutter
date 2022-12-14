// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';

class HospitalVisitScheduleUpdateDialog extends StatelessWidget {
  const HospitalVisitScheduleUpdateDialog({
    super.key,
    required this.hospitalVisitSchedule,
  });

  final HospitalVisitSchedule hospitalVisitSchedule;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('HH:mm').format(hospitalVisitSchedule.reservedAt);
    final mothDay =
        DateFormat('MM:dd').format(hospitalVisitSchedule.reservedAt);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width - 36,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Text(
                  time,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  ),
                ),
                Text(
                  mothDay,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),
            // if (hospitalVisitSchedule.beforePush ||
            //     hospitalVisitSchedule.afterPush)
            ...[
              const Divider(),
              const SizedBox(height: 10),
              ...[
                // if (hospitalVisitSchedule.beforePush)

                Row(
                  children: [
                    Text(
                      DateFormat('MM:dd HH:mm').format(
                        hospitalVisitSchedule.reservedAt.add(
                          const Duration(days: -1),
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '1??? ??? ??????',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.gray,
                      ).rixMGoB,
                    ),
                  ],
                ),
                // if (hospitalVisitSchedule.afterPush)
                Row(
                  children: [
                    Text(
                      DateFormat('MM:dd HH:mm').format(
                        hospitalVisitSchedule.reservedAt.add(
                          const Duration(hours: -2),
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '2?????? ??? ??????',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.gray,
                      ).rixMGoB,
                    ),
                  ],
                ),
              ].map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: e,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
            ],
            CommonShadowBox(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => context
                    .beamToReplacementNamed(Routes.hospitalVisitScheduleCreate),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(60),
                ),
                child: Text(
                  '?????? ??????/?????? ?????? ??????',
                  style: const TextStyle(
                    fontSize: 17,
                  ).rixMGoEB.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
