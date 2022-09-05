// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/pill/pill.dart';

class MedicationInformation extends Equatable {
  const MedicationInformation({
    required this.id,
    required this.takeCount,
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.createdAt,
    required this.updatedAt,
    required this.beforePush,
    required this.afterPush,
    // required this.medicationSchedules,
    required this.takeCycle,
    this.pill,
  });

  factory MedicationInformation.fromJson(Map<String, dynamic> json) =>
      MedicationInformation(
        id: json['id'] as String,
        pill: json['pill'] as Pill?,
        takeCount: double.tryParse(json['takeCount'] as String) ?? 0,
        timeOne: json['timeOne'] as int?,
        timeTwo: json['timeTwo'] as int?,
        timeThree: json['timeThree'] as int?,
        // medicationSchedules: (json['medicationSchedules'] ??
        //     <MedicationSchedule>[]) as List<MedicationSchedule>,
        takeCycle: json['takeCycle'] as int,
        beforePush: json['beforePush'] as bool,
        afterPush: json['afterPush'] as bool,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final Pill? pill;
  final double takeCount;
  final int takeCycle;

  final int? timeOne;
  final int? timeTwo;
  final int? timeThree;
  // final List<MedicationSchedule> medicationSchedules;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;

  final DateTime createdAt;
  final DateTime updatedAt;

  int get takePerDay =>
      (timeOne == null ? 0 : 1) +
      (timeTwo == null ? 0 : 1) +
      (timeThree == null ? 0 : 1);

  MedicationInformation copyWith({
    Pill? pill,
    // List<MedicationSchedule>? medicationSchedules,
  }) =>
      MedicationInformation(
        id: id,
        pill: pill ?? this.pill,
        takeCount: takeCount,
        timeOne: timeOne,
        timeTwo: timeTwo,
        timeThree: timeThree,
        beforePush: beforePush,
        afterPush: afterPush,
        takeCycle: takeCycle,
        // medicationSchedules: medicationSchedules ?? this.medicationSchedules,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        pill,
        takeCount,
        takeCycle,
        timeOne,
        timeTwo,
        timeThree,
        // medicationSchedules,
        beforePush,
        afterPush,
        createdAt,
        updatedAt,
      ];
}
