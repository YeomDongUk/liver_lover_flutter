part of 'hospital_visit_schedule_update_cubit.dart';

class HospitalVisitScheduleUpdateState extends Equatable {
  const HospitalVisitScheduleUpdateState({
    this.status = FormzStatus.pure,
    this.hospitalVisitType = const HospitalVisitType.pure(),
    this.hospitalName = const HospitalName.pure(),
    this.medicalSubject = const MedicalSubject.dirty(''),
    this.doctorName = const DoctorName.dirty(''),
    this.reservedAt = const AfterNowDateInput.pure(),
    this.beforePush = const BeforePush.pure(),
    this.afterPush = const AfterPush.pure(),
  });

  factory HospitalVisitScheduleUpdateState.fromSchedule({
    required HospitalVisitSchedule schedule,
  }) =>
      HospitalVisitScheduleUpdateState(
        hospitalVisitType: HospitalVisitType.dirty(schedule.type),
        hospitalName: HospitalName.dirty(schedule.hospitalName),
        medicalSubject: MedicalSubject.dirty(schedule.medicalSubject),
        doctorName: DoctorName.dirty(schedule.doctorName),
        reservedAt: AfterNowDateInput.dirty(schedule.reservedAt),
        beforePush: BeforePush.dirty(schedule.beforePush),
        afterPush: AfterPush.dirty(schedule.afterPush),
      );

  final FormzStatus status;
  final HospitalVisitType hospitalVisitType;
  final HospitalName hospitalName;
  final MedicalSubject medicalSubject;
  final DoctorName doctorName;
  final AfterNowDateInput reservedAt;
  final BeforePush beforePush;
  final AfterPush afterPush;

  HospitalVisitScheduleUpdateState copyWith({
    FormzStatus? status,
    HospitalVisitType? hospitalVisitType,
    HospitalName? hospitalName,
    MedicalSubject? medicalSubject,
    DoctorName? doctorName,
    AfterNowDateInput? reservedAt,
    BeforePush? beforePush,
    AfterPush? afterPush,
  }) =>
      HospitalVisitScheduleUpdateState(
        status: status ?? this.status,
        hospitalVisitType: hospitalVisitType ?? this.hospitalVisitType,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        reservedAt: reservedAt ?? this.reservedAt,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );

  @override
  List<Object> get props => [
        status,
        hospitalVisitType,
        hospitalName,
        medicalSubject,
        doctorName,
        reservedAt,
        beforePush,
        afterPush,
      ];
}
