// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/functions.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/medication_schedules_groups_cubit.dart';
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
  late final MedicationScheduleGroupsCubit medicationScheduleGroupsCubit;

  @override
  void initState() {
    medicationScheduleGroupsCubit = MedicationScheduleGroupsCubit(
      getMedicationScheduleGroupsStream:
          KiwiContainer().resolve<GetMedicationScheduleGroupsStream>(),
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    )..load(date);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    medicationScheduleGroupsCubit.close();
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
          medicationScheduleGroupsCubit.load(date);
        }

        return prevDate != nowDate;
      },
      builder: (context, now) => BlocBuilder<MedicationScheduleGroupsCubit,
          MedicationScheduleGroupsState>(
        bloc: medicationScheduleGroupsCubit,
        builder: (context, state) {
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
                child: state.medicationScheduleGroups.isEmpty
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
                                Routes.medicationSchedulesCreate,
                              ),
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
                        itemCount: state.medicationScheduleGroups.length,
                        itemBuilder: (context, index) => Center(
                          child: MedicationScheduleOverviewContainer(
                            medicationScheduleGroup:
                                state.medicationScheduleGroups.elementAt(index),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 6),
              if (state.medicationScheduleGroups.isEmpty)
                const SizedBox.shrink()
              else
                Center(
                  child: PageviewIndicator(
                    pageController: pageController,
                    pageCoount: state.medicationScheduleGroups.length,
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
    required this.medicationScheduleGroup,
  });

  final MedicationScheduleGroup medicationScheduleGroup;

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
              reservedAt: medicationScheduleGroup.reservedAt,
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
                final diff = now.difference(medicationScheduleGroup.reservedAt);
                return Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/pill.svg',
                      color: medicationScheduleGroup.isAllMedicated
                          ? null
                          : now.isAfter(
                              medicationScheduleGroup.reservedAt,
                            )
                              ? AppColors.magenta
                              : AppColors.gray,
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat('HH:mm').format(
                                  medicationScheduleGroup.reservedAt,
                                ),
                                style: GoogleFonts.lato(
                                  fontSize: 28,
                                  color: medicationScheduleGroup.isAllMedicated
                                      ? AppColors.blueGrayLight
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(width: 9),
                              Text(
                                medicationScheduleGroup.isAllMedicated
                                    ? hhmmFormat.format(
                                        medicationScheduleGroup.medicatedAt!,
                                      )
                                    : '${diff.isNegative ? '-' : '+'}${formatDuration(diff)}',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: medicationScheduleGroup.isAllMedicated
                                      ? AppColors.primary
                                      : AppColors.magenta,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            medicationScheduleGroup.isAllMedicated
                                ? '복용을 완료했습니다.'
                                : now.isAfter(
                                    medicationScheduleGroup.reservedAt,
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
                      color: medicationScheduleGroup.isAllMedicated
                          ? AppColors.primary
                          : now.isAfter(
                              medicationScheduleGroup.reservedAt,
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
