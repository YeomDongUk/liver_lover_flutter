// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

class PrescriptionWriteResponse extends Equatable {
  const PrescriptionWriteResponse({
    required this.prescriptionModel,
    required this.medicationInformationModels,
    required this.medicationScheduleModels,
  });

  final PrescriptionModel prescriptionModel;
  final List<MedicationInformationModel> medicationInformationModels;
  final List<MedicationScheduleModel> medicationScheduleModels;

  PrescriptionWriteResponse copyWith({
    PrescriptionModel? prescriptionModel,
    List<MedicationInformationModel>? medicationInformationModels,
    List<MedicationScheduleModel>? medicationScheduleModels,
  }) =>
      PrescriptionWriteResponse(
        prescriptionModel: prescriptionModel ?? this.prescriptionModel,
        medicationInformationModels:
            medicationInformationModels ?? this.medicationInformationModels,
        medicationScheduleModels:
            medicationScheduleModels ?? this.medicationScheduleModels,
      );

  @override
  List<Object> get props => [
        prescriptionModel,
        medicationInformationModels,
        medicationScheduleModels,
      ];
}
