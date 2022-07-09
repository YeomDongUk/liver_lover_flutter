import 'package:formz/formz.dart';

enum HospitalNameValidationError {
  empty,
}

class HospitalName extends FormzInput<String, HospitalNameValidationError> {
  const HospitalName.pure() : super.pure('');
  const HospitalName.dirty(super.value) : super.dirty();

  @override
  HospitalNameValidationError? validator(String value) =>
      value.isEmpty ? HospitalNameValidationError.empty : null;
}

enum MedicalSubjectValidationError {
  empty,
}

class MedicalSubject extends FormzInput<String, MedicalSubjectValidationError> {
  const MedicalSubject.pure() : super.pure('');
  const MedicalSubject.dirty(super.value) : super.dirty();

  @override
  MedicalSubjectValidationError? validator(String value) =>
      value.isEmpty ? MedicalSubjectValidationError.empty : null;
}

enum DoctorNameValidationError {
  empty,
}

class DoctorName extends FormzInput<String, DoctorNameValidationError> {
  const DoctorName.pure() : super.pure('');
  const DoctorName.dirty(super.value) : super.dirty();

  @override
  DoctorNameValidationError? validator(String value) =>
      value.isEmpty ? DoctorNameValidationError.empty : null;
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
