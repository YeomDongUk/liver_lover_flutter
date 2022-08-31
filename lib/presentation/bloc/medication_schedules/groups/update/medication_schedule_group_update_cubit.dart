// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';

part 'medication_schedule_group_update_state.dart';

class MedicationScheduleGroupUpdateCubit
    extends Cubit<MedicationScheduleGroupUpdateState> {
  MedicationScheduleGroupUpdateCubit({
    required this.doMedication,
    required this.doAllMedication,
    required this.updateMedicationScheduleGroupPush,
    required MedicationSchedulesGroup medicationSchedulesGroup,
  }) : super(
          MedicationScheduleGroupUpdateState(
            medicationSchedulesGroup: medicationSchedulesGroup,
          ),
        );

  final DoMedication doMedication;
  final DoAllMedication doAllMedication;
  final UpdateMedicationScheduleGroupPush updateMedicationScheduleGroupPush;

  Future<void> medicateAll() async {
    final medicationInformations = List<MedicationInformation>.from(
      state.medicationSchedulesGroup.medicationInformations,
    );

    await doAllMedication.call(
      medicationInformations.first.medicationSchedules.first.reservedAt,
    );

    emit(
      state.copyWith(
        status: MedicationScheduleGroupUpdateStatus.submitSuccess,
        medicationSchedulesGroup: state.medicationSchedulesGroup.copyWith(
          medicationInformations: medicationInformations
              .map(
                (medicationInformation) => medicationInformation.copyWith(
                  medicationSchedules: List<MedicationSchedule>.from(
                    medicationInformation.medicationSchedules,
                  )
                      .map(
                        (medicationSchedule) => medicationSchedule.copyWith(
                          medicatedAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<void> medicate({
    required MedicationInformation medicationInformation,
    required MedicationSchedule medicationSchedule,
  }) async {
    final medicationInformations = List<MedicationInformation>.from(
      state.medicationSchedulesGroup.medicationInformations,
    );

    final index = medicationInformations.indexOf(medicationInformation);

    if (index == -1) return;

    await doMedication.call(medicationSchedule.id);

    medicationInformations[index] = medicationInformations[index].copyWith(
      medicationSchedules: [
        medicationSchedule.copyWith(
          medicatedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )
      ],
    );

    emit(
      state.copyWith(
        medicationSchedulesGroup: state.medicationSchedulesGroup.copyWith(
          medicationInformations: medicationInformations,
        ),
      ),
    );
  }

  Future<void> togglePush() async {
    await updateMedicationScheduleGroupPush.call(
      UpdateMedicationScheduleGroupPushParam(
        ids: state.medicationSchedulesGroup.medicationInformations
            .map((e) => e.medicationSchedules.map((e) => e.id))
            .expand((element) => element)
            .toList(),
        push: !state.medicationSchedulesGroup.push,
      ),
    );

    emit(
      state.copyWith(
        medicationSchedulesGroup: state.medicationSchedulesGroup.copyWith(
          push: !state.medicationSchedulesGroup.push,
        ),
      ),
    );
  }
}
