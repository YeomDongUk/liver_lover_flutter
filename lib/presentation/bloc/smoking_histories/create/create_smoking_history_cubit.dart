// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/smoking_history/upsert_smoking_history.dart';

part 'create_smoking_history_state.dart';

class CreateSmokingHistoryCubit extends Cubit<CreateSmokingHistoryState> {
  CreateSmokingHistoryCubit({
    required this.date,
    required this.upsertSmokingHistory,
  }) : super(const CreateSmokingHistoryState());
  final DateTime date;
  final UpsertSmokingHistory upsertSmokingHistory;

  Future<SmokingHistory?> submit() async {
    emit(state.copywith(status: FormzStatus.submissionInProgress));
    try {
      final either = await upsertSmokingHistory.call(
        SmokingHistoriesCompanion(
          amount: Value(
            state.amount ?? 0,
          ),
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

  void updateAmount(int? amount) => emit(
        amount == null
            ? const CreateSmokingHistoryState(
                status: FormzStatus.invalid,
              )
            : state.copywith(
                status: FormzStatus.valid,
                amount: amount,
              ),
      );
}
