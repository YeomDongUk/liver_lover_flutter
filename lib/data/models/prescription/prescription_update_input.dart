// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';

class PrescriptionUpdateInput extends Equatable {
  const PrescriptionUpdateInput({
    required this.prescriptionId,
    required this.medicationInformationUpdateInputs,
  });

  final String prescriptionId;

  final List<MedicationInformationUpdateInput>
      medicationInformationUpdateInputs;
  @override
  List<Object?> get props => [
        prescriptionId,
        medicationInformationUpdateInputs,
      ];
}
