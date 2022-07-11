import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedules.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'medication_schedules_state.dart';

class MedicationSchedulesCubit extends Cubit<MedicationSchedulesState>
    implements IonUserState {
  MedicationSchedulesCubit() : super(const MedicationSchedulesInitial());
  // final GetMedicationSchedules getMedicationSchedules;

  Future<void> loadSchedules() async {
    // final result = await getMedicationSchedules.call(null);

    // emit(
    //   result.fold(
    //     (l) => const MedicationSchedulesLoadFailure(),
    //     (r) => MedicationSchedulesLoadSuccess(medicationSchedules: r),
    //   ),
    // );
  }

  @override
  void onLogout() => emit(const MedicationSchedulesInitial());
}
