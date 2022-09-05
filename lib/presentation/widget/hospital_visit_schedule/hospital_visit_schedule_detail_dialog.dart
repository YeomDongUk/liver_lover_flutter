// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_done_check_dialog.dart';

class HospitalVisitScheduleDetailDialog extends StatelessWidget {
  const HospitalVisitScheduleDetailDialog({
    super.key,
    required this.reservedAt,
  });

  final DateTime reservedAt;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalVisitSchedulesCubit,
        HospitalVisitSchedulesState>(
      builder: (context, state) {
        final hospitalVisitSchedule = state.hospitalVisitSchedules
            .where(
              (element) => element.reservedAt == reservedAt,
            )
            .firstOrNull;

        return CommonDialog(
          child: hospitalVisitSchedule == null
              ? const Center(
                  child: Text('일정이 존재하지 않습니다'),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Column(
                        children: [
                          Text(
                            hhmmFormat.format(DateTime.now()),
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            yyyyMMddFormat
                                .format(DateTime.now())
                                .split('.')
                                .sublist(1)
                                .join('.'),
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/alarm.svg'),
                          const SizedBox(width: 5),
                          Text(
                            hhmmFormat.format(hospitalVisitSchedule.reservedAt),
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${hospitalVisitSchedule.beforePush ? '1일 전 알림, ' : ''}${hospitalVisitSchedule.afterPush ? '2시간 전 알림' : ''}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                            color: const Color(0xffebebec),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: SvgPicture.asset(
                                'assets/svg/logo_${hospitalVisitSchedule.hospitalName == '삼성서울병원' ? 'smc' : 'emc'}.svg',
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 47,
                                        child: Text(
                                          '구분',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.gray,
                                          ).rixMGoB,
                                        ),
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        hospitalVisitSchedule.type ==
                                                HospitalVisitScheduleType
                                                    .regular
                                            ? '정기검진'
                                            : '외래진료',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Theme.of(context).primaryColor,
                                        ).rixMGoEB,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 47,
                                        child: Text(
                                          '진료과목',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.gray,
                                          ).rixMGoB,
                                        ),
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        hospitalVisitSchedule.medicalSubject,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Theme.of(context).primaryColor,
                                        ).rixMGoEB,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 47,
                                        child: Text(
                                          '담당의사',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.gray,
                                          ).rixMGoB,
                                        ),
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        hospitalVisitSchedule.doctorName,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Theme.of(context).primaryColor,
                                        ).rixMGoEB,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: GestureDetector(
                                onTap: () async {
                                  final now = DateTime.now();
                                  final canDoneSchedule = !now.isBefore(
                                        hospitalVisitSchedule.reservedAt,
                                      ) &&
                                      hospitalVisitSchedule.visitedAt == null;

                                  if (canDoneSchedule) {
                                    await showDialog<bool>(
                                      context: context,
                                      builder: (context) =>
                                          HospitalVisitScheduleDoneCheckDialog(
                                        hospitalVisitScheduleId:
                                            hospitalVisitSchedule.id,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/check.svg',
                                        color: hospitalVisitSchedule.status ==
                                                HospitalVisitScheduleStatus.done
                                            ? AppColors.primary
                                            : null,
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        hospitalVisitSchedule.status.text,
                                        style: TextStyle(
                                          color: hospitalVisitSchedule.status ==
                                                  HospitalVisitScheduleStatus
                                                      .done
                                              ? AppColors.primary
                                              : AppColors.gray,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13,
                                        ).rixMGoB,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
