import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_detail_container.dart';

class HospitalVisitSchedulesScreen extends StatefulWidget {
  const HospitalVisitSchedulesScreen({
    super.key,
  });

  @override
  State<HospitalVisitSchedulesScreen> createState() =>
      _HospitalVisitSchedulesScreenState();
}

class _HospitalVisitSchedulesScreenState
    extends State<HospitalVisitSchedulesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HospitalVisitSchedulesCubit,
            HospitalVisitSchedulesState>(
          builder: (context, state) => ScrollablePositionedList.separated(
            itemScrollController: context.read<ItemScrollController>(),
            itemCount: state.hospitalVisitSchedules.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) =>
                HospitalVisitScheduleDetailContainer(
              hospitalVisitSchedule: state.hospitalVisitSchedules[index],
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 10,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
