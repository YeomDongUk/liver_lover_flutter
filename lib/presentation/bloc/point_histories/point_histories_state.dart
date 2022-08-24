part of 'point_histories_cubit.dart';

enum PointHistoriesStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
  refreshInProgress,
}

class PointHistoriesState extends Equatable {
  const PointHistoriesState({
    this.status = PointHistoriesStatus.initial,
    this.hasNext = false,
    this.pointHistories = const [],
  });

  PointHistoriesState copyWith({
    PointHistoriesStatus? status,
    List<PointHistory>? pointHistories,
    bool? hasNext,
  }) =>
      PointHistoriesState(
        status: status ?? this.status,
        pointHistories: pointHistories ?? this.pointHistories,
        hasNext: hasNext ?? this.hasNext,
      );

  final PointHistoriesStatus status;
  final List<PointHistory> pointHistories;
  final bool hasNext;

  @override
  List<Object> get props => [
        status,
        pointHistories,
        hasNext,
      ];
}
