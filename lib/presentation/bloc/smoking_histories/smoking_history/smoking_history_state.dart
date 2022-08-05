part of 'smoking_history_cubit.dart';

class SmokingHistoryState extends Equatable {
  const SmokingHistoryState({
    this.smokingHistory,
    this.average = 0,
  });
  final SmokingHistory? smokingHistory;
  final double average;

  SmokingHistoryState copyWith({double? average}) => SmokingHistoryState(
        smokingHistory: smokingHistory,
        average: average ?? this.average,
      );
  @override
  List<Object?> get props => [
        smokingHistory,
        average,
      ];
}
