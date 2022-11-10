// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_daily_group.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_daily_groups_stream.dart';

part 'medication_schedules_calendar_state.dart';

class MedicationSchedulesCalendarCubit
    extends Cubit<MedicationSchedulesCalendarState> {
  MedicationSchedulesCalendarCubit({
    required this.firstDateOfMonth,
    required this.getMedicationScheduleDailyGroupsStream,
  }) : super(const MedicationSchedulesCalendarState());
  final DateTime firstDateOfMonth;

  final GetMedicationScheduleDailyGroupsStream
      getMedicationScheduleDailyGroupsStream;
  StreamSubscription<List<MedicationScheduleDailyGroup>>? _subscription;

  Future<void> load() async {
    emit(
      state.copyWith(
        medicationSchedulesCalendarStatus:
            MedicationSchedulesCalendarStatus.loadInProgress,
      ),
    );

    final either =
        await getMedicationScheduleDailyGroupsStream.call(firstDateOfMonth);

    either.fold(
      (l) => emit(
        state.copyWith(
          medicationSchedulesCalendarStatus:
              MedicationSchedulesCalendarStatus.loadFailure,
        ),
      ),
      (r) {
        _subscription?.cancel();
        _subscription = r.listen(
          (event) => emit(
            state.copyWith(
              medicationSchedulesCalendarStatus:
                  MedicationSchedulesCalendarStatus.loadSuccess,
              medicationScheduleDailyGroups: event,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
