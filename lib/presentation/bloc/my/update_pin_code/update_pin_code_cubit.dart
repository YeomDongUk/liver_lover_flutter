// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/form/auth/auth_form.dart';
import 'package:yak/domain/usecases/user/update_pin_code.dart';

part 'update_pin_code_state.dart';

class UpdatePinCodeCubit extends Cubit<UpdatePinCodeState> {
  UpdatePinCodeCubit({
    required this.updatePinCode,
  }) : super(const UpdatePinCodeState());
  final UpdatePinCode updatePinCode;
  Future<void> submit() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await updatePinCode.call(state.verifiedPinCode.value);

    return emit(
      either.fold(
        (l) => state.copyWith(status: FormzStatus.submissionFailure),
        (r) => state.copyWith(status: FormzStatus.submissionSuccess),
      ),
    );
  }

  void nextStep() => emit(state.copyWith(step: UpdatePinCodeStep.verifying));

  void enterPinCode(String pinCode) => emit(
        state.copyWith(
          pinCode: PinCode.dirty(pinCode),
        ),
      );

  void enterVerifiedPinCode(String verifiedPinCode) => emit(
        state.copyWith(
          verifiedPinCode: PinCode.dirty(verifiedPinCode),
        ),
      );
}
