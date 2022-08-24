part of 'prescription_create_cubit.dart';

class PrescriptionCrateState extends Equatable {
  const PrescriptionCrateState({
    this.status = FormzStatus.pure,
    this.prescriptedAt = const DateInput.pure(),
    this.doctorName = const Name.pure(),
    this.medicatedAt = const DateInput.pure(),
    this.duration = const PositiveIntInput.pure(),
    this.medicationInformationCreateFormInput =
        const MedicationInformationCreateFormInput.pure(),
  });

  final FormzStatus status;
  final DateInput prescriptedAt;
  final Name doctorName;
  final DateInput medicatedAt;
  final PositiveIntInput duration;

  final MedicationInformationCreateFormInput
      medicationInformationCreateFormInput;

  PrescriptionCrateState copyWith({
    FormzStatus? status,
    DateInput? prescriptedAt,
    Name? doctorName,
    DateInput? medicatedAt,
    PositiveIntInput? duration,
    MedicationInformationCreateFormInput? medicationInformationCreateFormInput,
    BeforePush? beforePush,
    AfterPush? afterPush,
    Push? push,
  }) =>
      PrescriptionCrateState(
        status: status ??
            Formz.validate(
              [
                prescriptedAt ?? this.prescriptedAt,
                doctorName ?? this.doctorName,
                medicatedAt ?? this.medicatedAt,
                duration ?? this.duration,
                medicationInformationCreateFormInput ??
                    this.medicationInformationCreateFormInput,
              ],
            ),
        prescriptedAt: prescriptedAt ?? this.prescriptedAt,
        doctorName: doctorName ?? this.doctorName,
        medicatedAt: medicatedAt ?? this.medicatedAt,
        duration: duration ?? this.duration,
        medicationInformationCreateFormInput:
            medicationInformationCreateFormInput ??
                this.medicationInformationCreateFormInput,
      );

  @override
  List<Object> get props => [
        status,
        prescriptedAt,
        doctorName,
        medicatedAt,
        duration,
        medicationInformationCreateFormInput,
      ];
}
