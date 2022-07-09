part of 'medication_schedules_cubit.dart';

abstract class MedicationSchedulesState extends Equatable {
  const MedicationSchedulesState({this.medicationSchedules = const []});
  final List<MedicationSchedule> medicationSchedules;
  @override
  List<Object> get props => [medicationSchedules];
}

class MedicationSchedulesInitial extends MedicationSchedulesState {
  const MedicationSchedulesInitial();
}

class MedicationSchedulesLoadInProgress extends MedicationSchedulesState {
  const MedicationSchedulesLoadInProgress({super.medicationSchedules});
}

class MedicationSchedulesLoadSuccess extends MedicationSchedulesState {
  const MedicationSchedulesLoadSuccess({super.medicationSchedules});
}

class MedicationSchedulesLoadFailure extends MedicationSchedulesState {
  const MedicationSchedulesLoadFailure();
}

class MedicationSchedulesScheduleAdded extends MedicationSchedulesState {
  const MedicationSchedulesScheduleAdded({super.medicationSchedules});
}

class MedicationSchedulesScheduleUpdated extends MedicationSchedulesState {
  const MedicationSchedulesScheduleUpdated({super.medicationSchedules});
}

class MedicationSchedulesScheduleDeleted extends MedicationSchedulesState {
  const MedicationSchedulesScheduleDeleted({super.medicationSchedules});
}
