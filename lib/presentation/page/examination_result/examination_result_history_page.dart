// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/examination_result/blood_test_histories_screen.dart';
import 'package:yak/presentation/widget/examination_result/ultrasound_test_histories_screen.dart';

class ExaminationResultHistoryPage extends StatefulWidget {
  const ExaminationResultHistoryPage({super.key});

  @override
  State<ExaminationResultHistoryPage> createState() =>
      _ExaminationResultHistoryPageState();
}

class _ExaminationResultHistoryPageState
    extends State<ExaminationResultHistoryPage>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('검사 이력'),
        leading: const IconBackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
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
                TabBar(
                  controller: tabController,
                  tabs: ['혈액검사', '초음파'].map((e) => Tab(text: e)).toList(),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  BloodTestHistoriesScreen(),
                  UltrasoundTestHistoriesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
