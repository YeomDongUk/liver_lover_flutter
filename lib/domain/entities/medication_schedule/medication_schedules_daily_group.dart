// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';

class MedicationScheduleDailyGroup extends Equatable {
  const MedicationScheduleDailyGroup({
    required this.dateTime,
    required this.medicationScheduleGroups,
  });

  final DateTime dateTime;
  final List<MedicationScheduleGroup> medicationScheduleGroups;

  MedicationScheduleDailyGroupStatus get medicationScheduleDailyGroupStatus =>
      medicationScheduleGroups.every((element) => element.isAllMedicated)
          ? MedicationScheduleDailyGroupStatus.done
          : medicationScheduleGroups.any((element) => element.isAnyMedicated)
              ? MedicationScheduleDailyGroupStatus.partitial
              : MedicationScheduleDailyGroupStatus.none;

  @override
  List<Object?> get props => [
        dateTime,
        medicationScheduleGroups,
      ];
}

enum MedicationScheduleDailyGroupStatus {
  done(color: AppColors.green, text: '복용완료'),
  partitial(color: AppColors.orange, text: '부분복용'),
  none(color: AppColors.magenta, text: '미복용');

  const MedicationScheduleDailyGroupStatus({
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
}
