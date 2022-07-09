import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';

class HospitalVisitScheduleDetailContainer extends StatelessWidget {
  const HospitalVisitScheduleDetailContainer({
    super.key,
    required this.hospitalVisitSchedule,
  });
  final HospitalVisitSchedule hospitalVisitSchedule;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat('MM.dd HH:mm')
                    .format(hospitalVisitSchedule.reservedAt),
              ),
              const Spacer(),
              BlocBuilder<CurrentTimeCubit, DateTime>(
                builder: (context, state) => Text(
                  hospitalVisitSchedule.status ==
                          HospitalVisitScheduleStatus.done
                      ? '진료완료'
                      : hospitalVisitSchedule.status ==
                              HospitalVisitScheduleStatus.inProgress
                          ? '진료중'
                          : DdayParser.parseDday(
                              hospitalVisitSchedule.reservedAt,
                            ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(),
              Expanded(
                child: Text(hospitalVisitSchedule.doctorName),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(),
              Expanded(
                child: Text(hospitalVisitSchedule.medicalSubject),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(),
              Expanded(
                child: Text(hospitalVisitSchedule.doctorName),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(),
              Expanded(
                child: Text(hospitalVisitSchedule.doctorName),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [],
          ),
          const Divider(),
          BlocBuilder<CurrentTimeCubit, DateTime>(
            builder: (context, now) {
              final inProgress = hospitalVisitSchedule.status ==
                  HospitalVisitScheduleStatus.inProgress;

              return TextButton(
                onPressed: inProgress
                    ? () => context
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
                    : () {
                        context.beamToNamed(Routes.hospitalVisitScheduleUpdate);
                      },
                child: Text(
                  inProgress ? '진료완료' : '수정',
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
