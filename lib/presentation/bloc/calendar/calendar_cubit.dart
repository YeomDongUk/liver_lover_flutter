// ignore_for_file: prefer_const_constructors

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({
    required DateTime now,
    required DateTime focusDate,
  }) : super(
          CalendarState(
            focusDate: focusDate,
            selectedDate: now,
          ),
        );

  final firstDay = DateTime(2022, 7);

  void updateSelectDate(DateTime date) => emit(
        state.copyWith(selectedDate: date),
      );

  void updateFocusDate(DateTime date) => emit(
        state.copyWith(focusDate: date),
      );
}
