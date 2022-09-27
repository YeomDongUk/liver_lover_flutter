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

class MedicalSubject extends FormzInput<String, void> {
  const MedicalSubject.pure() : super.pure('');
  const MedicalSubject.dirty(super.value) : super.dirty();

  @override
  void validator(String value) => null;
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
