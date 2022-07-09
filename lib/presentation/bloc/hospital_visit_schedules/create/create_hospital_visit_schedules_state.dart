part of 'create_hospital_visit_schedules_cubit.dart';

class CreateHospitalVisitSchedulesState extends Equatable {
  const CreateHospitalVisitSchedulesState({
    this.status = FormzStatus.pure,
    this.hospitalName = const HospitalName.pure(),
    this.medicalSubject = const MedicalSubject.pure(),
    this.doctorName = const DoctorName.pure(),
    this.reservedAt = const ReservedAt.pure(),
    this.push = const Push.pure(),
    this.beforePush = const BeforePush.pure(),
    this.afterPush = const AfterPush.pure(),
  });

  final FormzStatus status;
  final HospitalName hospitalName;
  final MedicalSubject medicalSubject;
  final DoctorName doctorName;
  final ReservedAt reservedAt;
  final Push push;
  final BeforePush beforePush;
  final AfterPush afterPush;

  CreateHospitalVisitSchedulesState copyWith({
    FormzStatus? status,
    HospitalName? hospitalName,
    MedicalSubject? medicalSubject,
    DoctorName? doctorName,
    ReservedAt? reservedAt,
    Push? push,
    BeforePush? beforePush,
    AfterPush? afterPush,
  }) =>
      CreateHospitalVisitSchedulesState(
        status: status ?? this.status,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        reservedAt: reservedAt ?? this.reservedAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );

  @override
  List<Object> get props => [
        status,
        hospitalName,
        medicalSubject,
        doctorName,
        reservedAt,
        push,
        beforePush,
        afterPush,
      ];
}
