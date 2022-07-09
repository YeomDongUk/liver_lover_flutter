part of 'today_medication_schedules_cubit.dart';

abstract class TodayMedicationSchedulesState extends Equatable {
  const TodayMedicationSchedulesState({this.medicationSchedules = const []});
  final List<MedicationSchedule> medicationSchedules;

  @override
  List<Object> get props => [
        medicationSchedules,
      ];
}

class TodayMedicationSchedulesInitial extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesInitial();
}

class TodayMedicationSchedulesLoadInProgress
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadInProgress({super.medicationSchedules});
}

class TodayMedicationSchedulesLoadSuccess
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadSuccess({super.medicationSchedules});
}

class TodayMedicationSchedulesLoadFailure
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesLoadFailure();
}

class TodayMedicationSchedulesScheduleAdded
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleAdded({super.medicationSchedules});
}

class TodayMedicationSchedulesScheduleUpdated
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleUpdated({super.medicationSchedules});
}

class TodayMedicationSchedulesScheduleDeleted
    extends TodayMedicationSchedulesState {
  const TodayMedicationSchedulesScheduleDeleted({super.medicationSchedules});
}
