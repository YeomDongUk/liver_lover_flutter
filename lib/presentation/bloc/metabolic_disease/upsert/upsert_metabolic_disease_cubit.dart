import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/domain/entities/metabolic_disease.dart';
import 'package:yak/domain/usecases/metabolic_disease/upsert_metabolic_disease.dart';

part 'upsert_metabolic_disease_state.dart';

class UpsertMetabolicDiseaseCubit extends Cubit<UpsertMetabolicDiseaseState> {
  UpsertMetabolicDiseaseCubit({
    required MetabolicDisease metabolicDisease,
    required this.upsertMetabolicDisease,
  }) : super(UpsertMetabolicDiseaseState(metabolicDisease: metabolicDisease));

  final UpsertMetabolicDisease upsertMetabolicDisease;

  Future<void> submit() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await upsertMetabolicDisease.call(
      MetabolicDiseasesCompanion(
        hav: Value(state.metabolicDisease.hav),
        antiHavConfirmedAt: Value(state.metabolicDisease.antiHavConfirmedAt),
        vaccinConfirmedAt: Value(state.metabolicDisease.vaccinConfirmedAt),
        hbv: Value(state.metabolicDisease.hbv),
        hbvConfirmedAt: Value(state.metabolicDisease.hbvConfirmedAt),
        cirrhosis: Value(state.metabolicDisease.cirrhosis),
        hcv: Value(state.metabolicDisease.hcv),
      ),
    );

    return emit(
      either.fold(
        (l) => state.copyWith(status: FormzStatus.submissionFailure),
        (r) => state.copyWith(status: FormzStatus.submissionSuccess),
      ),
    );
  }

  void updateHav(bool hav) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease: state.metabolicDisease.copyWith(hav: hav),
        ),
      );
  void updateAntiHavConfirmedAt(DateTime antiHavConfirmedAt) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease: state.metabolicDisease
              .copyWith(antiHavConfirmedAt: antiHavConfirmedAt),
        ),
      );

  void updateVaccinConfirmedAt(DateTime vaccinConfirmedAt) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease: state.metabolicDisease
              .copyWith(vaccinConfirmedAt: vaccinConfirmedAt),
        ),
      );

  void updateHbv(bool hbv) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease: state.metabolicDisease.copyWith(hbv: hbv),
        ),
      );

  void updateHbvConfirmedAt(DateTime hbvConfirmedAt) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease:
              state.metabolicDisease.copyWith(hbvConfirmedAt: hbvConfirmedAt),
        ),
      );

  void updateCirrhosis(bool cirrhosis) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease:
              state.metabolicDisease.copyWith(cirrhosis: cirrhosis),
        ),
      );

  void updateHcv(bool hcv) => emit(
        state.copyWith(
          status: FormzStatus.valid,
          metabolicDisease: state.metabolicDisease.copyWith(hcv: hcv),
        ),
      );
}
