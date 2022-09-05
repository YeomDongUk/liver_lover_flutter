import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';

class MedicationScheduleGroup extends Equatable {
  const MedicationScheduleGroup({
    required this.reservedAt,
    required this.medicationInformations,
    required this.medicationSchedules,
  });

  final DateTime reservedAt;
  final List<MedicationInformation> medicationInformations;
  final List<MedicationSchedule> medicationSchedules;

  bool get isAllMedicated =>
      medicationSchedules.every((element) => element.medicatedAt != null);

  bool get isAnyMedicated =>
      medicationSchedules.any((element) => element.medicatedAt != null);

  DateTime? get medicatedAt {
    final medicatedAts = medicationSchedules
        .map((e) => e.medicatedAt?.millisecondsSinceEpoch)
        .where((element) => element != null)
        .cast<int>()
        .toList();
    return medicatedAts.isEmpty
        ? null
        : DateTime.fromMillisecondsSinceEpoch(medicatedAts.reduce(max));
  }

  bool get push => medicationSchedules.any(
        (element) => element.afterPush || element.beforePush,
      );

  @override
  List<Object?> get props => [
        reservedAt,
        medicationInformations,
        medicationSchedules,
      ];
}
