// Package imports:
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_group_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';

part 'medication_schedule_group_update_state.dart';

class MedicationScheduleGroupUpdateCubit
    extends Cubit<MedicationScheduleGroupUpdateState> {
  MedicationScheduleGroupUpdateCubit({
    required this.reservedAt,
    required this.doMedication,
    required this.doAllMedication,
    required this.updateMedicationScheduleGroupPush,
    required this.getMedicationScheduleGroupStream,
  }) : super(const MedicationScheduleGroupUpdateState());
  final DateTime reservedAt;
  final DoMedication doMedication;
  final DoAllMedication doAllMedication;
  final UpdateMedicationScheduleGroupPush updateMedicationScheduleGroupPush;
  final GetMedicationScheduleGroupStream getMedicationScheduleGroupStream;

  StreamSubscription<MedicationScheduleGroup>? _subscription;
  Future<void> loadScheduleGroup() async {
    emit(
      state.copyWith(
        status: MedicationScheduleGroupUpdateStatus.loadInProgress,
      ),
    );
    final either = await getMedicationScheduleGroupStream.call(reservedAt);

    either.fold(
      (l) => emit(
        state.copyWith(status: MedicationScheduleGroupUpdateStatus.loadFailure),
      ),
      (r) {
        _subscription?.cancel();

        _subscription = r.listen(
          (event) => emit(
            state.copyWith(
              status: MedicationScheduleGroupUpdateStatus.loadSuccess,
              medicationScheduleGroup: event,
            ),
          ),
        );
      },
    );
  }

  Future<void> medicateAll() async {
    emit(
      state.copyWith(
        status: MedicationScheduleGroupUpdateStatus.submitInProgress,
      ),
    );

    final either = await doAllMedication.call(reservedAt);

    either.fold(
      (l) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitFailure,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitSuccess,
        ),
      ),
    );
  }

  Future<void> medicate(String medicationScheduleId) async {
    emit(
      state.copyWith(
        status: MedicationScheduleGroupUpdateStatus.submitInProgress,
      ),
    );

    final either = await doMedication.call(medicationScheduleId);

    either.fold(
      (l) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitFailure,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitSuccess,
        ),
      ),
    );
  }

  Future<void> togglePush(bool push) async {
    emit(
      state.copyWith(
        status: MedicationScheduleGroupUpdateStatus.submitInProgress,
      ),
    );

    final either = await updateMedicationScheduleGroupPush.call(
      UpdateMedicationScheduleGroupPushParam(
        reservedAt: reservedAt,
        push: push,
      ),
    );

    either.fold(
      (l) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitFailure,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: MedicationScheduleGroupUpdateStatus.submitSuccess,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
