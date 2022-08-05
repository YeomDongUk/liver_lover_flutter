// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/usecases/examination_result/get_examination_results.dart';

part 'examination_results_state.dart';

class ExaminationResultsCubit extends Cubit<ExaminationResultsState> {
  ExaminationResultsCubit({
    required this.getExaminationResults,
  }) : super(const ExaminationResultsState());

  final GetExaminationResults getExaminationResults;

  Future<void> load(BetweenDateTime betweenDateTime) async {
    emit(
      state.copyWith(
        status: ExaminationResultsStatus.loadInProgress,
        examinationResults: const [],
      ),
    );

    final either = await getExaminationResults.call(betweenDateTime);

    emit(
      either.fold(
        (l) => state.copyWith(status: ExaminationResultsStatus.loadFailure),
        (r) => state.copyWith(
          status: ExaminationResultsStatus.loadSuccess,
          examinationResults: r,
        ),
      ),
    );
  }

  void add(ExaminationResult excerciseHistory) {
    final results = List<ExaminationResult>.from(
      state.examinationResults,
    );
    final index =
        results.indexWhere((element) => element.id == excerciseHistory.id);

    if (index == -1) {
      emit(
        state.copyWith(
          examinationResults: results..add(excerciseHistory),
        ),
      );
    } else {
      emit(
        state.copyWith(
          examinationResults: results..[index] = excerciseHistory,
        ),
      );
    }
  }
}
