part of 'today_diary_cubit.dart';

class TodayDiaryState extends Equatable {
  const TodayDiaryState({
    this.smokingHistory,
    this.drinkingHistory,
  });
  final SmokingHistory? smokingHistory;
  final DrinkingHistory? drinkingHistory;

  TodayDiaryState copyWith({
    SmokingHistory? smokingHistory,
    DrinkingHistory? drinkingHistory,
    bool setNull = false,
  }) =>
      TodayDiaryState(
        smokingHistory:
            smokingHistory ?? (setNull ? null : this.smokingHistory),
        drinkingHistory:
            drinkingHistory ?? (setNull ? null : this.drinkingHistory),
      );

  @override
  List<Object?> get props => [
        smokingHistory,
        drinkingHistory,
      ];
}
