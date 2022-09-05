// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/widget/common/expanded_scetion_widget.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_detail_container.dart';

class HospitalVisitScheduleCalendar extends StatelessWidget {
  const HospitalVisitScheduleCalendar({
    super.key,
    required this.onTap,
    required this.firstDateOfMonth,
    required this.hospitalVisitSchedule,
    required this.hospitalVisitSchedules,
  });
  final void Function(HospitalVisitSchedule hospitalVisitSchedule) onTap;
  final DateTime firstDateOfMonth;
  final HospitalVisitSchedule? hospitalVisitSchedule;
  final List<HospitalVisitSchedule> hospitalVisitSchedules;

  @override
  Widget build(BuildContext context) {
    final firstDayOfWeekDay = firstDateOfMonth.weekday - 1;
    final lastDateOfMonth =
        DateTime(firstDateOfMonth.year, firstDateOfMonth.month + 1, 0);

    final dayList = List.generate(
      lastDateOfMonth.day - firstDateOfMonth.day + firstDayOfWeekDay + 1,
      (index) => index < firstDayOfWeekDay + firstDateOfMonth.day - 1
          ? null
          : index - firstDayOfWeekDay + 1,
    );

    final rowCount = (dayList.length / 7).ceil();

    return Column(
      children: List.generate(
        rowCount,
        (rowIndex) {
          final minIndex = rowIndex * 7;
          final maxIndex = rowIndex * 7 + 6;
          final subDayList = dayList.sublist(
            minIndex,
            maxIndex > dayList.length - 1 ? null : maxIndex + 1,
          );

          final subSchedules = hospitalVisitSchedules.where(
            (element) =>
                element.reservedAt.year == firstDateOfMonth.year &&
                element.reservedAt.month == firstDateOfMonth.month &&
                subDayList.contains(element.reservedAt.day),
          );

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
                      final isNotShown =
                          index > dayList.length - 1 || dayList[index] == null;

                      final hospitalVisitSchedule = hospitalVisitSchedules
                          .where(
                            (element) =>
                                element.reservedAt.year ==
                                    firstDateOfMonth.year &&
                                element.reservedAt.month ==
                                    firstDateOfMonth.month &&
                                element.reservedAt.day ==
                                    (isNotShown ? null : dayList[index]),
                          )
                          .lastOrNull;

                      return isNotShown
                          ? const SizedBox(width: 43, height: 43)
                          : GestureDetector(
                              onTap: hospitalVisitSchedule == null
                                  ? null
                                  : () => onTap(hospitalVisitSchedule),
                              child: Semantics(
                                excludeSemantics: true,
                                child: AnimatedContainer(
                                  width: 43,
                                  height: 43,
                                  alignment: Alignment.center,
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        hospitalVisitSchedule?.status.color ??
                                            Colors.transparent,
                                  ),
                                  child: Text(
                                    '${dayList[index]}',
                                    style: GoogleFonts.lato(
                                      fontSize: 19,
                                      color:
                                          hospitalVisitSchedule?.status != null
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
                expand: subSchedules.contains(hospitalVisitSchedule),
                child: !subSchedules.contains(hospitalVisitSchedule)
                    ? const SizedBox()
                    : HospitalVisitScheduleDetailContainer(
                        margin: const EdgeInsets.all(16).copyWith(top: 8),
                        hospitalVisitSchedule: hospitalVisitSchedule!,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
