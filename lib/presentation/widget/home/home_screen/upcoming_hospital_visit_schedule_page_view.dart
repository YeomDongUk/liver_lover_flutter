// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Project imports:
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_detail_dialog.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_empty_widget.dart';

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
            grayText: '외래/검진 ',
            primaryText: '예약일정',
          ),
        ),
        BlocBuilder<HospitalVisitSchedulesCubit, HospitalVisitSchedulesState>(
          builder: (context, state) {
            final unVisitedHospitalVisitSchedules = state.hospitalVisitSchedules
                .where((element) => element.visitedAt == null);
            return unVisitedHospitalVisitSchedules.isEmpty
                ? const HospitalVisitScheduleEmptyWidget()
                : SizedBox(
                    height: 140,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: unVisitedHospitalVisitSchedules.length,
                      itemBuilder: (context, index) {
                        final hospitalVisitSchedule =
                            unVisitedHospitalVisitSchedules.elementAt(index);
                        return Center(
                          child: HospitalVisitScheduleOverviewContainer(
                            hospitalVisitSchedule: hospitalVisitSchedule,
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
        BlocBuilder<HospitalVisitSchedulesCubit, HospitalVisitSchedulesState>(
          buildWhen: (prev, curr) =>
              prev.hospitalVisitSchedules
                  .where((element) => element.visitedAt == null)
                  .length !=
              curr.hospitalVisitSchedules
                  .where((element) => element.visitedAt == null)
                  .length,
          builder: (context, state) => state.hospitalVisitSchedules
                  .where((element) => element.visitedAt == null)
                  .isEmpty
              ? const SizedBox()
              : Center(
                  child: PageviewIndicator(
                    pageController: pageController,
                    pageCoount: state.hospitalVisitSchedules
                        .where((element) => element.visitedAt == null)
                        .length,
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
      height: 122,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            if (hospitalVisitSchedule.visitedAt != null) {
              showDialog<void>(
                context: context,
                builder: (_) => HospitalVisitScheduleDetailDialog(
                  reservedAt: hospitalVisitSchedule.reservedAt,
                ),
              );
              return;
            }

            final itemScrollController = context.read<ItemScrollController>();
            final index = context
                .read<HospitalVisitSchedulesCubit>()
                .state
                .hospitalVisitSchedules
                .indexOf(hospitalVisitSchedule);
            context.read<PageController>().jumpToPage(1);

            Future<void>.delayed(
              Duration(
                milliseconds: itemScrollController.isAttached ? 0 : 300,
              ),
              () => itemScrollController.jumpTo(index: index),
            );
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
                        style: GoogleFonts.lato(
                          fontSize: 28,
                          color: AppColors.primary,
                          height: 1,
                        ),
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
