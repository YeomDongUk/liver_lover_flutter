import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> implements IOnUserState {
  AuthCubit(this.userIdImpl) : super(AuthInitial());

  final UserIdImpl userIdImpl;
  void updateUser(User user) {
    userIdImpl.value = user.id;
    emit(AuthSuccess(user: user));
  }

  void logOut() => emit(AuthInitial());

  @override
  void onLogout() {
    // TODO: implement onLogout
  }
}
