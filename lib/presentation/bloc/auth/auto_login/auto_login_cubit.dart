// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/usecases/user/auto_login.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<AutoLoginState> {
  AutoLoginCubit({required this.autoLogin}) : super(AutoLoginInitial());
  final AutoLogin autoLogin;

  Future<void> login() async {
    emit(AutoLoginInProgress());

    final either = await autoLogin.call(null);

    emit(
      either.fold(
        (l) => AutoLoginFailure(),
        (r) => AutoLoginSucceess(user: r),
      ),
    );
  }
}
