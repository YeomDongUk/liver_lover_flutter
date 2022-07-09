import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/home/hospital_visit_schedule_update_dialog.dart';

class UpcomingHospitalVisitSchedulePageView extends StatefulWidget {
  const UpcomingHospitalVisitSchedulePageView({super.key});

  @override
  State<UpcomingHospitalVisitSchedulePageView> createState() =>
      _UpcomingHospitalVisitSchedulePageViewState();
}

class _UpcomingHospitalVisitSchedulePageViewState
    extends State<UpcomingHospitalVisitSchedulePageView> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HomeLabel(
            grayText: '정기검진/외래 ',
            primaryText: '예약일정',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 154,
          child: BlocBuilder<HospitalVisitSchedulesCubit,
              HospitalVisitSchedulesState>(
            builder: (context, state) {
              if (state.hospitalVisitSchedules.isEmpty) {
                return HomeContainer(
                  boxColor: Colors.transparent,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 120,
                  child: Material(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () => context
                          .beamToNamed(Routes.hospitalVisitScheduleCreate),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('등록된 검진/외래 일정이 없습니다.'),
                            Text('지금 일정을 등록하세요'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              return PageView.builder(
                controller: pageController,
                itemCount: state.hospitalVisitSchedules.length,
                itemBuilder: (context, index) {
                  final hospitalVisitSchedule =
                      state.hospitalVisitSchedules[index];
                  return Center(
                    child: HospitalVisitScheduleOverviewContainer(
                      hospitalVisitSchedule: hospitalVisitSchedule,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HospitalVisitSchedulesCubit, HospitalVisitSchedulesState>(
          buildWhen: (prev, curr) =>
              prev.hospitalVisitSchedules.length !=
              curr.hospitalVisitSchedules.length,
          builder: (context, state) => state.hospitalVisitSchedules.isEmpty
              ? const SizedBox()
              : Center(
                  child: PageviewIndicator(
                    pageController: pageController,
                    pageCoount: state.hospitalVisitSchedules.length,
                  ),
                ),
        ),
      ],
    );
  }
}

class HospitalVisitScheduleOverviewContainer extends StatelessWidget {
  const HospitalVisitScheduleOverviewContainer({
    super.key,
    required this.hospitalVisitSchedule,
  });

  final HospitalVisitSchedule hospitalVisitSchedule;

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 120,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            if (hospitalVisitSchedule.status ==
                HospitalVisitScheduleStatus.inProgress) {
              showDialog<void>(
                context: context,
                builder: (_) => HospitalVisitScheduleUpdateDialog(
                  hospitalVisitSchedule: hospitalVisitSchedule,
                ),
              );
            } else {
              final index = context
                  .read<HospitalVisitSchedulesCubit>()
                  .state
                  .hospitalVisitSchedules
                  .indexOf(hospitalVisitSchedule);
              context.read<PageController>().jumpToPage(1);
              Future<void>.delayed(
                const Duration(milliseconds: 300),
                () => context.read<ItemScrollController>().jumpTo(index: index),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(
              top: 18,
              bottom: 20,
            ),
            child: Row(
              children: [
                BlocBuilder<CurrentTimeCubit, DateTime>(
                  builder: (context, now) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospitalVisitSchedule.status ==
                                HospitalVisitScheduleStatus.done
                            ? '진료완료'
                            : hospitalVisitSchedule.status ==
                                    HospitalVisitScheduleStatus.inProgress
                                ? '진료중'
                                : DdayParser.parseDday(
                                    hospitalVisitSchedule.reservedAt,
                                  ),
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.magenta,
                        ).airbnbB,
                      ),
                      Text(
                        DateFormat('MM.dd\nHH:mm')
                            .format(hospitalVisitSchedule.reservedAt),
                        style: const TextStyle(
                          fontSize: 28,
                          color: AppColors.primary,
                          height: 1,
                        ).airbnbEB,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 23),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        hospitalVisitSchedule.hospitalName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                            overflow: TextOverflow.ellipsis,
                          ).rixMGoB,
                          children: [
                            TextSpan(
                              text: '${hospitalVisitSchedule.medicalSubject} ',
                            ),
                            TextSpan(
                              text: hospitalVisitSchedule.doctorName,
                              style: const TextStyle(
                                fontSize: 17,
                                color: AppColors.blueGrayDark,
                              ),
                            ),
                            const TextSpan(
                              text: ' 교수',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
