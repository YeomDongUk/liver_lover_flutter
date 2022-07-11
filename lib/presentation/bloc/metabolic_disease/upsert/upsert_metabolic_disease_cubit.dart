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
        hbvInactivityConfirmedAt:
            Value(state.metabolicDisease.hbvInactivityConfirmedAt),
        chronicHbvConfirmedAt:
            Value(state.metabolicDisease.chronicHbvConfirmedAt),
        cirrhosisConfirmedAt:
            Value(state.metabolicDisease.cirrhosisConfirmedAt),
        hcv: Value(state.metabolicDisease.hcv),
        fattyRiver: Value(state.metabolicDisease.fattyRiver),
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
          metabolicDisease: state.metabolicDisease.copyWith(hav: hav),
        ),
      );
  void updateAntiHavConfirmedAt(DateTime antiHavConfirmedAt) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease
              .copyWith(antiHavConfirmedAt: antiHavConfirmedAt),
        ),
      );

  void updateVaccinConfirmedAt(DateTime vaccinConfirmedAt) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease
              .copyWith(vaccinConfirmedAt: vaccinConfirmedAt),
        ),
      );

  void updateHbv(bool hbv) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease.copyWith(hbv: hbv),
        ),
      );

  void updateHbvConfirmedAt(DateTime hbvConfirmedAt) => emit(
        state.copyWith(
          metabolicDisease:
              state.metabolicDisease.copyWith(hbvConfirmedAt: hbvConfirmedAt),
        ),
      );

  void updateHbvInactivityConfirmedAt(DateTime hbvInactivityConfirmedAt) =>
      emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease
              .copyWith(hbvInactivityConfirmedAt: hbvInactivityConfirmedAt),
        ),
      );

  void updateChronicHbvConfirmedAt(DateTime chronicHbvConfirmedAt) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease
              .copyWith(chronicHbvConfirmedAt: chronicHbvConfirmedAt),
        ),
      );

  void updateCirrhosisConfirmedAt(DateTime cirrhosisConfirmedAt) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease
              .copyWith(cirrhosisConfirmedAt: cirrhosisConfirmedAt),
        ),
      );

  void updateHcv(bool hcv) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease.copyWith(hcv: hcv),
        ),
      );

  void updateFattyRiver(bool fattyRiver) => emit(
        state.copyWith(
          metabolicDisease: state.metabolicDisease.copyWith(
            fattyRiver: fattyRiver,
          ),
        ),
      );
}
