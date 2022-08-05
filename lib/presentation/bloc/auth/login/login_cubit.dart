// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/form/auth/auth_form.dart';
import 'package:yak/domain/usecases/user/get_user.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authCubit,
    required this.getUser,
  }) : super(const LoginState());
  final GetUser getUser;
  final AuthCubit authCubit;

  Future<void> submit() async {
    if (state.status.isValid) {
      try {
        final getUserResult = await getUser.call(state.pinCode.value);

        return emit(
          getUserResult.fold(
            (l) => state.copyWith(status: FormzStatus.submissionFailure),
            (r) {
              authCubit.updateUser(r);
              return state.copyWith(status: FormzStatus.submissionSuccess);
            },
          ),
        );
      } catch (e) {
        return emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void updatePinCode(String str) {
    final pinCode = PinCode.dirty(str);
    emit(
      state.copyWith(
        status: Formz.validate([pinCode]),
        pinCode: pinCode,
      ),
    );
  }
}
