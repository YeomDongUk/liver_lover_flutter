// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Project imports:
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_delete_check_dialog.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_detail_dialog.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_done_check_dialog.dart';

class HospitalVisitScheduleDetailContainer extends StatelessWidget {
  const HospitalVisitScheduleDetailContainer({
    super.key,
    required this.hospitalVisitSchedule,
    this.margin,
  });
  final EdgeInsets? margin;
  final HospitalVisitSchedule hospitalVisitSchedule;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => HospitalVisitScheduleDetailDialog(
          reservedAt: hospitalVisitSchedule.reservedAt,
        ),
      ),
      child: CommonShadowBox(
        margin: margin,
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
                                      ? '?????????'
                                      : DdayParser.parseDday(
                                          hospitalVisitSchedule.reservedAt,
                                        ),
                              style: hospitalVisitSchedule.status ==
                                      HospitalVisitScheduleStatus.wating
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
                  // if (hospitalVisitSchedule.hospitalName.contains('??????????????????') ||
                  //     hospitalVisitSchedule.hospitalName.contains('???????????????????????????'))
                  //   SvgPicture.asset(
                  //     'assets/svg/logo_${hospitalVisitSchedule.hospitalName.contains('??????????????????') ? 'smc' : 'emc'}.svg',
                  //   )
                  // else
                  Text(
                    hospitalVisitSchedule.hospitalName,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.primary,
                    ).rixMGoEB,
                  ),
                  const Spacer(),
                  if (hospitalVisitSchedule.hospitalName.contains('??????????????????') ||
                      hospitalVisitSchedule.hospitalName.contains('???????????????????????????'))
                    GestureDetector(
                      onTap: () async {
                        if (hospitalVisitSchedule.hospitalName
                            .contains('??????????????????')) {
                          await launchUrlString('tel:1599-3114');
                        } else {
                          await launchUrlString('tel:1899-0001');
                        }
                      },
                      child: Text(
                        '??????????????????',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
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
                          '??????',
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
                            ? '????????????'
                            : '????????????',
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
                          '????????????',
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
                          '????????????',
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
                HospitalVisitScheduleStatus.wating) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/alarm.svg'),
                    const SizedBox(width: 10),
                    Text(
                      '${hospitalVisitSchedule.beforePush ? '1??? ??? ??????' : ''}${hospitalVisitSchedule.afterPush && hospitalVisitSchedule.beforePush ? ', ' : ''}${hospitalVisitSchedule.afterPush ? '2?????? ??? ??????' : ''}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.gray,
                      ).rixMGoB,
                    ),
                    const Spacer(),
                    CommonSwitch(
                      value: hospitalVisitSchedule.afterPush ||
                          hospitalVisitSchedule.beforePush,
                      onToggle: (value) => context
                          .read<HospitalVisitSchedulesCubit>()
                          .togglePush(hospitalVisitSchedule.id),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
            if (hospitalVisitSchedule.status !=
                HospitalVisitScheduleStatus.done)
              BlocBuilder<CurrentTimeCubit, DateTime>(
                builder: (context, now) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      ...[],
                      if (hospitalVisitSchedule.status ==
                          HospitalVisitScheduleStatus.inProgress) ...[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
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
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromHeight(50),
                              backgroundColor: AppColors.gray,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ).rixMGoEB,
                            ),
                            child: const Text('?????? ??????'),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ] else if (hospitalVisitSchedule.status ==
                              HospitalVisitScheduleStatus.wating &&
                          now.isBefore(hospitalVisitSchedule.reservedAt)) ...[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => context.beamToNamed(
                              Routes.hospitalVisitScheduleUpdate,
                              data: {
                                'hospitalVisitSchedule': hospitalVisitSchedule
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromHeight(50),
                              backgroundColor: AppColors.gray,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ).rixMGoEB,
                            ),
                            child: const Text('?????? ??????'),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (hospitalVisitSchedule.visitedAt == null) ...[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => showDialog<void>(
                              context: context,
                              builder: (context) =>
                                  HospitalVisitScheduleDeleteCheckDialog(
                                hospitalVisitScheduleId:
                                    hospitalVisitSchedule.id,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromHeight(50),
                              backgroundColor: AppColors.gray,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ).rixMGoEB,
                            ),
                            child: const Text('?????? ??????'),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
