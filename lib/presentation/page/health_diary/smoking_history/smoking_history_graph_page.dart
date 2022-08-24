// Flutter imports:

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_histories.dart';
import 'package:yak/presentation/bloc/smoking_histories/smoking_histories_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class SmokingHistoryGraphPage extends StatefulWidget {
  const SmokingHistoryGraphPage({super.key});

  @override
  State<SmokingHistoryGraphPage> createState() =>
      _SmokingHistoryGraphPageState();
}

class _SmokingHistoryGraphPageState extends State<SmokingHistoryGraphPage> {
  late final SmokingHistoriesCubit smokingHistoriesCubit;
  late final PageController pageController;
  int pageIndex = 0;
  int dataCount = 0;
  @override
  void initState() {
    smokingHistoriesCubit = SmokingHistoriesCubit(
      getSmokingHistories: KiwiContainer().resolve<GetSmokingHistories>(),
    )..load(
        BetweenDateTime(
          start: DateTime.now().add(const Duration(days: -1)),
          end: DateTime.now(),
        ),
      );
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    smokingHistoriesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('흡연 추이 그래프'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 6,
                  child: BlocListener<SmokingHistoriesCubit,
                      SmokingHistoriesState>(
                    bloc: smokingHistoriesCubit,
                    listener: (context, state) => setState(
                      () {
                        dataCount = state.smokingHistories.length * 1;
                        pageIndex = (dataCount / 7).ceil() - 1;
                        pageController.jumpToPage(pageIndex);
                      },
                    ),
                    child: BlocBuilder<SmokingHistoriesCubit,
                        SmokingHistoriesState>(
                      bloc: smokingHistoriesCubit,
                      builder: (context, state) => state.status !=
                              SmokingHistoriesStatus.loadSuccess
                          ? const Center(child: CircularProgressIndicator())
                          : state.smokingHistories.isEmpty
                              ? const Center(child: Text('데이터 없음'))
                              : SfCartesianChart(
                                  backgroundColor: const Color(0xFF2d2d30),
                                  primaryXAxis: CategoryAxis(
                                    autoScrollingMode: AutoScrollingMode.end,
                                    labelStyle: GoogleFonts.lato(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                    visibleMinimum: pageIndex * 7,
                                    visibleMaximum: pageIndex * 7 + 7,
                                    interval: 1,
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    majorTickLines:
                                        const MajorTickLines(width: 0),
                                  ),
                                  primaryYAxis: CategoryAxis(
                                    labelStyle: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    majorTickLines:
                                        const MajorTickLines(width: 0),
                                    maximum: state.smokingHistories
                                            .map((e) => e.amount)
                                            .reduce(max) *
                                        1.2,
                                  ),
                                  plotAreaBorderColor: Colors.transparent,
                                  plotAreaBorderWidth: 0,
                                  series: [
                                    LineSeries<SmokingHistory, String>(
                                      animationDuration: 100,
                                      animationDelay: 100,
                                      dataSource: state.smokingHistories,
                                      xValueMapper: (
                                        SmokingHistory history,
                                        _,
                                      ) =>
                                          yyyyMMddFormat.format(history.date),
                                      yValueMapper:
                                          (SmokingHistory history, _) =>
                                              history.amount,
                                      width: 4,
                                      color: const Color(0xFF3824b4),
                                      markerSettings: const MarkerSettings(
                                        borderColor: Color(0xFFea2669),
                                        color: Color(0xFFea2669),
                                        isVisible: true,
                                        shape: DataMarkerType.circle,
                                        borderWidth: 3,
                                      ),
                                      dataLabelSettings:
                                          const DataLabelSettings(),
                                    ),
                                  ],
                                ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child:
                      BlocBuilder<SmokingHistoriesCubit, SmokingHistoriesState>(
                    bloc: smokingHistoriesCubit,
                    builder: (context, state) {
                      final now = DateTime.now();

                      final lastMonthHistories = state.smokingHistories.where(
                        (element) =>
                            element.date.isAfter(
                              DateTime(
                                now.year,
                                now.month - 1,
                                now.day,
                              ),
                            ) &&
                            element.date.isBefore(now),
                      );

                      final lastMonthFold = lastMonthHistories.fold<int>(
                        0,
                        (previousValue, element) =>
                            previousValue + element.amount,
                      );

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.5,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '최근 한달 흡연량',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${lastMonthFold.toDouble()}',
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.5,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '일 평균 흡연량 (최근 한달)',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${((lastMonthFold / 30) * 10).roundToDouble() / 10}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: AppColors.blueGrayDark,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
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
            PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() => pageIndex = value);
              },
              itemCount: (dataCount / 7).ceil(),
              itemBuilder: (context, index) => const Center(),
            ),
          ],
        ),
      ),
    );
  }
}
