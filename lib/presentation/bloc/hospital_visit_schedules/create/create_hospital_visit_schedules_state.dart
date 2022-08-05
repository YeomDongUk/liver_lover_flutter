part of 'create_hospital_visit_schedules_cubit.dart';

class CreateHospitalVisitSchedulesState extends Equatable {
  const CreateHospitalVisitSchedulesState({
    this.status = FormzStatus.pure,
    this.hospitalVisitType = const HospitalVisitType.pure(),
    this.hospitalName = const HospitalName.pure(),
    this.medicalSubject = const MedicalSubject.pure(),
    this.doctorName = const DoctorName.pure(),
    this.doctorOffice = const DoctorOffice.pure(),
    this.reservedAt = const ReservedAt.pure(),
    this.push = const Push.pure(),
    this.beforePush = const BeforePush.pure(),
    this.afterPush = const AfterPush.pure(),
  });

  final FormzStatus status;
  final HospitalVisitType hospitalVisitType;
  final HospitalName hospitalName;
  final DoctorOffice doctorOffice;
  final MedicalSubject medicalSubject;
  final DoctorName doctorName;
  final ReservedAt reservedAt;
  final Push push;
  final BeforePush beforePush;
  final AfterPush afterPush;

  CreateHospitalVisitSchedulesState copyWith({
    FormzStatus? status,
    HospitalVisitType? hospitalVisitType,
    HospitalName? hospitalName,
    MedicalSubject? medicalSubject,
    DoctorName? doctorName,
    DoctorOffice? doctorOffice,
    ReservedAt? reservedAt,
    Push? push,
    BeforePush? beforePush,
    AfterPush? afterPush,
  }) =>
      CreateHospitalVisitSchedulesState(
        status: status ?? this.status,
        hospitalVisitType: hospitalVisitType ?? this.hospitalVisitType,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        doctorOffice: doctorOffice ?? this.doctorOffice,
        reservedAt: reservedAt ?? this.reservedAt,
        push: push ?? this.push,
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
        doctorOffice,
        reservedAt,
        push,
        beforePush,
        afterPush,
      ];
}
