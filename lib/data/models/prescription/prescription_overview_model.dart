// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

@immutable
class PrescriptionOverviewModel extends PrescriptionModel {
  PrescriptionOverviewModel({
    required super.id,
    required super.userId,
    required super.doctorName,
    required super.prescribedAt,
    required super.medicationStartAt,
    required super.medicationEndAt,
    required super.push,
    required super.beforePush,
    required super.afterPush,
    required super.createdAt,
    required super.updatedAt,
    required this.medicationInformations,
  });

  final List<MedicationInformationModel> medicationInformations;

  @override
  int get hashCode => Object.hash(
        userId,
        id,
        createdAt,
        updatedAt,
        doctorName,
        prescribedAt,
        medicationStartAt,
        medicationEndAt,
        push,
        beforePush,
        afterPush,
        medicationInformations,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionOverviewModel &&
          other.userId == userId &&
          other.id == id &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.doctorName == doctorName &&
          other.prescribedAt == prescribedAt &&
          other.medicationStartAt == medicationStartAt &&
          other.medicationEndAt == medicationEndAt &&
          other.push == push &&
          other.beforePush == beforePush &&
          other.afterPush == afterPush &&
          other.medicationInformations == medicationInformations);

  @override
  String toString() => (StringBuffer('$this(')
        ..write('userId: $userId, ')
        ..write('id: $id, ')
        ..write('createdAt: $createdAt, ')
        ..write('updatedAt: $updatedAt, ')
        ..write('doctorName: $doctorName, ')
        ..write('prescribedAt: $prescribedAt, ')
        ..write('medicationStartAt: $medicationStartAt, ')
        ..write('medicationEndAt: $medicationEndAt, ')
        ..write('push: $push, ')
        ..write('beforePush: $beforePush, ')
        ..write('afterPush: $afterPush, ')
        ..write('medicationInformations: $medicationInformations')
        ..write(')'))
      .toString();
}
