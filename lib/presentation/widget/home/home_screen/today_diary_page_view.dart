import 'package:flutter/material.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/home/home_screen/value_column.dart';

class TodayDiaryPageView extends StatelessWidget {
  const TodayDiaryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeLabel(
            grayText: '오늘의 ',
            primaryText: '활동일기',
          ),
          SizedBox(
            height: 143,
            child: Center(
              child: HomeContainer(
                height: 123,
                child: Row(
                  children: [
                    const Expanded(
                      child: ValueColumn(
                        label: '흡연량',
                        value: 0,
                        unitText: '개비',
                      ),
                    ),
                    const VerticalDivider(),
                    const Expanded(
                      child: ValueColumn(
                        label: '알코올량',
                        value: 0,
                        unitText: 'g',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
