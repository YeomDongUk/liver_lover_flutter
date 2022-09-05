// Flutter imports:

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:cuid/cuid.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_histories.dart';
import 'package:yak/presentation/bloc/excercise_histories/excercise_histories_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class ExcerciseHistoryGraphPage extends StatefulWidget {
  const ExcerciseHistoryGraphPage({super.key});

  @override
  State<ExcerciseHistoryGraphPage> createState() =>
      _ExcerciseHistoryGraphPageState();
}

class _ExcerciseHistoryGraphPageState extends State<ExcerciseHistoryGraphPage>
    with SingleTickerProviderStateMixin {
  late final ExcerciseHistoriesCubit excerciseHistoriesCubit;
  late final TabController tabController;
  int tabIndex = 0;
  int pageIndex = 3;

  final weekOfDay = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final now = DateTime.now();
  late final weekday = now.weekday == 7 ? 0 : now.weekday;
  late final end = DateTime(now.year, now.month, now.day + (6 - weekday));
  late final start = DateTime(end.year, end.month, end.day - 27);

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    )..addListener(() => setState(() => tabIndex = tabController.index));
    // final start = DateTime(now.year, now.month, now.day);

    excerciseHistoriesCubit = ExcerciseHistoriesCubit(
      getExcerciseHistories: KiwiContainer().resolve<GetExcerciseHistories>(),
    )..load(
        BetweenDateTime(
          start: start,
          end: DateTime.now(),
        ),
      );
    super.initState();
  }

  @override
  void dispose() {
    excerciseHistoriesCubit.close();
    super.dispose();
  }

  double get sum => tabIndex == 0 ? minuiteSum.toDouble() : weightSum;

  double get weightSum =>
      excerciseHistoriesCubit.state.excerciseHistories.fold<double>(
        0,
        (previousValue, element) => previousValue + element.weight,
      );

  int get minuiteSum =>
      excerciseHistoriesCubit.state.excerciseHistories.fold<int>(
        0,
        (previousValue, element) => previousValue + element.minuite,
      );

  List<ExcerciseHistory> get histories => List.generate(28, (index) {
        final date = start.add(Duration(days: index));
        final history =
            excerciseHistoriesCubit.state.excerciseHistories.firstWhereOrNull(
          (element) => element.date == date,
        );

        return history ??
            ExcerciseHistory(
              id: newCuid(),
              minuite: 0,
              weight: 0,
              date: date,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
      });

  List<ExcerciseHistory> get subHistories => histories.sublist(
        7 * pageIndex,
        7 * (pageIndex + 1),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('운동 추이 그래프'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Colors.white,
                      child: const Divider(
                        height: 4,
                        thickness: 4,
                        color: AppColors.blueGrayLight,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: TabBar(
                      controller: tabController,
                      tabs: List.generate(
                        2,
                        (index) => Tab(
                          text: ['운동량', '체중'][index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: List.generate(
                  2,
                  (_tabIndex) => LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.6,
                            child: BlocBuilder<ExcerciseHistoriesCubit,
                                ExcerciseHistoriesState>(
                              bloc: excerciseHistoriesCubit,
                              builder: (context, state) => state.status !=
                                      ExcerciseHistoriesStatus.loadSuccess
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : state.excerciseHistories.isEmpty
                                      ? const Center(child: Text('데이터 없음'))
                                      : Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 22,
                                                ),
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            if (subHistories.any(
                                              (element) => _tabIndex == 0
                                                  ? element.minuite != 0
                                                  : element.weight != 0,
                                            ))
                                              Positioned.fill(
                                                top: 114,
                                                child: LineChart(
                                                  mainData(_tabIndex),
                                                ),
                                              ),
                                            Positioned(
                                              top: 24,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: AppColors.magenta,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    4,
                                                    (index) => Expanded(
                                                      child: GestureDetector(
                                                        onTap: () => setState(
                                                          () =>
                                                              pageIndex = index,
                                                        ),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: index ==
                                                                    pageIndex
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              6,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            [
                                                              '3주전',
                                                              '2주전',
                                                              '1주전',
                                                              '이번주'
                                                            ][index],
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              color: index ==
                                                                      pageIndex
                                                                  ? AppColors
                                                                      .primary
                                                                  : Colors
                                                                      .white,
                                                            ).rixMGoEB,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.4,
                            child: BlocBuilder<ExcerciseHistoriesCubit,
                                ExcerciseHistoriesState>(
                              bloc: excerciseHistoriesCubit,
                              builder: (context, state) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 24),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '최근 한달 운동량',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.gray,
                                            ).rixMGoM,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '$sum',
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: AppColors.blueGrayDark,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '일 평균 운동량 (최근 한달)',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.gray,
                                            ).rixMGoM,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${((sum / 28) * 10).roundToDouble() / 10}',
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: AppColors.blueGrayDark,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '주간 운동량',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.gray,
                                            ).rixMGoM,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${subHistories.fold<double>(0, (previousValue, element) => previousValue + (_tabIndex == 0 ? element.minuite : element.weight)).roundToDouble()}',
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: AppColors.blueGrayDark,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '일 평균 운동량 (주간)',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.gray,
                                            ).rixMGoM,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${((subHistories.fold<double>(0, (previousValue, element) => previousValue + (_tabIndex == 0 ? element.minuite : element.weight)) / 7) * 10).roundToDouble() / 10}',
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: AppColors.blueGrayDark,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData(int _tabIndex) {
    final spots = histories
        .mapIndexed(
          (index, history) => FlSpot(
            index % 7 + 1,
            (_tabIndex == 0 ? history.minuite : history.weight).toDouble(),
          ),
        )
        .toList();

    final subSpots = spots.sublist(
      7 * pageIndex,
      7 * (pageIndex + 1),
    );

    final maxY = subSpots.map((e) => e.y).reduce(max);

    return LineChartData(
      backgroundColor: AppColors.primary,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY == 0 ? 1 : maxY / 6,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) => FlLine(
          color: AppColors.blueGrayLight.withOpacity(0.2),
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                value == meta.min || value == meta.max
                    ? const SizedBox()
                    : SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(
                          weekOfDay[value.toInt() - 1],
                          style: GoogleFonts.lato(
                            color: AppColors.gray,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
            getTitlesWidget: (value, meta) {
              final list =
                  List.generate(6, (index) => (maxY / 6 * (index + 1)).floor());

              if (value <= meta.min ||
                  value >= meta.max ||
                  !list.contains(value.floor())) {
                return const SizedBox();
              }

              return Center(
                child: Text(
                  '$value',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: maxY,
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: subHistories
                    .map((e) => _tabIndex == 0 ? e.minuite : e.weight)
                    .fold<double>(
                      0,
                      (previousValue, e) => previousValue + e,
                    ) /
                7,
            color: Colors.black.withOpacity(
              0.5,
            ),
          ),
        ],
      ),
      lineBarsData: subSpots.isEmpty
          ? null
          : [
              LineChartBarData(
                spots: subSpots,
                isCurved: true,
                color: Colors.white,
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withOpacity(0.45),
                      AppColors.paleGray,
                    ],
                  ),
                ),
              ),
            ],
    );
  }
}
