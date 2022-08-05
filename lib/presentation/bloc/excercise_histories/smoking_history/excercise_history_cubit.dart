// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_history_average.dart';

part 'excercise_history_state.dart';

class ExcerciseHistoryCubit extends Cubit<ExcerciseHistoryState> {
  ExcerciseHistoryCubit({required this.getExcerciseHistoryAverage})
      : super(const ExcerciseHistoryState());

  final GetExcerciseHistoryAverage getExcerciseHistoryAverage;

  void updateExcerciseHistory(ExcerciseHistory? excerciseHistory) {
    emit(
      ExcerciseHistoryState(
        excerciseHistory: excerciseHistory,
      ),
    );
    if (excerciseHistory != null) loadAverage(excerciseHistory.id);
  }

  Future<void> loadAverage(String id) async {
    final either = await getExcerciseHistoryAverage.call(id);

    emit(
      state.copyWith(
        average: either.fold(
          (l) => 0,
          (r) => r,
        ),
      ),
    );
  }
}
