import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_daily_groups_stream.dart';
import 'package:yak/presentation/bloc/medication_schedules/calendar/medication_schedules_calendar_cubit.dart';
import 'package:yak/presentation/widget/common/expanded_scetion_widget.dart';

class MedicationScheduleCalendar extends StatefulWidget {
  const MedicationScheduleCalendar({
    super.key,
    required this.firstDateOfMonth,
  });

  final DateTime firstDateOfMonth;

  @override
  State<MedicationScheduleCalendar> createState() =>
      _MedicationScheduleCalendarState();
}

class _MedicationScheduleCalendarState
    extends State<MedicationScheduleCalendar> {
  late final MedicationSchedulesCalendarCubit medicationSchedulesCalendarCubit;

  @override
  void initState() {
    medicationSchedulesCalendarCubit = MedicationSchedulesCalendarCubit(
      firstDateOfMonth: widget.firstDateOfMonth,
      getMedicationScheduleDailyGroupsStream:
          KiwiContainer().resolve<GetMedicationScheduleDailyGroupsStream>(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    medicationSchedulesCalendarCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfWeekDay = widget.firstDateOfMonth.weekday - 1;
    final lastDateOfMonth = DateTime(
      widget.firstDateOfMonth.year,
      widget.firstDateOfMonth.month + 1,
      0,
    );

    final dayList = List.generate(
      lastDateOfMonth.day - widget.firstDateOfMonth.day + firstDayOfWeekDay + 1,
      (index) => index < firstDayOfWeekDay + widget.firstDateOfMonth.day - 1
          ? null
          : index - firstDayOfWeekDay + 1,
    );

    final rowCount = (dayList.length / 7).ceil();

    return BlocBuilder<MedicationSchedulesCalendarCubit,
        MedicationSchedulesCalendarState>(
      bloc: medicationSchedulesCalendarCubit,
      builder: (context, state) => Column(
        children: List.generate(
          rowCount,
          (rowIndex) {
            final minIndex = rowIndex * 7;
            final maxIndex = rowIndex * 7 + 6;
            final subDayList = dayList.sublist(
              minIndex,
              maxIndex > dayList.length - 1 ? null : maxIndex + 1,
            );

            final subMedicationScheduleDailyGroups = state
                .medicationScheduleDailyGroups
                .where(
                  (element) =>
                      element.dateTime.year == widget.firstDateOfMonth.year &&
                      element.dateTime.month == widget.firstDateOfMonth.month &&
                      subDayList.contains(element.dateTime.day),
                )
                .toList();

            final selectedDate = context.read<DateTime? Function()>()();

            final medicationScheduleGroups = subMedicationScheduleDailyGroups
                .firstWhereOrNull((element) => element.dateTime == selectedDate)
                ?.medicationScheduleGroups;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      7,
                      (columnIndex) {
                        final index = rowIndex * 7 + columnIndex;
                        final isNotShown = index > dayList.length - 1 ||
                            dayList[index] == null;

                        final medicationScheduleDailyGroup =
                            subMedicationScheduleDailyGroups.firstWhereOrNull(
                          (element) =>
                              element.dateTime.year ==
                                  widget.firstDateOfMonth.year &&
                              element.dateTime.month ==
                                  widget.firstDateOfMonth.month &&
                              element.dateTime.day ==
                                  (isNotShown ? null : dayList[index]),
                        );

                        return isNotShown
                            ? const SizedBox(width: 43, height: 43)
                            : GestureDetector(
                                onTap: medicationScheduleDailyGroup == null
                                    ? null
                                    : () => context
                                        .read<void Function(DateTime)>()
                                        .call(
                                          medicationScheduleDailyGroup.dateTime,
                                        ),
                                child: Semantics(
                                  excludeSemantics: true,
                                  child: AnimatedContainer(
                                    width: 43,
                                    height: 43,
                                    alignment: Alignment.center,
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: medicationScheduleDailyGroup
                                              ?.medicationScheduleDailyGroupStatus
                                              .color ??
                                          Colors.transparent,
                                    ),
                                    child: Text(
                                      '${dayList[index]}',
                                      style: GoogleFonts.lato(
                                        fontSize: 19,
                                        color: medicationScheduleDailyGroup
                                                    ?.medicationScheduleDailyGroupStatus !=
                                                null
                                            ? Colors.white
                                            : AppColors.blueGrayDark,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ).toList(),
                  ),
                ),
                ExpandedSectionWidget(
                  expand: subMedicationScheduleDailyGroups
                      .map((e) => e.dateTime)
                      .contains(selectedDate),
                  child: selectedDate == null
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16)
                              .copyWith(
                            top: 8,
                            bottom: 16,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x7ecdced2),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 21,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      mmDDFormat.format(selectedDate),
                                      style: GoogleFonts.lato(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/svg/right.svg',
                                      color: AppColors.primary,
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
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 18,
                                  children: List.generate(
                                    (medicationScheduleGroups
                                              ?..sort(
                                                (prev, curr) => prev.reservedAt
                                                    .compareTo(curr.reservedAt),
                                              ))
                                            ?.length ??
                                        0,
                                    (index) {
                                      final medicationScheduleGroup =
                                          medicationScheduleGroups![index];
                                      return Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(3),
                                              ),
                                              color: medicationScheduleGroup
                                                      .isAllMedicated
                                                  ? AppColors.green
                                                  : medicationScheduleGroup
                                                          .isAnyMedicated
                                                      ? AppColors.orange
                                                      : AppColors.magenta,
                                            ),
                                            child: Text(
                                              hhmmFormat.format(
                                                medicationScheduleGroup
                                                    .reservedAt,
                                              ),
                                              style: GoogleFonts.lato(
                                                fontSize: 19,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            medicationScheduleGroup
                                                        .medicatedAt ==
                                                    null
                                                ? '-'
                                                : hhmmFormat.format(
                                                    medicationScheduleGroup
                                                        .medicatedAt!,
                                                  ),
                                            style: GoogleFonts.lato(
                                              color: AppColors.blueGrayDark,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
