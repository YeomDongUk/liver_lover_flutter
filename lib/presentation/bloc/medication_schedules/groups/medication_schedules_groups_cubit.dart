// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedules_groups.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';

part 'medication_schedules_groups_state.dart';

class MedicationSchedulesGroupsCubit
    extends Cubit<MedicationSchedulesGroupsState> {
  MedicationSchedulesGroupsCubit({
    required this.date,
    required this.getMedicationSchedulesGroups,
    required this.updateMedicationScheduleGroupPush,
  }) : super(const MedicationSchedulesGroupsState());

  final DateTime date;
  final GetMedicationSchedulesGroups getMedicationSchedulesGroups;
  final UpdateMedicationScheduleGroupPush updateMedicationScheduleGroupPush;

  Future<void> load() async {
    final either = await getMedicationSchedulesGroups.call(date);
    return either.fold(
      (l) => emit(
        const MedicationSchedulesGroupsState(
          status: MedicationSchedulesGroupsStatus.loadFailure,
        ),
      ),
      (r) => r.listen(
        (event) async => isClosed
            ? null
            : emit(
                MedicationSchedulesGroupsState(
                  status: MedicationSchedulesGroupsStatus.loadSuccess,
                  medicationSchedulesGroups: await event,
                ),
              ),
      ),
    );
  }

  Future<void> togglePush({
    required MedicationSchedulesGroup group,
  }) async {
    final medicationSchedulesGroups = List<MedicationSchedulesGroup>.from(
      state.medicationSchedulesGroups,
    );

    final index = medicationSchedulesGroups.indexOf(group);
    if (index == -1) return;

    await updateMedicationScheduleGroupPush.call(
      UpdateMedicationScheduleGroupPushParam(
        ids: state.medicationSchedulesGroups[index].medicationInformations
            .map((e) => e.medicationSchedules.map((e) => e.id))
            .expand((element) => element)
            .toList(),
        push: !state.medicationSchedulesGroups[index].push,
      ),
    );
  }
}
