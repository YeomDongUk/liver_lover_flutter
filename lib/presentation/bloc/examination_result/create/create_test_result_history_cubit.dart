// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/usecases/excercise_history/upsert_excercise_history.dart';

part 'create_test_result_history_state.dart';

class CreateExcerciseHistoryCubit extends Cubit<CreateExcerciseHistoryState> {
  CreateExcerciseHistoryCubit({
    required this.date,
    required this.upsertExcerciseHistory,
  }) : super(const CreateExcerciseHistoryState());
  final DateTime date;
  final UpsertExcerciseHistory upsertExcerciseHistory;

  Future<ExcerciseHistory?> submit() async {
    emit(state.copywith(status: FormzStatus.submissionInProgress));
    try {
      final either = await upsertExcerciseHistory.call(
        ExcerciseHistoriesCompanion(
          minuite: Value(
            state.minuite ?? 0,
          ),
          weight: Value(((state.weight ?? 0) * 1000).toInt()),
          date: Value(date),
        ),
      );

      emit(
        state.copywith(
          status: either.fold(
            (l) => FormzStatus.submissionFailure,
            (r) => FormzStatus.submissionSuccess,
          ),
        ),
      );

      return either.fold(
        (l) => null,
        (r) => r,
      );
    } catch (e) {
      return null;
    }
  }

  void updateMinuite(int? minuite) => emit(
        minuite == null
            ? CreateExcerciseHistoryState(
                status: FormzStatus.invalid,
                weight: state.weight,
              )
            : state.copywith(
                status: state.weight != null
                    ? FormzStatus.valid
                    : FormzStatus.invalid,
                minuite: minuite,
              ),
      );

  void updateWeight(double? weight) => emit(
        weight == null
            ? CreateExcerciseHistoryState(
                status: FormzStatus.invalid,
                minuite: state.minuite,
              )
            : state.copywith(
                status: state.minuite != null
                    ? FormzStatus.valid
                    : FormzStatus.invalid,
                weight: weight,
              ),
      );
}
