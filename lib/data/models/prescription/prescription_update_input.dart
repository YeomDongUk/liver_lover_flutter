import 'package:equatable/equatable.dart';
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';

class PrescriptionUpdateInput extends Equatable {
  const PrescriptionUpdateInput({
    required this.medicationInformationCreateInputs,
  });

  final List<MedicationInformationCreateInput>
      medicationInformationCreateInputs;
  @override
  List<Object?> get props => throw UnimplementedError();
}
