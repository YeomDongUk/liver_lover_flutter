import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';

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
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  ).airbnbEB,
                ),
                Text(
                  mothDay,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.gray,
                  ).airbnbM,
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
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ).airbnbEB,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '1일 전 알림',
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
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ).airbnbEB,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '2시간 전 알림',
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: const Color(0xffebebec)),
                color: Colors.white,
              ),
              child: Column(
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => print("?"),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(60),
                ),
                child: Text(
                  '다음 검진/외래 일정 등록',
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
