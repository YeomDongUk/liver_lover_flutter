// Package imports:
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:yak/domain/entities/medication_information/medication_information.dart';

// Project imports:

// enum MedicationSchedulesGroupStatus {
//   medicated,
//   medicatedAll,
//   none,
// }

class MedicationSchedulesGroup extends Equatable {
  const MedicationSchedulesGroup({
    required this.reservedAt,
    required this.medicationInformations,
    required this.push,
  });

  /// 복용 예정일
  final DateTime reservedAt;

  /// 복약정보 요약 리스트
  final List<MedicationInformation> medicationInformations;

  /// 알림 사용
  final bool push;

  MedicationSchedulesGroup copyWith({
    List<MedicationInformation>? medicationInformations,
    DateTime? medicatedAt,
    bool? push,
  }) =>
      MedicationSchedulesGroup(
        reservedAt: reservedAt,
        medicationInformations:
            medicationInformations ?? this.medicationInformations,
        push: push ?? this.push,
      );

  bool get isAllMedicated => medicationInformations.every(
        (element) => element.medicationSchedules.first.medicatedAt != null,
      );

  bool get isAnyMedicated => medicationInformations.every(
        (element) => element.medicationSchedules.first.medicatedAt != null,
      );

  bool get isNotMedicated => medicationInformations.every(
        (element) => element.medicationSchedules.first.medicatedAt != null,
      );

  DateTime? get medicatedAt {
    final medicationSchedules = medicationInformations
        .where((e) => e.medicationSchedules.first.medicatedAt != null)
        .map((e) => e.medicationSchedules.first.medicatedAt)
        .toList()
      ..sort((prev, next) => next!.compareTo(prev!));

    return medicationSchedules.firstOrNull;
  }

  @override
  List<Object?> get props => [
        reservedAt,
        medicationInformations,
        push,
      ];
}