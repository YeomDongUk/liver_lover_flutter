part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.pinCode = const PinCode.pure(),
  });
  final FormzStatus status;
  final PinCode pinCode;

  LoginState copyWith({
    FormzStatus? status,
    PinCode? pinCode,
  }) =>
      LoginState(
        status: status ?? this.status,
        pinCode: pinCode ?? this.pinCode,
      );

  @override
  List<Object> get props => [status, pinCode];
}
