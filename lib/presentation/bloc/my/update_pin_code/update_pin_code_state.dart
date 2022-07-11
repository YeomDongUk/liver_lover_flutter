part of 'update_pin_code_cubit.dart';

enum UpdatePinCodeStep {
  create,
  verifying,
}

class UpdatePinCodeState extends Equatable {
  const UpdatePinCodeState({
    this.step = UpdatePinCodeStep.create,
    this.status = FormzStatus.pure,
    this.pinCode = const PinCode.pure(),
    this.verifiedPinCode = const PinCode.pure(),
  });
  final UpdatePinCodeStep step;
  final FormzStatus status;
  final PinCode pinCode;
  final PinCode verifiedPinCode;

  UpdatePinCodeState copyWith({
    UpdatePinCodeStep? step,
    FormzStatus? status,
    PinCode? pinCode,
    PinCode? verifiedPinCode,
  }) =>
      UpdatePinCodeState(
        step: step ?? this.step,
        status: status ??
            Formz.validate(
              List<FormzInput>.from(<FormzInput>[
                pinCode ?? this.pinCode,
                verifiedPinCode ?? this.verifiedPinCode,
              ]),
            ),
        pinCode: pinCode ?? this.pinCode,
        verifiedPinCode: verifiedPinCode ?? this.verifiedPinCode,
      );

  bool get canNextStep => pinCode.valid;

  bool get canSubmit =>
      pinCode.value == verifiedPinCode.value && status.isValid;

  @override
  List<Object> get props => [
        step,
        status,
        pinCode,
        verifiedPinCode,
      ];
}
