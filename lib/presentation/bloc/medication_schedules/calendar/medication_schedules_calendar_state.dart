part of 'medication_schedules_calendar_cubit.dart';

enum MedicationSchedulesCalendarStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class MedicationSchedulesCalendarState extends Equatable {
  const MedicationSchedulesCalendarState({
    this.medicationSchedulesCalendarStatus =
        MedicationSchedulesCalendarStatus.initial,
    this.medicationScheduleDailyGroups = const [],
    this.medicationScheduleDailyGroup,
  });

  final MedicationSchedulesCalendarStatus medicationSchedulesCalendarStatus;
  final List<MedicationScheduleDailyGroup> medicationScheduleDailyGroups;
  final MedicationScheduleDailyGroup? medicationScheduleDailyGroup;

  MedicationSchedulesCalendarState copyWith({
    MedicationSchedulesCalendarStatus? medicationSchedulesCalendarStatus,
    List<MedicationScheduleDailyGroup>? medicationScheduleDailyGroups,
    Optional<MedicationScheduleDailyGroup> medicationScheduleDailyGroup =
        const Optional<MedicationScheduleDailyGroup>(),
  }) =>
      MedicationSchedulesCalendarState(
        medicationSchedulesCalendarStatus: medicationSchedulesCalendarStatus ??
            this.medicationSchedulesCalendarStatus,
        medicationScheduleDailyGroups:
            medicationScheduleDailyGroups ?? this.medicationScheduleDailyGroups,
        medicationScheduleDailyGroup: medicationScheduleDailyGroup.isValid
            ? medicationScheduleDailyGroup.value
            : this.medicationScheduleDailyGroup,
      );

  @override
  List<Object?> get props => [
        medicationSchedulesCalendarStatus,
        medicationScheduleDailyGroups,
        medicationScheduleDailyGroup,
      ];
}
