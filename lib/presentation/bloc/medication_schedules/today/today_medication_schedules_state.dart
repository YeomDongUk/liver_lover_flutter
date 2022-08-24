part of 'today_medication_schedules_cubit.dart';

abstract class TodayMedicationSchedulesState extends Equatable {
  const TodayMedicationSchedulesState({
    this.medicationSchedulesGroups = const [],
  });
  final List<MedicationSchedulesGroup> medicationSchedulesGroups;

  @override
  List<Object> get props => [
        medicationSchedulesGroups,
      ];
}

class TodayMedicationSchedulesInitial extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesInitial();
}

class TodayMedicationSchedulesLoadInProgress
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadInProgress(
      {super.medicationSchedulesGroups});
}

class TodayMedicationSchedulesLoadSuccess
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadSuccess({super.medicationSchedulesGroups});
}

class TodayMedicationSchedulesLoadFailure
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadFailure();
}

class TodayMedicationSchedulesScheduleAdded
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleAdded(
      {super.medicationSchedulesGroups});
}

class TodayMedicationSchedulesScheduleUpdated
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleUpdated(
      {super.medicationSchedulesGroups});
}

class TodayMedicationSchedulesScheduleDeleted
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleDeleted(
      {super.medicationSchedulesGroups});
}
