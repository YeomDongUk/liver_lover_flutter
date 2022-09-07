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
import 'package:yak/domain/usecases/drinking_history/get_drinking_histories.dart';
import 'package:yak/domain/usecases/drinking_history/get_drinking_history_average.dart';
import 'package:yak/presentation/bloc/calendar/calendar_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/drinking_histories/drinking_histories_cubit.dart';
import 'package:yak/presentation/bloc/drinking_histories/drinking_history/drinking_history_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/weekly_table_calendar.dart';
import 'package:yak/presentation/widget/drinking_history/create_drinking_history_dialog.dart';
import 'package:yak/presentation/widget/health_diary/go_graph_button.dart';

class DrinkingHistoriesScreen extends StatefulWidget {
  const DrinkingHistoriesScreen({super.key});

  @override
  State<DrinkingHistoriesScreen> createState() =>
      _DrinkingHistoriesScreenState();
}

class _DrinkingHistoriesScreenState extends State<DrinkingHistoriesScreen>
    with AutomaticKeepAliveClientMixin {
  late final CalendarCubit calendarCubit;
  late final DrinkingHistoriesCubit drinkingHistoriesCubit;
  late final DrinkingHistoryCubit drinkingHistoryCubit;

  @override
  void initState() {
    final now = DateTime.now();
    final focusDate = DateTime(now.year, now.month, now.day)
        .add(Duration(days: -(now.weekday % 7)));

    calendarCubit = CalendarCubit(
      now: DateTime(now.year, now.month, now.day),
      focusDate: focusDate,
    );

    drinkingHistoriesCubit = DrinkingHistoriesCubit(
      getDrinkingHistories: KiwiContainer().resolve<GetDrinkingHistories>(),
    )..load(
        BetweenDateTime(
          start: focusDate,
          end: focusDate.add(const Duration(days: 6)),
        ),
      ).then(
        (value) => drinkingHistoryCubit.updateDrinkingHistory(
          drinkingHistoriesCubit.state.drinkingHistories.firstWhereOrNull(
            (element) => element.date == DateTime(now.year, now.month, now.day),
          ),
        ),
      );

    drinkingHistoryCubit = DrinkingHistoryCubit(
      getDrinkingHistoryAverage:
          KiwiContainer().resolve<GetDrinkingHistoryAverage>(),
    );

    super.initState();
  }

  @override
  void dispose() {
    calendarCubit.close();
    drinkingHistoriesCubit.close();
    drinkingHistoryCubit.close();
    super.dispose();
  }

  void onTap() => showDialog<void>(
        context: context,
        builder: (_) => CreateDrinkingHistoryDialog(
          date: calendarCubit.state.selectedDate,
          onCreate: (drinkingHistory) {
            drinkingHistoryCubit.updateDrinkingHistory(
              drinkingHistory,
            );

            drinkingHistoriesCubit.load(
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
                BlocBuilder<DrinkingHistoriesCubit, DrinkingHistoriesState>(
              bloc: drinkingHistoriesCubit,
              builder: (context, state) => WeeklyTableCalendar(
                singleMarkerBuilder: (context, day, event) =>
                    SvgPicture.asset('assets/svg/water.svg'),
                firstDay: calendarCubit.firstDay,
                focusedDay: calendarState.focusDate,
                currentDay: calendarState.selectedDate,
                eventLoader: (dateTime) => state.drinkingHistories
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
                    final drinkingHistory = drinkingHistoriesCubit
                        .state.drinkingHistories
                        .firstWhereOrNull(
                      (element) => element.date == selectedDay,
                    );

                    drinkingHistoryCubit.updateDrinkingHistory(
                      drinkingHistory,
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
                  drinkingHistoriesCubit.load(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  '알코올 섭취량',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoEB,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<DrinkingHistoryCubit, DrinkingHistoryState>(
                  bloc: drinkingHistoryCubit,
                  builder: (context, state) => Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '일 평균 섭취 알코올 중량 (최근 한달)',
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
                                  const TextSpan(
                                    text: 'g',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                      fontWeight: FontWeight.normal,
                                    ),
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
                            '오늘 섭취 알코올 중량',
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
                                final drinkingHistory = state.drinkingHistory;
                                final nowDate =
                                    DateTime(now.year, now.month, now.day);

                                final isAfterDate =
                                    calendarState.selectedDate.isAfter(nowDate);

                                return RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.lato(),
                                    children: [
                                      if (isAfterDate ||
                                          drinkingHistory != null)
                                        TextSpan(
                                          text:
                                              '${drinkingHistory?.amount ?? 0}',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: AppColors.blueGrayDark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = onTap,
                                        )
                                      else
                                        WidgetSpan(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: GestureDetector(
                                              onTap: onTap,
                                              child: SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                      const WidgetSpan(
                                        child: SizedBox(width: 8),
                                      ),
                                      const TextSpan(
                                        text: 'g',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.normal,
                                        ),
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
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  '하루기준 위험 음주량은 남성의 경우 30g/day 이상, 여성은 20g/day 이상입니다.',
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: AppColors.magenta,
                  ).rixMGoB,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GoGraphButton(
          onPressed: () => context.beamToNamed(
            Routes.dringkingHistoriesGraphs,
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
