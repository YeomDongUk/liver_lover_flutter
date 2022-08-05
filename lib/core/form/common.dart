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

enum ReservedAtValidationError {
  empty,
  wrong,
  befreDate,
}

class ReservedAt extends FormzInput<String, ReservedAtValidationError> {
  const ReservedAt.pure() : super.pure('');
  const ReservedAt.dirty(super.value) : super.dirty();

  @override
  ReservedAtValidationError? validator(String value) => value.isEmpty
      ? ReservedAtValidationError.empty
      : int.tryParse(value) == null
          ? ReservedAtValidationError.wrong
          : DateTime.fromMillisecondsSinceEpoch(
              int.parse(value),
            ).isBefore(DateTime.now())
              ? ReservedAtValidationError.befreDate
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
