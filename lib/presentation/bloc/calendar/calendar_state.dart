part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  const CalendarState({
    required this.selectedDate,
    required this.focusDate,
  });
  final DateTime selectedDate;
  final DateTime focusDate;

  CalendarState copyWith({
    DateTime? selectedDate,
    DateTime? focusDate,
  }) =>
      CalendarState(
        selectedDate: selectedDate ?? this.selectedDate,
        focusDate: focusDate ?? this.focusDate,
      );

  @override
  List<Object> get props => [selectedDate, focusDate];
}
