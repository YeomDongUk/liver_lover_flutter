part of 'excercise_history_cubit.dart';

class ExcerciseHistoryState extends Equatable {
  const ExcerciseHistoryState({
    this.excerciseHistory,
    this.average = 0,
  });
  final ExcerciseHistory? excerciseHistory;
  final double average;

  ExcerciseHistoryState copyWith({double? average}) => ExcerciseHistoryState(
        excerciseHistory: excerciseHistory,
        average: average ?? this.average,
      );
  @override
  List<Object?> get props => [
        excerciseHistory,
        average,
      ];
}
