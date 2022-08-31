// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/user/user_id.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.userIdImpl) : super(AuthInitial());

  final UserIdImpl userIdImpl;

  void updateUser(User user) {
    userIdImpl.value = user.id;
    emit(AuthSuccess(user: user));
  }

  Future<void> logOut() async {
    await KiwiContainer().resolve<UserRepository>().logOut();

    userIdImpl.value = '-';
    emit(AuthInitial());
  }
}
