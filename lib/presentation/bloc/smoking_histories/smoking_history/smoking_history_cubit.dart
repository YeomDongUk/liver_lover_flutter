// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_history_average.dart';

part 'smoking_history_state.dart';

class SmokingHistoryCubit extends Cubit<SmokingHistoryState> {
  SmokingHistoryCubit({required this.getSmokingHistoryAverage})
      : super(const SmokingHistoryState());

  final GetSmokingHistoryAverage getSmokingHistoryAverage;

  void updateSmokingHistory(SmokingHistory? smokingHistory) {
    emit(
      SmokingHistoryState(
        smokingHistory: smokingHistory,
      ),
    );
    if (smokingHistory != null) loadAverage(smokingHistory.id);
  }

  Future<void> loadAverage(String id) async {
    final either = await getSmokingHistoryAverage.call(id);

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
