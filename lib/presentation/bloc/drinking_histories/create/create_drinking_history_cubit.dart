// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/usecases/drinking_history/upsert_drinking_history.dart';

part 'create_drinking_history_state.dart';

class CreateDrinkingHistoryCubit extends Cubit<CreateDrinkingHistoryState> {
  CreateDrinkingHistoryCubit({
    required this.date,
    required this.upsertDrinkingHistory,
  }) : super(const CreateDrinkingHistoryState());
  final DateTime date;
  final UpsertDrinkingHistory upsertDrinkingHistory;

  Future<DrinkingHistory?> submit() async {
    emit(state.copywith(status: FormzStatus.submissionInProgress));
    try {
      final either = await upsertDrinkingHistory.call(
        DrinkingHistoriesCompanion(
          amount: Value(
            ((state.amount ?? 0) * state.alcoholType.alcoholAmount).ceil(),
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

  void updateAlcoholType(AlcoholType alcoholType) => emit(
        state.copywith(
          alcoholType: alcoholType,
        ),
      );

  void updateAmount(double? amount) => emit(
        amount == null
            ? CreateDrinkingHistoryState(
                status: FormzStatus.invalid,
                alcoholType: state.alcoholType,
              )
            : state.copywith(
                status: FormzStatus.valid,
                amount: amount,
              ),
      );
}
