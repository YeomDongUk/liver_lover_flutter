// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fibrosis_circulator_state.dart';

class FibrosisCirculatorCubit extends Cubit<FibrosisCirculatorState> {
  FibrosisCirculatorCubit() : super(const FibrosisCirculatorState());

  void updateAge(int? age) {
    if (age == null) {
      emit(
        FibrosisCirculatorState(
          ast: state.ast,
          alt: state.alt,
          platelet: state.platelet,
        ),
      );
    } else {
      emit(state.copyWith(age: age));
    }
  }

  void updateAst(int? ast) {
    if (ast == null) {
      emit(
        FibrosisCirculatorState(
          age: state.age,
          alt: state.alt,
          platelet: state.platelet,
        ),
      );
    } else {
      emit(state.copyWith(ast: ast));
    }
  }

  void updateAlt(int? alt) {
    if (alt == null) {
      emit(
        FibrosisCirculatorState(
          age: state.age,
          ast: state.ast,
          platelet: state.platelet,
        ),
      );
    } else {
      emit(state.copyWith(alt: alt));
    }
  }

  void updatePlatelet(int? platelet) {
    if (platelet == null) {
      emit(
        FibrosisCirculatorState(
          age: state.age,
          ast: state.ast,
          alt: state.alt,
        ),
      );
    } else {
      emit(state.copyWith(platelet: platelet));
    }
  }
}
