// Package imports:
import 'package:equatable/equatable.dart';

class MedicationInformation extends Equatable {
  const MedicationInformation({
    required this.id,
    required this.medicationInformationGroupId,
    required this.pillId,
    required this.dayDuration,
    required this.count,
    required this.moring,
    required this.afternoon,
    required this.evening,
    required this.night,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicationInformation.fromJson(Map<String, dynamic> json) =>
      MedicationInformation(
        id: json['id'] as String,
        medicationInformationGroupId:
            json['medicationInformationGroupId'] as String,
        pillId: json['pillId'] as String,
        dayDuration: json['dayDuration'] as int,
        count: json['count'] as int,
        moring: json['moring'] as int?,
        afternoon: json['afternoon'] as int?,
        evening: json['evening'] as int?,
        night: json['night'] as int?,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final String medicationInformationGroupId;
  final String pillId;
  final int dayDuration;
  final int count;
  final int? moring;
  final int? afternoon;
  final int? evening;
  final int? night;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        medicationInformationGroupId,
        pillId,
        dayDuration,
        count,
        moring,
        afternoon,
        evening,
        night,
        createdAt,
        updatedAt,
      ];
}
