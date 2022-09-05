// // Dart imports:
// import 'dart:async';

// // Package imports:
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// // Project imports:
// import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
// import 'package:yak/domain/usecases/medication_schedule/get_medication_adherence_percent.dart';
// import 'package:yak/domain/usecases/medication_schedule/get_medication_schedules.dart';
// import 'package:yak/presentation/bloc/on_user_cubit.dart';

// part 'medication_schdules_state.dart';

// class MedicationSchedulesCubit extends Cubit<MedicationSchedulesState>
//     implements IonUserCubit {
//   MedicationSchedulesCubit({
//     required this.getMedicationAdherenecePercent,
//   }) : super(const MedicationSchedulesState());

//   final GetMedicationAdherenecePercent getMedicationAdherenecePercent;
//   // StreamSubscription<List<MedicationSchedule>>? medicationSchedulesStream;

//   Future<void> loadSchedules() async {
//     emit(state.copyWith(status: MedicationSchedulesStatus.loadInProgress));
//     // final either = await getMedicationSchedules.call(null);

//     // either.fold(
//     //   (l) =>
//     //       emit(state.copyWith(status: MedicationSchedulesStatus.loadFailure)),
//     //   (r) {
//     //     medicationSchedulesStream?.cancel();
//     //     medicationSchedulesStream = r.listen((medicationSchedules) {
//     //       emit(
//     //         state.copyWith(
//     //           status: MedicationSchedulesStatus.loadSuccess,
//     //           medicationSchedules: medicationSchedules,
//     //         ),
//     //       );
//     //     });
//     //   },
//     // );
//   }

//   @override
//   void onLogout() {
//     // medicationSchedulesStream?.cancel();
//     emit(
//       state.copyWith(
//         status: MedicationSchedulesStatus.initial,
//         medicationSchedules: [],
//       ),
//     );
//   }
// }
