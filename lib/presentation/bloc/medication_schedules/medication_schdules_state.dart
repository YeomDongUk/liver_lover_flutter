part of 'medication_schdules_cubit.dart';

enum MedicationSchedulesStatus {
  initial,
  loadInProgress,
  loadSuccess,
  loadFailure,
}

class MedicationSchedulesState extends Equatable {
  const MedicationSchedulesState({
    this.status = MedicationSchedulesStatus.initial,
    this.medicationSchedules = const [],
    this.medicationSchedulesMap = const {},
  });

  final MedicationSchedulesStatus status;
  final List<MedicationSchedule> medicationSchedules;
  final Map<DateTime, List<MedicationSchedule>> medicationSchedulesMap;

  MedicationSchedulesState copyWith({
    MedicationSchedulesStatus? status,
    List<MedicationSchedule>? medicationSchedules,
  }) {
    final medicationSchedulesMap = <DateTime, List<MedicationSchedule>>{};

    medicationSchedules?.forEach((medicationSchedule) {
      final reservedAt = medicationSchedule.reservedAt;
      if (medicationSchedulesMap.containsKey(reservedAt)) {
        medicationSchedulesMap[reservedAt]!.add(medicationSchedule);
      } else {
        medicationSchedulesMap[reservedAt] = [medicationSchedule];
      }
    });

    return MedicationSchedulesState(
      status: status ?? this.status,
      medicationSchedules: medicationSchedules ?? this.medicationSchedules,
      medicationSchedulesMap: medicationSchedules != null
          ? medicationSchedulesMap
          : this.medicationSchedulesMap,
    );
  }

  @override
  List<Object> get props => [
        status,
        medicationSchedules,
        medicationSchedulesMap,
      ];
}
