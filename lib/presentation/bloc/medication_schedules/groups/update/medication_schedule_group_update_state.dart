part of 'medication_schedule_group_update_cubit.dart';

enum MedicationScheduleGroupUpdateStatus {
  valid,
  loadInProgress,
  loadSuccess,
  loadFailure,
  submitInProgress,
  submitSuccess,
  submitFailure,
}

class MedicationScheduleGroupUpdateState extends Equatable {
  const MedicationScheduleGroupUpdateState({
    this.status = MedicationScheduleGroupUpdateStatus.valid,
    this.medicationScheduleGroup,
  });

  final MedicationScheduleGroupUpdateStatus status;
  final MedicationScheduleGroup? medicationScheduleGroup;

  MedicationScheduleGroupUpdateState copyWith({
    MedicationScheduleGroupUpdateStatus? status,
    MedicationScheduleGroup? medicationScheduleGroup,
  }) =>
      MedicationScheduleGroupUpdateState(
        status: status ?? this.status,
        medicationScheduleGroup:
            medicationScheduleGroup ?? this.medicationScheduleGroup,
      );

  @override
  List<Object?> get props => [
        status,
        medicationScheduleGroup,
      ];
}
