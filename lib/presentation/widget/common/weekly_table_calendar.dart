// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class WeeklyTableCalendar extends StatelessWidget {
  const WeeklyTableCalendar({
    super.key,
    required this.firstDay,
    required this.focusedDay,
    required this.currentDay,
    required this.singleMarkerBuilder,
    this.eventLoader,
    this.selectedDayPredicate,
    this.onDaySelected,
    this.onPageChanged,
  });

  final DateTime firstDay;
  final DateTime focusedDay;
  final DateTime currentDay;
  final List<bool> Function(DateTime)? eventLoader;
  final bool Function(DateTime)? selectedDayPredicate;
  final void Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime)? onPageChanged;
  final Widget? Function(BuildContext, DateTime, bool)? singleMarkerBuilder;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124 + 68,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
        color: Colors.white,
      ),
      child: TableCalendar<bool>(
        availableGestures: AvailableGestures.horizontalSwipe,
        calendarBuilders: CalendarBuilders(
          singleMarkerBuilder: singleMarkerBuilder,
        ),
        headerStyle: HeaderStyle(
          leftChevronIcon: SvgPicture.asset(
            'assets/svg/left.svg',
            color: Theme.of(context).primaryColor,
          ),
          rightChevronIcon: SvgPicture.asset(
            'assets/svg/right.svg',
            color: Theme.of(context).primaryColor,
          ),
          titleTextStyle: GoogleFonts.lato(
            height: 1.2,
            fontSize: 30,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        rowHeight: 76,
        firstDay: firstDay,
        locale: 'ko_KR',
        lastDay: DateTime.now(),
        focusedDay: focusedDay,
        currentDay: currentDay,
        daysOfWeekHeight: 46,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoM,
          weekdayStyle: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoM,
        ),
        calendarStyle: CalendarStyle(
          weekendTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: AppColors.blueGrayDark,
            fontWeight: FontWeight.bold,
          ),
          defaultTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: AppColors.blueGrayDark,
            fontWeight: FontWeight.bold,
          ),
          selectedTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          todayTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: AppColors.blueGrayDark,
            fontWeight: FontWeight.bold,
          ),
          todayDecoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          disabledTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: AppColors.blueGrayDark,
            fontWeight: FontWeight.bold,
          ),
          outsideTextStyle: GoogleFonts.lato(
            fontSize: 19,
            color: AppColors.blueGrayDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarFormat: CalendarFormat.week,
        eventLoader: eventLoader,
        selectedDayPredicate: selectedDayPredicate,
        onDaySelected: onDaySelected,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
