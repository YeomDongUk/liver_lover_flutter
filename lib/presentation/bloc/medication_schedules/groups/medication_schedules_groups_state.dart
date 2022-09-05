part of 'medication_schedules_groups_cubit.dart';

enum MedicationScheduleGroupsStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class MedicationScheduleGroupsState extends Equatable {
  const MedicationScheduleGroupsState({
    this.status = MedicationScheduleGroupsStatus.initial,
    this.medicationScheduleGroups = const [],
  });

  final MedicationScheduleGroupsStatus status;
  final List<MedicationScheduleGroup> medicationScheduleGroups;

  @override
  List<Object> get props => [
        status,
        medicationScheduleGroups,
      ];
}
