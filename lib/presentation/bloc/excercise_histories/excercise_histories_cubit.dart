// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_histories.dart';

part 'excercise_histories_state.dart';

class ExcerciseHistoriesCubit extends Cubit<ExcerciseHistoriesState> {
  ExcerciseHistoriesCubit({
    required this.getExcerciseHistories,
  }) : super(const ExcerciseHistoriesState());

  final GetExcerciseHistories getExcerciseHistories;

  Future<void> load(BetweenDateTime betweenDateTime) async {
    emit(
      state.copyWith(
        status: ExcerciseHistoriesStatus.loadInProgress,
        excerciseHistories: const [],
      ),
    );

    final either = await getExcerciseHistories.call(betweenDateTime);

    emit(
      either.fold(
        (l) => state.copyWith(status: ExcerciseHistoriesStatus.loadFailure),
        (r) => state.copyWith(
          status: ExcerciseHistoriesStatus.loadSuccess,
          excerciseHistories: r,
        ),
      ),
    );
  }

  void add(ExcerciseHistory excerciseHistory) => emit(
        state.copyWith(
          excerciseHistories: List<ExcerciseHistory>.from(
            state.excerciseHistories,
          )..add(excerciseHistory),
        ),
      );
}
