import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/usecases/user/create_user.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/auth/join/join_form.dart';

import '../../../../core/form/auth/auth_form.dart';

part 'join_state.dart';

class JoinCubit extends Cubit<JoinState> {
  JoinCubit({
    required this.authCubit,
    required this.createUser,
  }) : super(const JoinState());

  final AuthCubit authCubit;
  final CreateUser createUser;

  Future<User?> submit() async {
    final formStatus = Formz.validate(
      List<FormzInput>.from(state.props..remove(state.joinForm)),
    );

    if (formStatus.isValid &&
        state.pinCode.value == state.verifingPinCode.value) {
      final companion = UsersCompanion.insert(
        name: state.name.value,
        phone: state.phone.value,
        birthYear: state.birthYear.value!,
        sex: state.sex.value,
        height: state.height.value!,
        weight: state.weight.value!,
        metabolicDisease: Value(state.metabolicDisease.value),
        pinCode: state.pinCode.value,
      );
      try {
        final result = await createUser.call(companion);

        final userOrFailure = result.fold(
          (l) => l,
          (r) => r,
        );

        if (userOrFailure is User) {
          return userOrFailure;
        } else {
          return null;
        }
      } catch (e) {
        print(e);
        return null;
      }
    }

    return null;
  }

  void next() {
    if (state.joinForm == JoinForm.inputing) {
      final status = Formz.validate(
        List<FormzInput>.from(state.props..remove(state.joinForm))
          ..remove(state.pinCode)
          ..remove(state.verifingPinCode),
      );
      if (status.isValid) {
        return emit(
          state.copyWith(
            joinForm: JoinForm.registeringPin,
          ),
        );
      }
    } else if (state.joinForm == JoinForm.registeringPin) {
      emit(state.copyWith(joinForm: JoinForm.verifingPin));
    } else if (state.joinForm == JoinForm.verifingPin) {
      emit(state.copyWith(joinForm: JoinForm.success));
    }
  }

  void updateName(String username) => emit(
        state.copyWith(
          name: Name.dirty(username),
        ),
      );

  void updatePhone(String phone) => emit(
        state.copyWith(
          phone: Phone.dirty(phone),
        ),
      );

  void updateBirthYear(int? birthYear) => emit(
        state.copyWith(
          birthYear: BirthYear.dirty(birthYear),
        ),
      );

  void updateSex(int sex) => emit(
        state.copyWith(
          sex: Sex.dirty(sex),
        ),
      );

  void updateHeight(int? height) => emit(
        state.copyWith(
          height: Height.dirty(height),
        ),
      );

  void updateWeight(int? weight) => emit(
        state.copyWith(
          weight: Weight.dirty(weight),
        ),
      );

  void updatePinCode(String pinCode) => emit(
        state.copyWith(
          pinCode: PinCode.dirty(pinCode),
        ),
      );
  void updateverifingPinCode(String verifingPinCode) => emit(
        state.copyWith(
          verifingPinCode: PinCode.dirty(verifingPinCode),
        ),
      );

  void updateMetabolicDisease(bool metabolicDisease) => emit(
        state.copyWith(
          metabolicDisease: MetabolicDisease.dirty(metabolicDisease),
        ),
      );
}
