// Package imports:
import 'package:formz/formz.dart';

enum PrescriptedAtValidationError {
  empty,
  wrong,
}

class PrescriptedAt extends FormzInput<String, PrescriptedAtValidationError> {
  PrescriptedAt.pure() : super.pure('');

  @override
  PrescriptedAtValidationError? validator(String value) => value.isEmpty
      ? PrescriptedAtValidationError.empty
      : int.tryParse(value) == null
          ? PrescriptedAtValidationError.wrong
          : null;
}

enum DayDurationValidationError {
  empty,
}

class DayDuration extends FormzInput<int?, DayDurationValidationError> {
  const DayDuration.pure() : super.pure(null);
  const DayDuration.dirty(super.value) : super.dirty();

  @override
  DayDurationValidationError? validator(int? value) {
    if (value == null) return DayDurationValidationError.empty;
    return null;
  }
}

enum MedicatedAtValidationError {
  empty,
  wrong,
  befreDate,
}

class MedicatedAt extends FormzInput<String, MedicatedAtValidationError> {
  MedicatedAt.pure() : super.pure('');

  @override
  MedicatedAtValidationError? validator(String value) => value.isEmpty
      ? MedicatedAtValidationError.empty
      : int.tryParse(value) == null
          ? MedicatedAtValidationError.wrong
          : DateTime.fromMillisecondsSinceEpoch(
              int.parse(value),
            ).isBefore(DateTime.now())
              ? MedicatedAtValidationError.befreDate
              : null;
}
