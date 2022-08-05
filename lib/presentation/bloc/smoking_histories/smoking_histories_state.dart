part of 'smoking_histories_cubit.dart';

enum SmokingHistoriesStatus {
  none,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class SmokingHistoriesState extends Equatable {
  const SmokingHistoriesState({
    this.status = SmokingHistoriesStatus.none,
    this.smokingHistories = const [],
  });

  final SmokingHistoriesStatus status;
  final List<SmokingHistory> smokingHistories;

  SmokingHistoriesState copyWith({
    SmokingHistoriesStatus? status,
    List<SmokingHistory>? smokingHistories,
  }) =>
      SmokingHistoriesState(
        status: status ?? this.status,
        smokingHistories: smokingHistories ?? this.smokingHistories,
      );

  @override
  List<Object> get props => [
        status,
        smokingHistories,
      ];
}
