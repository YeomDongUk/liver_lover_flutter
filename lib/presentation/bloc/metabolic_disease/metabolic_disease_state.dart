part of 'metabolic_disease_cubit.dart';

enum MetabolicDiseaseStatus {
  none,
  loadInProgress,
  loadSuccess,
  loadFailure,
  updateSuccess,
}

class MetabolicDiseaseState extends Equatable {
  const MetabolicDiseaseState({
    this.status = MetabolicDiseaseStatus.none,
    this.metabolicDisease,
  });
  final MetabolicDiseaseStatus status;
  final MetabolicDisease? metabolicDisease;

  MetabolicDiseaseState copyWith({
    MetabolicDiseaseStatus? status,
    MetabolicDisease? metabolicDisease,
  }) =>
      MetabolicDiseaseState(
        status: status ?? this.status,
        metabolicDisease: metabolicDisease ?? this.metabolicDisease,
      );

  @override
  List<Object?> get props => [
        status,
        metabolicDisease,
      ];
}
