import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/calendar/calendar_cubit.dart';

class DrinkingHistoryScreen extends StatefulWidget {
  const DrinkingHistoryScreen({super.key});

  @override
  State<DrinkingHistoryScreen> createState() => _DrinkingHistoryScreenState();
}

class _DrinkingHistoryScreenState extends State<DrinkingHistoryScreen>
    with AutomaticKeepAliveClientMixin {
  late final CalendarCubit calendarCubit;

  late final CarouselController carouselController;
  @override
  void initState() {
    calendarCubit = CalendarCubit(now: DateTime.now());

    /// 달에 몇번째 주인지 알아야함
    carouselController = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: [
        SizedBox(
          height: 68,
          child: Row(
            children: [
              IconButton(
                onPressed: () => null,
                icon: SvgPicture.asset(
                  'assets/svg/left.svg',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: Text(
                  '2022.07',
                  style: GoogleFonts.lato(
                    height: 1.2,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: () => null,
                icon: SvgPicture.asset(
                  'assets/svg/right.svg',
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 124,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            color: Colors.white,
          ),
          child: BlocBuilder<CalendarCubit, CalendarState>(
            bloc: calendarCubit,
            builder: (context, state) => TableCalendar<bool>(
              calendarBuilders: CalendarBuilders(
                singleMarkerBuilder: (context, day, event) =>
                    SvgPicture.asset('assets/svg/water.svg'),
              ),
              rowHeight: 76,
              headerVisible: false,
              firstDay: calendarCubit.firstDay,
              locale: 'ko_KRr',
              lastDay: DateTime.now(),
              focusedDay: state.focusDate,
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
              ),
              calendarFormat: CalendarFormat.week,
              eventLoader: (dateTimes) => [true],
              selectedDayPredicate: (day) => day == state.selectedDate,
              onDaySelected: (selectedDay, focusedDay) =>
                  !isSameDay(state.selectedDate, selectedDay)
                      ? calendarCubit.updateSelectDate(selectedDay)
                      : null,
              onPageChanged: calendarCubit.updateFocusDate,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
