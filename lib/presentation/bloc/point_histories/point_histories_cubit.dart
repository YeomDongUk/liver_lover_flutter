// Package imports:
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/point_history/point_history.dart';
import 'package:yak/domain/usecases/point_history/get_point_histories.dart';

part 'point_histories_state.dart';

class PointHistoriesCubit extends Cubit<PointHistoriesState> {
  PointHistoriesCubit({
    required this.getPointHistories,
  }) : super(const PointHistoriesState());

  final GetPointHistories getPointHistories;

  Future<void> load() async {
    emit(
      state.copyWith(
        status: PointHistoriesStatus.loadInProgress,
        hasNext: false,
      ),
    );

    final cursor =
        state.pointHistories.lastOrNull?.createdAt.millisecondsSinceEpoch;

    final either = await getPointHistories.call(cursor);

    return emit(
      either.fold(
        (l) => state.copyWith(
          status: PointHistoriesStatus.loadFailure,
          hasNext: false,
        ),
        (r) => state.copyWith(
          status: PointHistoriesStatus.loadSuccess,
          hasNext: r.length >= 15,
          pointHistories: List<PointHistory>.from(state.pointHistories)
            ..addAll(r),
        ),
      ),
    );
  }
}
