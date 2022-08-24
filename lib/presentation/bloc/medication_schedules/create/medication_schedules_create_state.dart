part of 'medication_schedules_create_cubit.dart';

class MedicationScheduleCreateState extends Equatable {
  const MedicationScheduleCreateState({
    this.status = FormzStatus.pure,
    this.prescriptedAt = const DateInput.pure(),
    this.doctorName = const Name.pure(),
    this.medicatedAt = const DateInput.pure(),
    this.duration = const PositiveIntInput.pure(),
  });

  final FormzStatus status;
  final DateInput prescriptedAt;
  final Name doctorName;
  final DateInput medicatedAt;
  final PositiveIntInput duration;

  @override
  List<Object> get props => [
        status,
        prescriptedAt,
        doctorName,
        medicatedAt,
        duration,
      ];
}
