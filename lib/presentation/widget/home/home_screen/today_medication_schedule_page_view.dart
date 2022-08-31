// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
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
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_informations/medication_informations_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/medication_schdules_cubit.dart';
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
  DateTime date = DateTime.now();
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
      buildWhen: (previous, current) {
        final prevDate = DateTime(date.year, date.month, date.day);
        final nowDate = DateTime(current.year, current.month, current.day);

        if (prevDate != nowDate) {
          date = nowDate;
        }

        return prevDate != nowDate;
      },
      builder: (context, now) =>
          BlocBuilder<MedicationSchedulesCubit, MedicationSchedulesState>(
        builder: (context, state) {
          final dates = state.medicationSchedulesMap.keys
              .where(
                (reservedAt) =>
                    date.isAfter(reservedAt) &&
                    !date.add(const Duration(days: 1)).isAfter(reservedAt),
              )
              .toList();

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
              SizedBox(
                height: 108,
                child: dates.isEmpty
                    ? Center(
                        child: HomeContainer(
                          height: 88,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            child: InkWell(
                              onTap: () => context.beamToNamed(
                                  Routes.medicationSchedulesCreate),
                              borderRadius: BorderRadius.circular(6),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/pill.svg',
                                      color: AppColors.lightGray,
                                    ),
                                    const SizedBox(width: 24),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                      )
                    : PageView.builder(
                        controller: pageController,
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          final reservedAt = dates.elementAt(index);

                          final medicationInformations = state
                              .medicationSchedulesMap[reservedAt]!
                              .map(
                                (medicationSchedule) =>
                                    medicationSchedule.medicationInformationId,
                              )
                              .map(
                                (medicationInformationId) => context
                                    .read<MedicationInformationsCubit>()
                                    .state
                                    .informations
                                    .firstWhere(
                                      (element) =>
                                          element.id == medicationInformationId,
                                    ),
                              )
                              .map(
                                (e) => e.copyWith(
                                  medicationSchedules:
                                      state.medicationSchedulesMap[reservedAt],
                                ),
                              )
                              .toList();
                          return Center(
                            child: MedicationScheduleOverviewContainer(
                              medicationSchedulesGroup:
                                  MedicationSchedulesGroup(
                                medicationInformations: medicationInformations,
                                reservedAt: reservedAt,
                                push: medicationInformations.any(
                                  (element) => element.medicationSchedules.any(
                                    (element) =>
                                        element.afterPush || element.beforePush,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 6),
              if (dates.isEmpty)
                const SizedBox.shrink()
              else
                Center(
                  child: PageviewIndicator(
                    pageController: pageController,
                    pageCoount: dates.length,
                  ),
                )
            ],
          );
        },
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
                                  fontWeight: FontWeight.w900,
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
                                  fontWeight: FontWeight.w700,
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
