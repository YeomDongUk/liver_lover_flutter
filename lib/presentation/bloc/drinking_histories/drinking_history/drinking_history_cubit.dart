// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/usecases/drinking_history/get_drinking_history_average.dart';

part 'drinking_history_state.dart';

class DrinkingHistoryCubit extends Cubit<DrinkingHistoryState> {
  DrinkingHistoryCubit({required this.getDrinkingHistoryAverage})
      : super(const DrinkingHistoryState());

  final GetDrinkingHistoryAverage getDrinkingHistoryAverage;

  void updateDrinkingHistory(DrinkingHistory? drinkingHistory) {
    emit(
      DrinkingHistoryState(
        drinkingHistory: drinkingHistory,
      ),
    );
    if (drinkingHistory != null) loadAverage(drinkingHistory.id);
  }

  Future<void> loadAverage(String id) async {
    final either = await getDrinkingHistoryAverage.call(id);

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
