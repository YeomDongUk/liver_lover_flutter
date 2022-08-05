// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/usecases/drinking_history/get_drinking_histories.dart';

part 'drinking_histories_state.dart';

class DrinkingHistoriesCubit extends Cubit<DrinkingHistoriesState> {
  DrinkingHistoriesCubit({
    required this.getDrinkingHistories,
  }) : super(const DrinkingHistoriesState());

  final GetDrinkingHistories getDrinkingHistories;

  Future<void> load(BetweenDateTime betweenDateTime) async {
    emit(
      state.copyWith(
        status: DrinkingHistoriesStatus.loadInProgress,
        drinkingHistories: const [],
      ),
    );

    final either = await getDrinkingHistories.call(betweenDateTime);

    emit(
      either.fold(
        (l) => state.copyWith(status: DrinkingHistoriesStatus.loadFailure),
        (r) => state.copyWith(
          status: DrinkingHistoriesStatus.loadSuccess,
          drinkingHistories: r,
        ),
      ),
    );
  }

  void add(DrinkingHistory drinkingHistory) => emit(
        state.copyWith(
          drinkingHistories: List<DrinkingHistory>.from(
            state.drinkingHistories,
          )..add(drinkingHistory),
        ),
      );
}
