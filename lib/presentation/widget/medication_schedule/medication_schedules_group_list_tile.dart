// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
// import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';

// class MedicationScheduleGroupListTile extends StatelessWidget {
//   const MedicationScheduleGroupListTile({
//     super.key,
//     required this.medicationScheduleGroup,
//   });
//   final MedicationScheduleGroup medicationScheduleGroup;
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CurrentTimeCubit, DateTime>(
//       listener: (context, state) {
//         // if(medicationScheduleGroup.reservedAt)
//       },
//       child: BlocBuilder<CurrentTimeCubit, DateTime>(
//         buildWhen: (prev, curr) =>
//             medicationScheduleGroup.reservedAt.difference(prev).inMinutes !=
//             medicationScheduleGroup.reservedAt.difference(curr).inMinutes,
//         builder: (context, state) => ListTile(
//           onTap: () => context.beamToNamed(
//             '${medicationScheduleGroup.reservedAt.millisecondsSinceEpoch}',
//           ),
//           title: Text(
//             '${medicationScheduleGroup.reservedAt.difference(state).inMinutes}',
//             // Duration(
//             //   milliseconds:
//             //       medicationScheduleGroup.reservedAt.millisecondsSinceEpoch -
//             //           state.millisecondsSinceEpoch,
//             // ).toString(),
//           ),
//           subtitle: Text(
//             '${medicationScheduleGroup.medicationSchedules.length}',
//           ),
//         ),
//       ),
//     );
//   }
// }
