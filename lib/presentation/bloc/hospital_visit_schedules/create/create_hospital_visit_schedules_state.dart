part of 'create_hospital_visit_schedules_cubit.dart';

class CreateHospitalVisitSchedulesState extends Equatable {
  const CreateHospitalVisitSchedulesState({
    this.status = FormzStatus.pure,
    this.hospitalVisitType = const HospitalVisitType.pure(),
    this.hospitalName = const HospitalName.pure(),
    this.medicalSubject = const MedicalSubject.dirty(''),
    this.doctorName = const DoctorName.dirty(''),
    this.reservedAt = const AfterNowDateInput.pure(),
    this.beforePush = const BeforePush.pure(),
    this.afterPush = const AfterPush.pure(),
  });

  final FormzStatus status;
  final HospitalVisitType hospitalVisitType;
  final HospitalName hospitalName;
  final MedicalSubject medicalSubject;
  final DoctorName doctorName;
  final AfterNowDateInput reservedAt;
  final BeforePush beforePush;
  final AfterPush afterPush;

  CreateHospitalVisitSchedulesState copyWith({
    FormzStatus? status,
    HospitalVisitType? hospitalVisitType,
    HospitalName? hospitalName,
    MedicalSubject? medicalSubject,
    DoctorName? doctorName,
    AfterNowDateInput? reservedAt,
    BeforePush? beforePush,
    AfterPush? afterPush,
  }) =>
      CreateHospitalVisitSchedulesState(
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
