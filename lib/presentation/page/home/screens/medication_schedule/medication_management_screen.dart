// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/presentation/page/medication_management/medication_schedule_group/medication_schedule_groups_tab_view.dart';
import 'package:yak/presentation/page/medication_management/prescription/prescriptions_screen_tab_view.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.read<PageController>().jumpToPage(5),
          icon: const Icon(Icons.home),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              labelColor: Colors.blue,
              tabs: const [
                Tab(
                  text: '복약일정',
                ),
                Tab(
                  text: '처방전',
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
