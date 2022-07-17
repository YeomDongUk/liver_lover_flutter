import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_b_circulator_state.dart';

class PageBCirculatorCubit extends Cubit<PageBCirculatorState> {
  PageBCirculatorCubit() : super(const PageBCirculatorState());

  void updateAge(int? age) {
    if (age == null) {
      emit(
        PageBCirculatorState(
          sex: state.sex,
          platelet: state.platelet,
          albumin: state.albumin,
        ),
      );
    } else {
      emit(state.copyWith(age: age));
    }
  }

  void updateSex(int? sex) {
    if (sex == null) {
      emit(
        PageBCirculatorState(
          age: state.age,
          platelet: state.platelet,
          albumin: state.albumin,
        ),
      );
    } else {
      emit(state.copyWith(sex: sex));
    }
  }

  void updatePlatelet(int? platelet) {
    if (platelet == null) {
      emit(
        PageBCirculatorState(
          age: state.age,
          sex: state.sex,
          albumin: state.albumin,
        ),
      );
    } else {
      emit(state.copyWith(platelet: platelet));
    }
  }

  void updateAlbumin(int? albumin) {
    if (albumin == null) {
      emit(
        PageBCirculatorState(
          age: state.age,
          sex: state.sex,
          platelet: state.platelet,
        ),
      );
    } else {
      emit(state.copyWith(albumin: albumin));
    }
  }
}
