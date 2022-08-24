part of 'medication_schedule_group_update_cubit.dart';

enum MedicationScheduleGroupUpdateStatus {
  valid,
  submitProgress,
  submitSuccess,
  submitFailure,
}

class MedicationScheduleGroupUpdateState extends Equatable {
  const MedicationScheduleGroupUpdateState({
    this.status = MedicationScheduleGroupUpdateStatus.valid,
    required this.medicationSchedulesGroup,
  });

  final MedicationScheduleGroupUpdateStatus status;
  final MedicationSchedulesGroup medicationSchedulesGroup;

  MedicationScheduleGroupUpdateState copyWith({
    MedicationScheduleGroupUpdateStatus? status,
    MedicationSchedulesGroup? medicationSchedulesGroup,
  }) =>
      MedicationScheduleGroupUpdateState(
        status: status ?? this.status,
        medicationSchedulesGroup:
            medicationSchedulesGroup ?? this.medicationSchedulesGroup,
      );

  @override
  List<Object> get props => [
        status,
        medicationSchedulesGroup,
      ];
}
