import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';

class PrescriptionOverview extends Equatable {
  const PrescriptionOverview({
    required this.id,
    required this.doctorName,
    required this.prescribedAt,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.medicationInformations,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String doctorName;
  final DateTime prescribedAt;
  final bool push;
  final bool beforePush;
  final bool afterPush;
  final List<MedicationInformation> medicationInformations;
  final DateTime createdAt;
  final DateTime updatedAt;

  PrescriptionOverview copyWith({
    bool? push,
    bool? beforePush,
    bool? afterPush,
    List<MedicationInformation>? medicationInformations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PrescriptionOverview(
        id: id,
        doctorName: doctorName,
        prescribedAt: prescribedAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
        medicationInformations:
            medicationInformations ?? this.medicationInformations,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        doctorName,
        prescribedAt,
        push,
        beforePush,
        afterPush,
        medicationInformations,
        updatedAt,
        createdAt,
      ];
}
