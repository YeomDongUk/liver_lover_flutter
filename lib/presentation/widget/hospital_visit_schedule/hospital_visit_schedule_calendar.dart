// Flutter imports:
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/widget/common/expanded_scetion_widget.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_detail_container.dart';

class HospitalVisitScheduleCalendar extends StatefulWidget {
  const HospitalVisitScheduleCalendar({
    super.key,
    required this.onTap,
    required this.firstDateOfMonth,
    required this.hospitalVisitSchedules,
    required this.selectedDate,
  });
  final void Function(DateTime dateTime) onTap;
  final DateTime firstDateOfMonth;
  final DateTime? selectedDate;
  final List<HospitalVisitSchedule> hospitalVisitSchedules;

  @override
  State<HospitalVisitScheduleCalendar> createState() =>
      _HospitalVisitScheduleCalendarState();
}

class _HospitalVisitScheduleCalendarState
    extends State<HospitalVisitScheduleCalendar> {
  late final firstDayOfWeekDay = widget.firstDateOfMonth.weekday - 1;
  late final lastDateOfMonth = DateTime(
    widget.firstDateOfMonth.year,
    widget.firstDateOfMonth.month + 1,
    0,
  );

  late final dayList = List.generate(
    lastDateOfMonth.day - widget.firstDateOfMonth.day + firstDayOfWeekDay + 1,
    (index) => index < firstDayOfWeekDay + widget.firstDateOfMonth.day - 1
        ? null
        : index - firstDayOfWeekDay + 1,
  );

  late final rowCount = (dayList.length / 7).ceil();

  late final List<PageController> pageControllers = List.generate(
    rowCount,
    (index) => PageController(),
  );

  @override
  void dispose() {
    for (final pageController in pageControllers) {
      pageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

          final subSchedules = widget.hospitalVisitSchedules.where(
            (element) =>
                element.reservedAt.year == widget.firstDateOfMonth.year &&
                element.reservedAt.month == widget.firstDateOfMonth.month &&
                subDayList.contains(element.reservedAt.day),
          );

          final selectedDaySchedules = subSchedules.where(
            (element) =>
                element.reservedAt.year == widget.selectedDate?.year &&
                element.reservedAt.month == widget.selectedDate?.month &&
                element.reservedAt.day == widget.selectedDate?.day,
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

                      final subHospitalVisitSchedules = subSchedules.where(
                        (element) =>
                            element.reservedAt.year ==
                                widget.firstDateOfMonth.year &&
                            element.reservedAt.month ==
                                widget.firstDateOfMonth.month &&
                            element.reservedAt.day ==
                                (isNotShown ? null : dayList[index]),
                      );

                      final isAllDone = subHospitalVisitSchedules.isNotEmpty &&
                          subHospitalVisitSchedules.every(
                            (hospitalVisitSchedule) =>
                                hospitalVisitSchedule.status ==
                                HospitalVisitScheduleStatus.done,
                          );

                      final isAnyProgress =
                          subHospitalVisitSchedules.isNotEmpty &&
                              subHospitalVisitSchedules.any(
                                (hospitalVisitSchedule) =>
                                    hospitalVisitSchedule.status ==
                                    HospitalVisitScheduleStatus.inProgress,
                              );

                      return isNotShown
                          ? const SizedBox(width: 43, height: 43)
                          : GestureDetector(
                              onTap: subHospitalVisitSchedules.isEmpty
                                  ? null
                                  : () => widget.onTap(
                                        DateTime(
                                          widget.firstDateOfMonth.year,
                                          widget.firstDateOfMonth.month,
                                          dayList[index]!,
                                        ),
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
                                    color: subHospitalVisitSchedules.isEmpty
                                        ? Colors.transparent
                                        : isAllDone
                                            ? AppColors.green
                                            : isAnyProgress
                                                ? AppColors.magenta
                                                : AppColors.orange,
                                  ),
                                  child: Text(
                                    '${dayList[index]}',
                                    style: GoogleFonts.lato(
                                      fontSize: 19,
                                      color:
                                          subHospitalVisitSchedules.isNotEmpty
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
                expand: selectedDaySchedules.isNotEmpty,
                child: selectedDaySchedules.isEmpty
                    ? const SizedBox()
                    : Column(
                        children: [
                          const SizedBox(height: 8),
                          ExpandablePageView.builder(
                            controller: pageControllers[rowIndex],
                            itemCount: selectedDaySchedules.length,
                            itemBuilder: (context, index) =>
                                HospitalVisitScheduleDetailContainer(
                              margin: const EdgeInsets.all(16).copyWith(top: 8),
                              hospitalVisitSchedule:
                                  selectedDaySchedules.elementAt(index),
                            ),
                          ),
                          PageIndexIndicator(
                            pageController: pageControllers[rowIndex],
                            pageCount: selectedDaySchedules.length,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
