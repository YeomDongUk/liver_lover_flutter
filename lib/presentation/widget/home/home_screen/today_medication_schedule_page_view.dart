import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:yak/core/class/d_day_parser.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/today/today_medication_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';

class TodayMedicationSchedulePageView extends StatefulWidget {
  const TodayMedicationSchedulePageView({super.key});

  @override
  State<TodayMedicationSchedulePageView> createState() =>
      _TodayMedicationSchedulePageViewState();
}

class _TodayMedicationSchedulePageViewState
    extends State<TodayMedicationSchedulePageView> {
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
            grayText: '오늘의 ',
            primaryText: '복약일정',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 108,
          child: BlocBuilder<TodayMedicationSchedulesCubit,
              TodayMedicationSchedulesState>(
            builder: (context, state) {
              if (state.medicationSchedules.isEmpty) {
                return HomeContainer(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('등록된 복약 일정이 없습니다.'),
                      Text('지금 일정을 등록하세요.'),
                    ],
                  ),
                );
              }

              return PageView.builder(
                controller: pageController,
                itemCount: state.medicationSchedules.length,
                itemBuilder: (context, index) => Center(
                  child: MedicationScheduleOverviewContainer(
                    medicationSchedule: state.medicationSchedules[index],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        BlocBuilder<TodayMedicationSchedulesCubit,
            TodayMedicationSchedulesState>(
          buildWhen: (previous, current) =>
              previous.medicationSchedules.length !=
              current.medicationSchedules.length,
          builder: (context, state) {
            if (state.medicationSchedules.isEmpty) {
              return const SizedBox.shrink();
            }

            return Center(
              child: PageviewIndicator(
                pageController: pageController,
                pageCoount: 4,
              ),
            );
          },
        ),
      ],
    );
  }
}

class MedicationScheduleOverviewContainer extends StatelessWidget {
  const MedicationScheduleOverviewContainer({
    super.key,
    required this.medicationSchedule,
  });

  final MedicationSchedule medicationSchedule;

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      height: 88,
      boxColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.only(
              left: 24,
              top: 14,
              right: 20,
              bottom: 24,
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/pill.svg'),
                const SizedBox(width: 24),
                Expanded(
                  child: BlocBuilder<CurrentTimeCubit, DateTime>(
                    builder: (context, state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              DateFormat('HH:mm')
                                  .format(medicationSchedule.reservedAt),
                              style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).primaryColor,
                              ).airbnbEB,
                            ),
                            const SizedBox(width: 9),
                            Text(
                              DdayParser.parseDday(
                                medicationSchedule.reservedAt,
                                parseTime: true,
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.magenta,
                              ).airbnbB,
                            ),
                          ],
                        ),
                        Text(
                          state.isAfter(medicationSchedule.reservedAt)
                              ? '복약 시간이 지났습니다.'
                              : '복약시간이 다가옵니다.',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/check.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
