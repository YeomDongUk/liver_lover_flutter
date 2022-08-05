part of 'auto_login_cubit.dart';

abstract class AutoLoginState extends Equatable {
  const AutoLoginState();

  @override
  List<Object> get props => [];
}

class AutoLoginInitial extends AutoLoginState {}

class AutoLoginInProgress extends AutoLoginState {}

class AutoLoginSucceess extends AutoLoginState {
  const AutoLoginSucceess({required this.user});

  final User user;

  @override
  List<Object> get props => [...super.props, user];
}

class AutoLoginFailure extends AutoLoginState {}
