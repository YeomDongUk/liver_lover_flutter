part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState({this.user = User.empty});
  final User user;

  @override
  List<Object> get props => [user];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  const AuthSuccess({super.user});
}

class AuthFailure extends AuthState {}
