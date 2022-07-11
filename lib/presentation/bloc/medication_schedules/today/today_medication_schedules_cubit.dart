import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/usecases/medication_schedule/get_today_medication_schedules.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'today_medication_schedules_state.dart';

class TodayMedicationSchedulesCubit extends Cubit<TodayMedicationSchedulesState>
    implements IonUserState {
  TodayMedicationSchedulesCubit(this.getTodayMedicationSchedules)
      : super(const TodayMedicationSchedulesInitial());
  final GetTodayMedicationSchedules getTodayMedicationSchedules;

  Future<void> loadSchedules() async {
    final result = await getTodayMedicationSchedules.call(null);

    emit(
      result.fold(
        (l) => const TodayMedicationSchedulesLoadFailure(),
        (r) => TodayMedicationSchedulesLoadSuccess(medicationSchedules: r),
      ),
    );
  }

  @override
  void onLogout() => emit(const TodayMedicationSchedulesInitial());
}
