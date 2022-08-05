// Package imports:
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/form/auth/auth_form.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/usecases/user/update_user.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit({
    required User user,
    required this.updateUser,
  }) : super(
          UpdateUserState(
            status: FormzStatus.valid,
            birthYear: BirthYear.dirty(user.birthYear),
            height: Height.dirty(user.height),
            name: Name.dirty(user.name),
            phone: Phone.dirty(user.phone),
            sex: Sex.dirty(user.sex),
            weight: Weight.dirty(user.weight),
          ),
        );
  final UpdateUser updateUser;

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

  Future<User?> submit() async {
    final either = await updateUser.call(
      UsersCompanion(
        name: Value(state.name.value),
        phone: Value(state.phone.value),
        birthYear: Value(state.birthYear.value!),
        sex: Value(state.sex.value),
        height: Value(state.height.value!),
        weight: Value(state.weight.value!),
      ),
    );

    return either.fold(
      (l) => null,
      (r) => r,
    );
  }
}
