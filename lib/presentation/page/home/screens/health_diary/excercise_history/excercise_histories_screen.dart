// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:table_calendar/table_calendar.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_histories.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_history_average.dart';
import 'package:yak/presentation/bloc/calendar/calendar_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/excercise_histories/excercise_histories_cubit.dart';
import 'package:yak/presentation/bloc/excercise_histories/smoking_history/excercise_history_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/weekly_table_calendar.dart';
import 'package:yak/presentation/widget/excercise_history/create_excercise_history_dialog.dart';
import 'package:yak/presentation/widget/health_diary/go_graph_button.dart';

class ExcerciseHistoriesScreen extends StatefulWidget {
  const ExcerciseHistoriesScreen({super.key});

  @override
  State<ExcerciseHistoriesScreen> createState() =>
      _ExcerciseHistoriesScreenState();
}

class _ExcerciseHistoriesScreenState extends State<ExcerciseHistoriesScreen>
    with AutomaticKeepAliveClientMixin {
  late final CalendarCubit calendarCubit;
  late final ExcerciseHistoriesCubit excerciseHistoriesCubit;
  late final ExcerciseHistoryCubit excerciseHistoryCubit;

  @override
  void initState() {
    final now = DateTime.now();
    final focusDate = DateTime(now.year, now.month, now.day)
        .add(Duration(days: -(now.weekday % 7)));

    calendarCubit = CalendarCubit(
      now: DateTime(now.year, now.month, now.day),
      focusDate: focusDate,
    );

    excerciseHistoriesCubit = ExcerciseHistoriesCubit(
      getExcerciseHistories: KiwiContainer().resolve<GetExcerciseHistories>(),
    )..load(
        BetweenDateTime(
          start: focusDate,
          end: focusDate.add(const Duration(days: 6)),
        ),
      ).then(
        (value) => excerciseHistoryCubit.updateExcerciseHistory(
          excerciseHistoriesCubit.state.excerciseHistories.firstWhereOrNull(
            (element) => element.date == DateTime(now.year, now.month, now.day),
          ),
        ),
      );

    excerciseHistoryCubit = ExcerciseHistoryCubit(
      getExcerciseHistoryAverage:
          KiwiContainer().resolve<GetExcerciseHistoryAverage>(),
    );

    super.initState();
  }

  @override
  void dispose() {
    calendarCubit.close();
    excerciseHistoriesCubit.close();
    excerciseHistoryCubit.close();
    super.dispose();
  }

  void openCreateHistoryDialog() => showDialog<void>(
        context: context,
        builder: (_) => CreateExcerciseHistoryDialog(
          date: calendarCubit.state.selectedDate,
          onCreate: (excerciseHistory) {
            excerciseHistoryCubit.updateExcerciseHistory(
              excerciseHistory,
            );

            excerciseHistoriesCubit.load(
              BetweenDateTime(
                start: calendarCubit.state.focusDate,
                end: calendarCubit.state.focusDate.add(
                  const Duration(
                    days: 6,
                  ),
                ),
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: [
        BlocBuilder<CurrentTimeCubit, DateTime>(
          buildWhen: (prev, next) =>
              yyyyMMddFormat.format(prev) != yyyyMMddFormat.format(next),
          builder: (context, state) =>
              BlocBuilder<CalendarCubit, CalendarState>(
            bloc: calendarCubit,
            builder: (context, calendarState) =>
                BlocBuilder<ExcerciseHistoriesCubit, ExcerciseHistoriesState>(
              bloc: excerciseHistoriesCubit,
              builder: (context, state) => WeeklyTableCalendar(
                singleMarkerBuilder: (context, day, event) => Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                firstDay: calendarCubit.firstDay,
                focusedDay: calendarState.focusDate,
                currentDay: calendarState.selectedDate,
                eventLoader: (dateTime) => state.excerciseHistories
                    .map(
                      (e) =>
                          yyyyMMddFormat.format(e.date) ==
                          yyyyMMddFormat.format(dateTime),
                    )
                    .toList()
                    .where((element) => element == true)
                    .toList(),
                selectedDayPredicate: (day) =>
                    day == calendarState.selectedDate,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(calendarState.selectedDate, selectedDay)) {
                    calendarCubit.updateSelectDate(selectedDay);
                    final excerciseHistory = excerciseHistoriesCubit
                        .state.excerciseHistories
                        .firstWhereOrNull(
                      (element) => element.date == selectedDay,
                    );

                    excerciseHistoryCubit.updateExcerciseHistory(
                      excerciseHistory,
                    );
                  }
                },
                onPageChanged: (dateTime) {
                  final startDate = dateTime.add(
                    Duration(
                      days: -(dateTime.weekday == 7 ? 0 : dateTime.weekday),
                    ),
                  );

                  calendarCubit.updateFocusDate(
                    startDate.isBefore(calendarCubit.firstDay)
                        ? calendarCubit.firstDay
                        : startDate,
                  );
                  excerciseHistoriesCubit.load(
                    BetweenDateTime(
                      start: startDate,
                      end: startDate.add(const Duration(days: 6)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        CommonShadowBox(
          margin: const EdgeInsets.all(16),
          child: BlocBuilder<ExcerciseHistoryCubit, ExcerciseHistoryState>(
            bloc: excerciseHistoryCubit,
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    '운동량',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ).rixMGoEB,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '일 평균 운동량 (최근 한달)',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoM,
                          ),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              text: TextSpan(
                                style: GoogleFonts.lato(),
                                children: [
                                  TextSpan(
                                    text: '${(state.average * 10).ceil() / 10}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: AppColors.blueGrayDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const WidgetSpan(child: SizedBox(width: 8)),
                                  TextSpan(
                                    text: '분',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            '오늘 운동량',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoM,
                          ),
                          const Spacer(),
                          BlocBuilder<CalendarCubit, CalendarState>(
                            bloc: calendarCubit,
                            builder: (context, calendarState) =>
                                BlocBuilder<CurrentTimeCubit, DateTime>(
                              builder: (context, now) {
                                final excerciseHistory = state.excerciseHistory;
                                final nowDate =
                                    DateTime(now.year, now.month, now.day);
                                final isAfterDate =
                                    calendarState.selectedDate.isAfter(nowDate);

                                return RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.lato(),
                                    children: [
                                      if (isAfterDate ||
                                          excerciseHistory != null)
                                        TextSpan(
                                          text:
                                              '${excerciseHistory?.minuite ?? 0}',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: AppColors.blueGrayDark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = openCreateHistoryDialog,
                                        )
                                      else
                                        WidgetSpan(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: GestureDetector(
                                              onTap: openCreateHistoryDialog,
                                              child: SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                      const WidgetSpan(
                                        child: SizedBox(width: 8),
                                      ),
                                      TextSpan(
                                        text: '분',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                        ).rixMGoM,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Text(
                        '체중',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                        ).rixMGoM,
                      ),
                      const Spacer(),
                      BlocBuilder<CalendarCubit, CalendarState>(
                        bloc: calendarCubit,
                        builder: (context, calendarState) =>
                            BlocBuilder<CurrentTimeCubit, DateTime>(
                          builder: (context, now) {
                            final excerciseHistory = state.excerciseHistory;
                            final nowDate =
                                DateTime(now.year, now.month, now.day);
                            final isSameDate = yyyyMMddFormat
                                    .format(calendarState.selectedDate) ==
                                yyyyMMddFormat.format(nowDate);

                            return RichText(
                              text: TextSpan(
                                style: GoogleFonts.lato(),
                                children: [
                                  if (!isSameDate || excerciseHistory != null)
                                    TextSpan(
                                      text: '${excerciseHistory?.weight ?? 0}',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: AppColors.blueGrayDark,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = openCreateHistoryDialog,
                                    )
                                  else
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: GestureDetector(
                                          onTap: openCreateHistoryDialog,
                                          child: SvgPicture.asset(
                                            'assets/svg/add.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  const WidgetSpan(
                                    child: SizedBox(width: 8),
                                  ),
                                  TextSpan(
                                    text: 'kg',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GoGraphButton(
          onPressed: () => context.beamToNamed(
            Routes.excerciseHistoriesGraphs,
            popBeamLocationOnPop: true,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
