import 'package:formz/formz.dart';

enum PhoneValidationError {
  empty,
  wrong,
}

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty(super.value) : super.dirty();

  @override
  PhoneValidationError? validator(String? value) {
    final phoneExp = RegExp(r'/^010-?([0-9]{4})-?([0-9]{4})$/');
    if (value == null || value.isEmpty) {
      return PhoneValidationError.empty;
    } else if (phoneExp.hasMatch(value)) {
      return PhoneValidationError.wrong;
    } else {
      return null;
    }
  }
}

enum BirthYearValidationError {
  empty,
  wrong,
}

class BirthYear extends FormzInput<int?, BirthYearValidationError> {
  const BirthYear.pure() : super.pure(null);
  const BirthYear.dirty(super.value) : super.dirty();

  @override
  BirthYearValidationError? validator(int? value) {
    if (value == null) {
      return BirthYearValidationError.empty;
    } else if (value < 1900) {
      return BirthYearValidationError.wrong;
    } else {
      return null;
    }
  }
}

enum SexValidationError {
  empty,
}

class Sex extends FormzInput<int, SexValidationError> {
  const Sex.pure() : super.pure(0);
  const Sex.dirty(super.value) : super.dirty();

  @override
  SexValidationError? validator(int value) => null;
}

enum HeightValidationError {
  empty,
}

class Height extends FormzInput<int?, HeightValidationError> {
  const Height.pure() : super.pure(null);
  const Height.dirty(super.value) : super.pure();

  @override
  HeightValidationError? validator(int? value) =>
      value == null ? HeightValidationError.empty : null;
}

enum WeightValidationError {
  empty,
  wrong,
}

class Weight extends FormzInput<int?, WeightValidationError> {
  const Weight.pure() : super.pure(null);
  const Weight.dirty(super.value) : super.pure();

  @override
  WeightValidationError? validator(int? value) =>
      value == null ? WeightValidationError.empty : null;
}

enum PinCodeValidationError {
  empty,
  wrong,
}

class PinCode extends FormzInput<String, PinCodeValidationError> {
  const PinCode.pure() : super.pure('');
  const PinCode.dirty(super.value) : super.dirty();

  @override
  PinCodeValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PinCodeValidationError.empty;
    } else if (value.length != 6 || int.tryParse(value) == null) {
      return PinCodeValidationError.wrong;
    } else {
      return null;
    }
  }
}

class MetabolicDisease extends FormzInput<bool, void> {
  const MetabolicDisease.pure() : super.pure(false);
  const MetabolicDisease.dirty(super.value) : super.dirty();

  @override
  void validator(bool value) {
    return;
  }
}
