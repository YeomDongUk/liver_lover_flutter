// Package imports:
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/form/error.dart';

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty(super.value) : super.dirty();

  @override
  NameValidationError? validator(String? value) =>
      value?.isNotEmpty == true ? null : NameValidationError.empty;
}

enum AfterNowDateInputValidationError {
  isNull,
  wrong,
}

class AfterNowDateInput
    extends FormzInput<DateTime?, AfterNowDateInputValidationError> {
  const AfterNowDateInput.pure() : super.pure(null);
  const AfterNowDateInput.dirty(super.value) : super.dirty();

  @override
  AfterNowDateInputValidationError? validator(DateTime? value) => value == null
      ? AfterNowDateInputValidationError.isNull
      : value.isBefore(DateTime.now())
          ? AfterNowDateInputValidationError.wrong
          : null;
}

class Push extends FormzInput<bool, void> {
  const Push.pure() : super.pure(false);
  const Push.dirty(super.value) : super.dirty();

  @override
  void validator(bool value) {}
}

class BeforePush extends FormzInput<bool, void> {
  const BeforePush.pure() : super.pure(false);
  const BeforePush.dirty(super.value) : super.dirty();

  @override
  void validator(bool value) {}
}

class AfterPush extends FormzInput<bool, void> {
  const AfterPush.pure() : super.pure(false);
  const AfterPush.dirty(super.value) : super.dirty();

  @override
  void validator(bool value) {}
}

enum DateInputValidationError {
  isNull,
}

class DateInput extends FormzInput<DateTime?, DateInputValidationError> {
  const DateInput.pure() : super.pure(null);
  const DateInput.dirty(DateTime super.dateTime) : super.dirty();

  @override
  DateInputValidationError? validator(DateTime? value) =>
      value == null ? DateInputValidationError.isNull : null;
}

enum PositiveIntInputValidationError {
  isNull,
  lessThenEqualZero,
}

class PositiveIntInput
    extends FormzInput<int?, PositiveIntInputValidationError> {
  const PositiveIntInput.pure() : super.pure(null);
  const PositiveIntInput.dirty(super.value) : super.dirty();

  @override
  PositiveIntInputValidationError? validator(int? value) => value == null
      ? PositiveIntInputValidationError.isNull
      : value < 1
          ? PositiveIntInputValidationError.lessThenEqualZero
          : null;
}
