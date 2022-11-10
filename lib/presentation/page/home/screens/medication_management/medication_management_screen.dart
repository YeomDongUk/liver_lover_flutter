// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/presentation/page/medication_schedule/medication_schedule_group/medication_schedule_groups_tab_view.dart';
import 'package:yak/presentation/page/medication_schedule/prescription/prescriptions_screen_tab_view.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';

class MedicationManagementScreen extends StatefulWidget {
  const MedicationManagementScreen({super.key});

  @override
  State<MedicationManagementScreen> createState() =>
      _MedicationManagementScreenState();
}

class _MedicationManagementScreenState extends State<MedicationManagementScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
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
        title: const Text('복약관리'),
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
                  tabs: ['복약일정', '처방전']
                      .map(
                        (e) => Tab(text: e),
                      )
                      .toList(),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  MedicationScheduleGroupsTabView(),
                  PrescriptionsTabView(),
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
