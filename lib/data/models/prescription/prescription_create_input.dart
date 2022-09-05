// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';

class PrescriptionCreateInput extends Equatable {
  const PrescriptionCreateInput({
    required this.prescriptedAt,
    required this.doctorName,
    required this.medicationStartAt,
    required this.duration,
    required this.medicationInformationCreateInputs,
  });

  final DateTime prescriptedAt;
  final String doctorName;
  final DateTime medicationStartAt;
  final int duration;

  final List<MedicationInformationCreateInput>
      medicationInformationCreateInputs;

  @override
  List<Object> get props => [
        prescriptedAt,
        doctorName,
        medicationStartAt,
        duration,
        medicationInformationCreateInputs,
      ];
}
