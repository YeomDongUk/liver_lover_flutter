import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/metabolic_disease.dart';
import 'package:yak/domain/usecases/metabolic_disease/get_metabolic_disease.dart';
import 'package:yak/presentation/bloc/on_user_state.dart';

part 'metabolic_disease_state.dart';

class MetabolicDiseaseCubit extends Cubit<MetabolicDiseaseState>
    implements IonUserState {
  MetabolicDiseaseCubit({
    required this.getMetabolicDisease,
  }) : super(const MetabolicDiseaseState());
  final GetMetabolicDisease getMetabolicDisease;

  Future<void> loadMetabolicDisease() async {
    emit(state.copyWith(status: MetabolicDiseaseStatus.loadInProgress));
    final either = await getMetabolicDisease.call(null);
    emit(
      either.fold(
        (l) => state.copyWith(status: MetabolicDiseaseStatus.loadFailure),
        (r) => state.copyWith(status: MetabolicDiseaseStatus.loadSuccess),
      ),
    );
  }

  void updateMetabolicDisease(MetabolicDisease metabolicDisease) => emit(
        state.copyWith(
          status: MetabolicDiseaseStatus.updateSuccess,
          metabolicDisease: metabolicDisease,
        ),
      );

  @override
  void onLogout() => emit(const MetabolicDiseaseState());
}
