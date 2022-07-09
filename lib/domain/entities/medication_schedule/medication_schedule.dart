import 'package:equatable/equatable.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';

class MedicationSchedule extends Equatable {
  const MedicationSchedule({
    required this.id,
    required this.prescriptionId,
    required this.type,
    required this.reservedAt,
    required this.medicatedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicationSchedule.fromJson(Map<String, dynamic> json) =>
      MedicationSchedule(
        id: json['id'] as String,
        prescriptionId: json['prescriptionId'] as String,
        type: MedicationScheduleType.values[json['type'] as int],
        reservedAt:
            DateTime.fromMillisecondsSinceEpoch(json['reservedAt'] as int),
        medicatedAt: json['medicatedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['medicatedAt'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final String prescriptionId;
  final MedicationScheduleType type;
  final DateTime reservedAt;
  final DateTime? medicatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        prescriptionId,
        type,
        reservedAt,
        medicatedAt,
        createdAt,
        updatedAt,
      ];
}
