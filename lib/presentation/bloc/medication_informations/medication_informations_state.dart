part of 'medication_informations_cubit.dart';

enum MedicationInformationsStatus {
  initial,
  loadInProrgess,
  loadSuccess,
  loadFailure,
}

class MedicationInformationsState extends Equatable {
  const MedicationInformationsState({
    this.status = MedicationInformationsStatus.initial,
    this.informations = const [],
  });

  final MedicationInformationsStatus status;
  final List<MedicationInformation> informations;

  MedicationInformationsState copyWith({
    MedicationInformationsStatus? status,
    List<MedicationInformation>? informations,
  }) =>
      MedicationInformationsState(
        status: status ?? this.status,
        informations: informations ?? this.informations,
      );

  @override
  List<Object> get props => [
        status,
        informations,
      ];
}
