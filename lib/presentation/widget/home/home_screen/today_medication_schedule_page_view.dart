// Flutter imports:
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/functions.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/today/today_medication_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_schedule_check_dialog.dart';

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
    return BlocBuilder<CurrentTimeCubit, DateTime>(
      builder: (context, now) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: HomeLabel(
              grayText: '오늘의 ',
              primaryText: '복약일정',
            ),
          ),
          SizedBox(
            height: 108,
            child: BlocBuilder<TodayMedicationSchedulesCubit,
                TodayMedicationSchedulesState>(
              builder: (context, state) {
                final medicationSchedulesGroups =
                    state.medicationSchedulesGroups;

                if (medicationSchedulesGroups.isEmpty) {
                  return Center(
                    child: HomeContainer(
                      height: 88,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        child: InkWell(
                          onTap: () => context
                              .beamToNamed(Routes.medicationSchedulesCreate),
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/pill.svg',
                                  color: AppColors.lightGray,
                                ),
                                const SizedBox(width: 24),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '등록된 복약일정이 없습니다.',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: AppColors.magenta,
                                      ).rixMGoB,
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      '지금 일정을 등록하세요',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                      ).rixMGoB,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return PageView.builder(
                  controller: pageController,
                  itemCount: medicationSchedulesGroups.length,
                  itemBuilder: (context, index) => Center(
                    child: MedicationScheduleOverviewContainer(
                      medicationSchedulesGroup:
                          medicationSchedulesGroups[index],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          BlocBuilder<TodayMedicationSchedulesCubit,
              TodayMedicationSchedulesState>(
            builder: (context, state) {
              final medicationSchedulesGroups = state.medicationSchedulesGroups
                  .where(
                    (element) => element.reservedAt.isBefore(
                      DateTime(
                        now.year,
                        now.month,
                        now.day + 1,
                      ),
                    ),
                  )
                  .toList();

              if (medicationSchedulesGroups.isEmpty) {
                return const SizedBox.shrink();
              }

              return Center(
                child: PageviewIndicator(
                  pageController: pageController,
                  pageCoount: medicationSchedulesGroups.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MedicationScheduleOverviewContainer extends StatelessWidget {
  const MedicationScheduleOverviewContainer({
    super.key,
    required this.medicationSchedulesGroup,
  });

  final MedicationSchedulesGroup medicationSchedulesGroup;

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      height: 94,
      boxColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () => showDialog<void>(
            context: context,
            builder: (_) => MedicationScheduleCheckDialog(
              medicationSchedulesGroup: medicationSchedulesGroup,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 24,
              top: 14,
              right: 20,
              bottom: 24,
            ),
            child: BlocBuilder<CurrentTimeCubit, DateTime>(
              builder: (context, now) {
                final diff =
                    now.difference(medicationSchedulesGroup.reservedAt);
                return Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/pill.svg',
                      color: medicationSchedulesGroup.isAllMedicated
                          ? null
                          : now.isAfter(
                              medicationSchedulesGroup.reservedAt,
                            )
                              ? AppColors.magenta
                              : AppColors.gray,
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat('HH:mm').format(
                                  medicationSchedulesGroup.reservedAt,
                                ),
                                style: GoogleFonts.lato(
                                  fontSize: 28,
                                  color: medicationSchedulesGroup.isAllMedicated
                                      ? AppColors.blueGrayLight
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(width: 9),
                              Text(
                                medicationSchedulesGroup.isAllMedicated
                                    ? hhmmFormat.format(
                                        medicationSchedulesGroup.medicatedAt!,
                                      )
                                    : '${diff.isNegative ? '-' : '+'}${formatDuration(diff)}',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: medicationSchedulesGroup.isAllMedicated
                                      ? AppColors.primary
                                      : AppColors.magenta,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            medicationSchedulesGroup.isAllMedicated
                                ? '복용을 완료했습니다.'
                                : now.isAfter(
                                    medicationSchedulesGroup.reservedAt,
                                  )
                                    ? '복약시간이 지났습니다.'
                                    : '복약시간이 다가옵니다.',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svg/check.svg',
                      color: medicationSchedulesGroup.isAllMedicated
                          ? AppColors.primary
                          : now.isAfter(
                              medicationSchedulesGroup.reservedAt,
                            )
                              ? AppColors.magenta
                              : AppColors.gray,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
