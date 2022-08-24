// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedules_groups.dart';
import 'package:yak/presentation/bloc/on_user_cubit.dart';

part 'today_medication_schedules_state.dart';

class TodayMedicationSchedulesCubit extends Cubit<TodayMedicationSchedulesState>
    implements IonUserCubit {
  TodayMedicationSchedulesCubit({
    required this.getMedicationSchedulesGroups,
  }) : super(const TodayMedicationSchedulesInitial());

  final GetMedicationSchedulesGroups getMedicationSchedulesGroups;
  StreamSubscription<Future<List<MedicationSchedulesGroup>>>? _subscription;

  Future<void> loadSchedules() async {
    final either = await getMedicationSchedulesGroups.call(DateTime.now());

    await either.fold(
      (l) async => emit(const TodayMedicationSchedulesLoadFailure()),
      (r) {
        _subscription?.cancel();
        _subscription = r.listen((medicationSchedulesGroups) async {
          emit(
            TodayMedicationSchedulesLoadSuccess(
              medicationSchedulesGroups: await medicationSchedulesGroups,
            ),
          );
        });
      },
    );
  }

  @override
  void onLogout() {
    _subscription?.cancel();
    _subscription = null;
    emit(const TodayMedicationSchedulesInitial());
  }
}
