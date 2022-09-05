import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/functions.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/medication_schedules_groups_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/pill_detail_dialog.dart';

class MedicationScheduleGroupListPageView extends StatefulWidget {
  const MedicationScheduleGroupListPageView({super.key, required this.date});

  final DateTime date;

  @override
  State<MedicationScheduleGroupListPageView> createState() =>
      MedicationScheduleGroupListPageViewState();
}

class MedicationScheduleGroupListPageViewState
    extends State<MedicationScheduleGroupListPageView> {
  late final MedicationScheduleGroupsCubit medicationScheduleGroupsCubit;

  @override
  void initState() {
    medicationScheduleGroupsCubit = MedicationScheduleGroupsCubit(
      getMedicationScheduleGroupsStream:
          KiwiContainer().resolve<GetMedicationScheduleGroupsStream>(),
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    )..load(widget.date);
    super.initState();
  }

  @override
  void dispose() {
    medicationScheduleGroupsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationScheduleGroupsCubit,
        MedicationScheduleGroupsState>(
      bloc: medicationScheduleGroupsCubit,
      builder: (context, state) => ListView.separated(
        padding: const EdgeInsets.only(bottom: 24),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: state.medicationScheduleGroups.length + 1,
        itemBuilder: (context, index) => index ==
                state.medicationScheduleGroups.length
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () =>
                      context.beamToNamed(Routes.medicationSchedulesCalendar),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    '복약이력',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ).rixMGoEB,
                  ),
                ),
              )
            : BlocBuilder<CurrentTimeCubit, DateTime>(
                builder: (context, now) {
                  final group = state.medicationScheduleGroups.elementAt(index);

                  final isOver = group.reservedAt.isBefore(now);

                  final diff = now.difference(group.reservedAt);

                  final isToday = now.year == widget.date.year &&
                      now.month == widget.date.month &&
                      now.day == widget.date.day;

                  return CommonShadowBox(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () => context.beamToNamed(
                        '${Routes.medicationSchedules}/groups/detail',
                        data: {
                          'reservedAt': group.reservedAt,
                        },
                      ),
                      borderRadius: BorderRadius.circular(6),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '''${'${group.reservedAt.hour}'.padLeft(2, '0')}:00''',
                                  style: GoogleFonts.lato(
                                    fontSize: 28,
                                    color: isOver
                                        ? AppColors.blueGrayLight
                                        : Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                if (group.isAnyMedicated)
                                  Text(
                                    hhmmFormat.format(
                                      group.medicatedAt!,
                                    ),
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                else if (diff.inSeconds < 0 && isToday)
                                  Text(
                                    '-${formatDuration(diff.abs())}',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: AppColors.skyBlue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/svg/check.svg',
                                  color: group.isAllMedicated
                                      ? AppColors.primary
                                      : !isOver
                                          ? null
                                          : group.isAnyMedicated
                                              ? AppColors.orange
                                              : AppColors.magenta,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Column(
                              children: group.medicationInformations.mapIndexed(
                                (index, e) {
                                  final isMedicated = group.medicationSchedules
                                          .firstWhereOrNull(
                                            (element) =>
                                                element
                                                    .medicationInformationId ==
                                                e.id,
                                          )
                                          ?.medicatedAt !=
                                      null;

                                  return Column(
                                    children: [
                                      if (index > 0) const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/icon_pill.svg',
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              e.pill!.name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: !isOver
                                                    ? AppColors.blueGrayDark
                                                    : isMedicated
                                                        ? AppColors.primary
                                                        : AppColors.magenta,
                                              ).rixMGoB,
                                            ),
                                          ),
                                          const SizedBox(width: 28),
                                          Text(
                                            '${e.takeCount}'.padRight(4, '0'),
                                            style: GoogleFonts.lato(
                                              color: AppColors.gray,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 28),
                                          GestureDetector(
                                            onTap: () => showDialog<void>(
                                              context: context,
                                              builder: (_) => PillDetailDialog(
                                                pill: e.pill!,
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/svg/icon_info.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          if (!isOver && !group.isAllMedicated) ...[
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/alarm.svg'),
                                  const SizedBox(width: 10),
                                  Text(
                                    '30분 전 알림, 30분 후 알림',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoB,
                                  ),
                                  const Spacer(),
                                  CommonSwitch(
                                    onToggle: (value) =>
                                        medicationScheduleGroupsCubit
                                            .togglePush(
                                      push: value,
                                      reservedAt: group.reservedAt,
                                    ),
                                    value: group.push,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
