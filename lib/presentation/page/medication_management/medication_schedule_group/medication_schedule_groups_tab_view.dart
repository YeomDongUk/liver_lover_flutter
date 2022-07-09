import 'package:flutter/material.dart';

class MedicationScheduleGroupsTabView extends StatefulWidget {
  const MedicationScheduleGroupsTabView({super.key});

  @override
  State<MedicationScheduleGroupsTabView> createState() =>
      _MedicationScheduleGroupsTabViewState();
}

class _MedicationScheduleGroupsTabViewState
    extends State<MedicationScheduleGroupsTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
    //  Scaffold(
    //   appBar: AppBar(),
    //   body: SafeArea(
    //     child: BlocBuilder<MedicationScheduleGroupsCubit,
    //         MedicationScheduleGroupsState>(
    //       builder: (context, state) => state.groups.isEmpty
    //           ? Center(
    //               child: ElevatedButton(
    //                 onPressed: () => context.beamToNamed('create'),
    //                 child: const Text('일정 등록하기'),
    //               ),
    //             )
    //           : ListView.separated(
    //               itemCount: state.groups.length,
    //               itemBuilder: (context, index) =>
    //                   MedicationScheduleGroupListTile(
    //                 medicationScheduleGroup: state.groups[index],
    //               ),
    //               separatorBuilder: (context, index) => const Divider(),
    //             ),
    //     ),
    //   ),
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
