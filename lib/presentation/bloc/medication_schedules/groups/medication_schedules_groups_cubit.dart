// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';

part 'medication_schedules_groups_state.dart';

class MedicationScheduleGroupsCubit
    extends Cubit<MedicationScheduleGroupsState> {
  MedicationScheduleGroupsCubit({
    required this.getMedicationScheduleGroupsStream,
    required this.updateMedicationScheduleGroupPush,
  }) : super(const MedicationScheduleGroupsState());

  final GetMedicationScheduleGroupsStream getMedicationScheduleGroupsStream;
  final UpdateMedicationScheduleGroupPush updateMedicationScheduleGroupPush;
  StreamSubscription<List<MedicationScheduleGroup>>? _subscription;
  Future<void> load(DateTime date) async {
    emit(
      const MedicationScheduleGroupsState(
        status: MedicationScheduleGroupsStatus.loadInProgress,
      ),
    );

    final either = await getMedicationScheduleGroupsStream.call(date);

    return either.fold(
      (l) => emit(
        const MedicationScheduleGroupsState(
          status: MedicationScheduleGroupsStatus.loadFailure,
        ),
      ),
      (r) {
        _subscription?.cancel();
        _subscription = r.listen(
          (event) async => isClosed
              ? null
              : emit(
                  MedicationScheduleGroupsState(
                    status: MedicationScheduleGroupsStatus.loadSuccess,
                    medicationScheduleGroups: event
                      ..sort(
                        (prev, curr) =>
                            prev.reservedAt.compareTo(curr.reservedAt),
                      ),
                  ),
                ),
        );
      },
    );
  }

  Future<void> togglePush({
    required bool push,
    required DateTime reservedAt,
  }) async {
    final medicationScheduleGroups = List<MedicationScheduleGroup>.from(
      state.medicationScheduleGroups,
    );

    final index = medicationScheduleGroups.indexWhere(
      (element) => element.reservedAt == reservedAt,
    );

    if (index == -1) return;

    await updateMedicationScheduleGroupPush.call(
      UpdateMedicationScheduleGroupPushParam(
        reservedAt: reservedAt,
        beforePush: push,
        afterPush: push,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
