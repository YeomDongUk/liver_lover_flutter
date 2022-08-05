// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_histories.dart';

part 'smoking_histories_state.dart';

class SmokingHistoriesCubit extends Cubit<SmokingHistoriesState> {
  SmokingHistoriesCubit({
    required this.getSmokingHistories,
  }) : super(const SmokingHistoriesState());

  final GetSmokingHistories getSmokingHistories;

  Future<void> load(BetweenDateTime betweenDateTime) async {
    emit(
      state.copyWith(
        status: SmokingHistoriesStatus.loadInProgress,
        smokingHistories: const [],
      ),
    );

    final either = await getSmokingHistories.call(betweenDateTime);

    emit(
      either.fold(
        (l) => state.copyWith(status: SmokingHistoriesStatus.loadFailure),
        (r) => state.copyWith(
          status: SmokingHistoriesStatus.loadSuccess,
          smokingHistories: r,
        ),
      ),
    );
  }

  void add(SmokingHistory smokingHistory) => emit(
        state.copyWith(
          smokingHistories: List<SmokingHistory>.from(
            state.smokingHistories,
          )..add(smokingHistory),
        ),
      );
}
