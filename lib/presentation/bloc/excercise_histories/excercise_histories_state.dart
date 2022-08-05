part of 'excercise_histories_cubit.dart';

enum ExcerciseHistoriesStatus {
  none,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class ExcerciseHistoriesState extends Equatable {
  const ExcerciseHistoriesState({
    this.status = ExcerciseHistoriesStatus.none,
    this.excerciseHistories = const [],
  });

  final ExcerciseHistoriesStatus status;
  final List<ExcerciseHistory> excerciseHistories;

  ExcerciseHistoriesState copyWith({
    ExcerciseHistoriesStatus? status,
    List<ExcerciseHistory>? excerciseHistories,
  }) =>
      ExcerciseHistoriesState(
        status: status ?? this.status,
        excerciseHistories: excerciseHistories ?? this.excerciseHistories,
      );

  @override
  List<Object> get props => [
        status,
        excerciseHistories,
      ];
}
