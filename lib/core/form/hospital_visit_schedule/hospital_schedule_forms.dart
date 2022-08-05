// Package imports:
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';

enum HospitalVisitTypeValidationError { empty }

class HospitalVisitType extends FormzInput<HospitalVisitScheduleType?,
    HospitalVisitTypeValidationError> {
  const HospitalVisitType.pure() : super.pure(null);
  const HospitalVisitType.dirty(super.value) : super.dirty();

  @override
  HospitalVisitTypeValidationError? validator(
    HospitalVisitScheduleType? value,
  ) =>
      value == null ? HospitalVisitTypeValidationError.empty : null;
}

enum HospitalNameValidationError {
  empty,
}

class HospitalName extends FormzInput<String, HospitalNameValidationError> {
  const HospitalName.pure() : super.pure('');
  const HospitalName.dirty(super.value) : super.dirty();

  @override
  HospitalNameValidationError? validator(String value) =>
      value.trim().isEmpty ? HospitalNameValidationError.empty : null;
}

enum DoctorOfficeValidationError {
  empty,
}

class DoctorOffice extends FormzInput<String, DoctorOfficeValidationError> {
  const DoctorOffice.pure() : super.pure('');
  const DoctorOffice.dirty(super.value) : super.dirty();

  @override
  DoctorOfficeValidationError? validator(String value) =>
      value.trim().isEmpty ? DoctorOfficeValidationError.empty : null;
}

enum MedicalSubjectValidationError {
  empty,
}

class MedicalSubject extends FormzInput<String, MedicalSubjectValidationError> {
  const MedicalSubject.pure() : super.pure('');
  const MedicalSubject.dirty(super.value) : super.dirty();

  @override
  MedicalSubjectValidationError? validator(String value) =>
      value.trim().isEmpty ? MedicalSubjectValidationError.empty : null;
}

enum DoctorNameValidationError {
  empty,
}

class DoctorName extends FormzInput<String, DoctorNameValidationError> {
  const DoctorName.pure() : super.pure('');
  const DoctorName.dirty(super.value) : super.dirty();

  @override
  DoctorNameValidationError? validator(String value) =>
      value.trim().isEmpty ? DoctorNameValidationError.empty : null;
}

enum VisitedAtValidationError {
  empty,
  wrong,
}

class VisitedAt extends FormzInput<String, VisitedAtValidationError> {
  const VisitedAt.pure() : super.pure('');
  const VisitedAt.dirty(super.value) : super.dirty();

  @override
  VisitedAtValidationError? validator(String value) => value.isEmpty
      ? VisitedAtValidationError.empty
      : int.tryParse(value) == null
          ? VisitedAtValidationError.wrong
          : null;
}
