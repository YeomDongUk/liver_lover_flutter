part of 'drinking_histories_cubit.dart';

enum DrinkingHistoriesStatus {
  none,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class DrinkingHistoriesState extends Equatable {
  const DrinkingHistoriesState({
    this.status = DrinkingHistoriesStatus.none,
    this.drinkingHistories = const [],
  });

  final DrinkingHistoriesStatus status;
  final List<DrinkingHistory> drinkingHistories;

  DrinkingHistoriesState copyWith({
    DrinkingHistoriesStatus? status,
    List<DrinkingHistory>? drinkingHistories,
  }) =>
      DrinkingHistoriesState(
        status: status ?? this.status,
        drinkingHistories: drinkingHistories ?? this.drinkingHistories,
      );

  @override
  List<Object> get props => [
        status,
        drinkingHistories,
      ];
}
