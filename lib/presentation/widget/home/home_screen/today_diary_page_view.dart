// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/home/home_screen/value_column.dart';

class TodayDiaryPageView extends StatelessWidget {
  const TodayDiaryPageView({
    super.key,
    required this.smokingHistory,
    required this.drinkingHistory,
  });
  final SmokingHistory? smokingHistory;
  final DrinkingHistory? drinkingHistory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeLabel(
            grayText: '오늘의 ',
            primaryText: '건강일기',
          ),
          SizedBox(
            height: 143,
            child: Center(
              child: HomeContainer(
                height: 123,
                child: BlocBuilder<CurrentTimeCubit, DateTime>(
                  builder: (context, now) => Row(
                    children: [
                      Expanded(
                        child: ValueColumn(
                          label: '흡연량',
                          unitText: '개비',
                          value: smokingHistory?.isValid != true
                              ? 0
                              : smokingHistory!.amount,
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: ValueColumn(
                          label: '알코올량',
                          unitText: 'g',
                          value: drinkingHistory?.isValid != true
                              ? 0
                              : drinkingHistory!.amount,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
