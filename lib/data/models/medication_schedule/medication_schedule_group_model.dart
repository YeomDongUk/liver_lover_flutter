// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

class MedicationScheduleGroupModel extends Equatable {
  const MedicationScheduleGroupModel({
    required this.reservedAt,
    required this.pillModels,
    required this.medicationInformationModels,
    required this.medicationScheduleModels,
  });

  final DateTime reservedAt;
  final List<MedicationInformationModel> medicationInformationModels;
  final List<PillModel> pillModels;
  final List<MedicationScheduleModel> medicationScheduleModels;

  @override
  List<Object?> get props => [
        reservedAt,
        pillModels,
        medicationInformationModels,
        medicationScheduleModels,
      ];
}
