part of 'upsert_metabolic_disease_cubit.dart';

class UpsertMetabolicDiseaseState extends Equatable {
  const UpsertMetabolicDiseaseState({
    this.status = FormzStatus.valid,
    required this.metabolicDisease,
  });
  final FormzStatus status;
  final MetabolicDisease metabolicDisease;

  UpsertMetabolicDiseaseState copyWith({
    FormzStatus? status,
    MetabolicDisease? metabolicDisease,
  }) =>
      UpsertMetabolicDiseaseState(
        status: status ?? this.status,
        metabolicDisease: metabolicDisease ?? this.metabolicDisease,
      );

  @override
  List<Object> get props => [
        status,
        metabolicDisease,
      ];
}
