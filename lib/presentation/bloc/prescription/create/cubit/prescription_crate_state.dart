part of 'prescription_crate_cubit.dart';

class PrescriptionCrateState extends Equatable {
  const PrescriptionCrateState({
    this.status = FormzStatus.pure,
    required this.prescriptedAt,
    required this.medicatedAt,
    this.doctorName = const Name.pure(),
    this.dayDuration = const DayDuration.pure(),
  });

  final FormzStatus status;
  final PrescriptedAt prescriptedAt;
  final Name doctorName;
  final MedicatedAt medicatedAt;
  final DayDuration dayDuration;

  @override
  List<Object> get props => [
        status,
        prescriptedAt,
        doctorName,
        medicatedAt,
        dayDuration,
      ];
}
