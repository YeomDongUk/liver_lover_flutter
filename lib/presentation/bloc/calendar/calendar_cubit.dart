// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({required this.now})
      : super(
          CalendarState(
            focusDate: DateTime.now(),
            selectedDate: DateTime.now(),
          ),
        );

  final DateTime now;
  final firstDay = DateTime(2022, 7);

  void updateSelectDate(DateTime date) => emit(
        state.copyWith(selectedDate: date),
      );
  void updateFocusDate(DateTime date) => emit(
        state.copyWith(focusDate: date),
      );
}
