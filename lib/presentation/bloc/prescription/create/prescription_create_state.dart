part of 'prescription_create_cubit.dart';

class PrescriptionCrateState extends Equatable {
  const PrescriptionCrateState({
    this.status = FormzStatus.pure,
    this.prescriptedAt = const DateInput.pure(),
    this.doctorName = const DoctorName.pure(),
    this.medicationStartAt = const DateInput.pure(),
    this.duration = const PositiveIntInput.pure(),
    this.medicationInformationCreateFormInput =
        const MedicationInformationCreateFormInput.pure(),
  });

  final FormzStatus status;
  final DateInput prescriptedAt;
  final DoctorName doctorName;
  final DateInput medicationStartAt;
  final PositiveIntInput duration;

  final MedicationInformationCreateFormInput
      medicationInformationCreateFormInput;

  PrescriptionCrateState copyWith({
    FormzStatus? status,
    DateInput? prescriptedAt,
    DoctorName? doctorName,
    DateInput? medicationStartAt,
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
                medicationStartAt ?? this.medicationStartAt,
                duration ?? this.duration,
                medicationInformationCreateFormInput ??
                    this.medicationInformationCreateFormInput,
              ],
            ),
        prescriptedAt: prescriptedAt ?? this.prescriptedAt,
        doctorName: doctorName ?? this.doctorName,
        medicationStartAt: medicationStartAt ?? this.medicationStartAt,
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
        medicationStartAt,
        duration,
        medicationInformationCreateFormInput,
      ];
}
