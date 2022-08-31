// Flutter imports:
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

// Package imports:
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
import 'package:yak/domain/usecases/smoking_history/get_smoking_histories.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_history_average.dart';
import 'package:yak/presentation/bloc/calendar/calendar_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/smoking_histories/smoking_histories_cubit.dart';
import 'package:yak/presentation/bloc/smoking_histories/smoking_history/smoking_history_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/weekly_table_calendar.dart';
import 'package:yak/presentation/widget/health_diary/go_graph_button.dart';
import 'package:yak/presentation/widget/smoking_history/create_smoking_history_dialog.dart';

class SmokingHistoriesScreen extends StatefulWidget {
  const SmokingHistoriesScreen({super.key});

  @override
  State<SmokingHistoriesScreen> createState() => _SmokingHistoriesScreenState();
}

class _SmokingHistoriesScreenState extends State<SmokingHistoriesScreen>
    with AutomaticKeepAliveClientMixin {
  late final CalendarCubit calendarCubit;
  late final SmokingHistoriesCubit smokingHistoriesCubit;
  late final SmokingHistoryCubit smokingHistoryCubit;

  @override
  void initState() {
    final now = DateTime.now();
    final focusDate = DateTime(now.year, now.month, now.day)
        .add(Duration(days: -(now.weekday % 7)));

    calendarCubit = CalendarCubit(
      now: DateTime(now.year, now.month, now.day),
      focusDate: focusDate,
    );

    smokingHistoriesCubit = SmokingHistoriesCubit(
      getSmokingHistories: KiwiContainer().resolve<GetSmokingHistories>(),
    )..load(
        BetweenDateTime(
          start: focusDate,
          end: focusDate.add(const Duration(days: 6)),
        ),
      ).then(
        (value) => smokingHistoryCubit.updateSmokingHistory(
          smokingHistoriesCubit.state.smokingHistories.firstWhereOrNull(
            (element) => element.date == DateTime(now.year, now.month, now.day),
          ),
        ),
      );

    smokingHistoryCubit = SmokingHistoryCubit(
      getSmokingHistoryAverage:
          KiwiContainer().resolve<GetSmokingHistoryAverage>(),
    );

    super.initState();
  }

  @override
  void dispose() {
    calendarCubit.close();
    smokingHistoriesCubit.close();
    smokingHistoryCubit.close();
    super.dispose();
  }

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
                BlocBuilder<SmokingHistoriesCubit, SmokingHistoriesState>(
              bloc: smokingHistoriesCubit,
              builder: (context, state) => WeeklyTableCalendar(
                singleMarkerBuilder: (context, day, event) => Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.magenta,
                    shape: BoxShape.circle,
                  ),
                ),
                firstDay: calendarCubit.firstDay,
                focusedDay: calendarState.focusDate,
                currentDay: calendarState.selectedDate,
                eventLoader: (dateTime) => state.smokingHistories
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
                    final smokingHistory = smokingHistoriesCubit
                        .state.smokingHistories
                        .firstWhereOrNull(
                      (element) => element.date == selectedDay,
                    );

                    smokingHistoryCubit.updateSmokingHistory(
                      smokingHistory,
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
                  smokingHistoriesCubit.load(
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
                  '흡연량',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoEB,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<SmokingHistoryCubit, SmokingHistoryState>(
                  bloc: smokingHistoryCubit,
                  builder: (context, state) => Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '일 평균 흡연량 (최근 한달)',
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
                                    text: '개비',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                      fontWeight: FontWeight.normal,
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
                            '오늘 흡연량',
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
                                final smokingHistory = state.smokingHistory;
                                final nowDate =
                                    DateTime(now.year, now.month, now.day);
                                final isAfterDate =
                                    calendarState.selectedDate.isAfter(nowDate);

                                return RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.lato(),
                                    children: [
                                      if (isAfterDate || smokingHistory != null)
                                        TextSpan(
                                          text:
                                              '${smokingHistory?.amount ?? 0}',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: AppColors.blueGrayDark,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      else
                                        WidgetSpan(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: GestureDetector(
                                              onTap: () => showDialog<void>(
                                                context: context,
                                                builder: (_) =>
                                                    CreateSmokingHistoryDialog(
                                                  date: calendarCubit
                                                      .state.selectedDate,
                                                  onCreate: (smokingHistory) {
                                                    smokingHistoryCubit
                                                        .updateSmokingHistory(
                                                      smokingHistory,
                                                    );

                                                    smokingHistoriesCubit.load(
                                                      BetweenDateTime(
                                                        start: calendarCubit
                                                            .state.focusDate,
                                                        end: calendarCubit
                                                            .state.focusDate
                                                            .add(
                                                          const Duration(
                                                            days: 6,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
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
                                        text: '개비',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.normal,
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
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  '과다흡연(heavy smoking)은 하루 평균 흡연량 25개비 이상인 경우입니다.',
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
          onPressed: () => context.beamToNamed(Routes.smokingHistoriesGraphs),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
