part of 'drinking_history_cubit.dart';

class DrinkingHistoryState extends Equatable {
  const DrinkingHistoryState({
    this.drinkingHistory,
    this.average = 0,
  });
  final DrinkingHistory? drinkingHistory;
  final double average;

  DrinkingHistoryState copyWith({double? average}) => DrinkingHistoryState(
        drinkingHistory: drinkingHistory,
        average: average ?? this.average,
      );
  @override
  List<Object?> get props => [
        drinkingHistory,
        average,
      ];
}
