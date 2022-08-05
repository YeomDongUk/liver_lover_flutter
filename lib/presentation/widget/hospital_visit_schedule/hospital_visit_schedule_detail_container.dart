// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';

class HospitalVisitScheduleDetailContainer extends StatelessWidget {
  const HospitalVisitScheduleDetailContainer({
    super.key,
    required this.hospitalVisitSchedule,
  });
  final HospitalVisitSchedule hospitalVisitSchedule;
  @override
  Widget build(BuildContext context) {
    return CommonShadowBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: DateFormat('MM.dd HH:mm')
                            .format(hospitalVisitSchedule.reservedAt),
                        style: GoogleFonts.lato(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: hospitalVisitSchedule.status !=
                                  HospitalVisitScheduleStatus.done
                              ? Theme.of(context).primaryColor
                              : AppColors.blueGrayLight,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 8)),
                      WidgetSpan(
                        child: BlocBuilder<CurrentTimeCubit, DateTime>(
                          builder: (context, state) => Text(
                            hospitalVisitSchedule.status ==
                                    HospitalVisitScheduleStatus.done
                                ? ''
                                : hospitalVisitSchedule.status ==
                                        HospitalVisitScheduleStatus.inProgress
                                    ? '진료중'
                                    : DdayParser.parseDday(
                                        hospitalVisitSchedule.reservedAt,
                                      ),
                            style: hospitalVisitSchedule.status ==
                                    HospitalVisitScheduleStatus.none
                                ? GoogleFonts.lato(
                                    fontSize: 20,
                                    color: AppColors.magenta,
                                    fontWeight: FontWeight.w700,
                                  )
                                : const TextStyle(
                                    fontSize: 17,
                                    color: AppColors.magenta,
                                  ).rixMGoEB,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/svg/check.svg',
                  color: hospitalVisitSchedule.status !=
                          HospitalVisitScheduleStatus.done
                      ? null
                      : AppColors.green,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/logo_${hospitalVisitSchedule.hospitalName == '삼성서울병원' ? 'smc' : 'emc'}.svg',
                ),
                const Spacer(),
                Text(
                  '진료예약안내',
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
                              HospitalVisitScheduleType.regular
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
                        '진료실',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      hospitalVisitSchedule.doctorOffice,
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
          if (hospitalVisitSchedule.status ==
              HospitalVisitScheduleStatus.none) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/alarm.svg'),
                  const SizedBox(width: 10),
                  Text(
                    '1일전 알림, 2시간 전 알림',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                    ).rixMGoB,
                  ),
                  const Spacer(),
                  CommonSwitch(
                    value: hospitalVisitSchedule.push,
                    onToggle: print,
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
          if (hospitalVisitSchedule.status != HospitalVisitScheduleStatus.done)
            BlocBuilder<CurrentTimeCubit, DateTime>(
              builder: (context, now) {
                final inProgress = hospitalVisitSchedule.status ==
                    HospitalVisitScheduleStatus.inProgress;

                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () => inProgress
                        ? context
                            .read<HospitalVisitSchedulesCubit>()
                            .visit(
                              hospitalVisitSchedule.id,
                            )
                            .then((value) {
                            context.read<SurveyGroupsCubit>().removeSurveyGroup(
                                  hospitalVisitscheduleId:
                                      hospitalVisitSchedule.id,
                                );
                          })
                        :

                        /// TODO: 일정 삭제 함수
                        null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      primary: inProgress
                          ? Theme.of(context).primaryColor
                          : AppColors.gray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ).rixMGoEB,
                    ),
                    child: Text(
                      inProgress ? '진료 완료' : '일정 삭제',
                    ),
                  ),
                );

                // if (hospitalVisitSchedule.status ==
                //     HospitalVisitScheduleStatus.done) {
                //   return const Text('');
                // } else if (hospitalVisitSchedule.status ==
                //     HospitalVisitScheduleStatus.inProgress) {
                //   return const Text('진료완료');
                // } else {
                //   return const Text('수정');
                // }
              },
            ),
        ],
      ),
    );
  }
}
