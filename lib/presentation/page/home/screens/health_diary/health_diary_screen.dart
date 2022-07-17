import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/presentation/page/home/screens/drinking_history/drinking_history_screen.dart';
import 'package:yak/presentation/page/home/screens/health_diary/health_questions_screen.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';

class HealthDiaryScreen extends StatefulWidget {
  const HealthDiaryScreen({super.key});

  @override
  State<HealthDiaryScreen> createState() => _HealthDiaryScreenState();
}

class _HealthDiaryScreenState extends State<HealthDiaryScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final List<String> tabNames;
  @override
  void initState() {
    tabNames = [
      '음주',
      '흡연',
      '운동',
      '질문',
      '설문',
    ];
    tabController = TabController(
      length: tabNames.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('건강정보'),
        leading: IconButton(
          onPressed: () => context.read<PageController>().jumpToPage(5),
          icon: SvgPicture.asset('assets/svg/home.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed(Routes.my),
            icon: SvgPicture.asset('assets/svg/my_info.svg'),
          ),
        ],
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
                  tabs: tabNames
                      .map(
                        (e) => Tab(
                          text: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  const DrinkingHistoryScreen(),
                  Container(),
                  Container(),
                  const HealthQuestionsScreen(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
