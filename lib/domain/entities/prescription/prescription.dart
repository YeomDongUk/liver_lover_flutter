// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_information/medication_information.dart';

class Prescription extends Equatable {
  const Prescription({
    required this.id,
    required this.doctorName,
    required this.prescriptedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.medicationStartAt,
    required this.duration,
    this.medicationInformations,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json['id'] as String,
        doctorName: json['doctorName'] as String,
        medicationInformations: json['medicationInformations'] == null
            ? null
            : json['medicationInformations'] as List<MedicationInformation>,
        prescriptedAt:
            DateTime.fromMillisecondsSinceEpoch(json['prescriptedAt'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
        deletedAt: json['deletedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['deletedAt'] as int),
        duration: json['duration'] as int,
        medicationStartAt: DateTime.fromMillisecondsSinceEpoch(
          json['medicationStartAt'] as int,
        ),
      );

  final String id;
  final String doctorName;
  final List<MedicationInformation>? medicationInformations;
  final DateTime medicationStartAt;
  final int duration;
  final DateTime prescriptedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  bool get isOver =>
      deletedAt != null ||
      DateTime.now().isAfter(
        prescriptedAt.add(Duration(days: duration)),
      );

  @override
  List<Object?> get props => [
        id,
        doctorName,
        prescriptedAt,
        medicationInformations,
        duration,
        medicationStartAt,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
