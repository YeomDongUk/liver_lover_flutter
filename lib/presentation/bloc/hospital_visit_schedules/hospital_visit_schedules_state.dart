part of 'hospital_visit_schedules_cubit.dart';

abstract class HospitalVisitSchedulesState extends Equatable {
  const HospitalVisitSchedulesState({this.hospitalVisitSchedules = const []});
  final List<HospitalVisitSchedule> hospitalVisitSchedules;

  @override
  List<Object> get props => [hospitalVisitSchedules];
}

class HospitalVisitSchedulesInitial extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesInitial();
}

class HospitalVisitSchedulesLoadInProgress extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesLoadInProgress({super.hospitalVisitSchedules});
}

class HospitalVisitSchedulesLoadSuccess extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesLoadSuccess({super.hospitalVisitSchedules});
}

class HospitalVisitSchedulesLoadFailure extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesLoadFailure();
}

class HospitalVisitSchedulesScheduleAdded extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesScheduleAdded({super.hospitalVisitSchedules});
}

class HospitalVisitSchedulesScheduleUpdated
    extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesScheduleUpdated({super.hospitalVisitSchedules});
}

class HospitalVisitSchedulesScheduleDeleted
    extends HospitalVisitSchedulesState {
  const HospitalVisitSchedulesScheduleDeleted({super.hospitalVisitSchedules});
}
