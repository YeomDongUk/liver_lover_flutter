// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/pill/pill.dart';

class MedicationInformation extends Equatable {
  const MedicationInformation({
    required this.id,
    required this.takeCount,
    required this.moringHour,
    required this.afternoonHour,
    required this.eveningHour,
    required this.nightHour,
    required this.createdAt,
    required this.updatedAt,
    required this.beforePush,
    required this.afterPush,
    required this.push,
    required this.medicationSchedules,
    required this.medicationCycle,
    this.pill,
  });

  factory MedicationInformation.fromJson(Map<String, dynamic> json) =>
      MedicationInformation(
        id: json['id'] as int,
        pill: json['pill'] as Pill?,
        takeCount: json['takeCount'] as double,
        moringHour: json['moringHour'] as int?,
        afternoonHour: json['afternoonHour'] as int?,
        eveningHour: json['eveningHour'] as int?,
        nightHour: json['nightHour'] as int?,
        medicationSchedules: (json['medicationSchedules'] ??
            <MedicationSchedule>[]) as List<MedicationSchedule>,
        medicationCycle: json['medicationCycle'] as int,
        beforePush: json['beforePush'] as bool,
        afterPush: json['afterPush'] as bool,
        push: json['push'] as bool,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final int id;
  final Pill? pill;
  final double takeCount;
  final int medicationCycle;

  final int? moringHour;
  final int? afternoonHour;
  final int? eveningHour;
  final int? nightHour;
  final List<MedicationSchedule> medicationSchedules;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;

  /// 30분 후 알림
  final bool push;
  final DateTime createdAt;
  final DateTime updatedAt;

  int get takePerDay =>
      (moringHour == null ? 0 : 1) +
      (afternoonHour == null ? 0 : 1) +
      (eveningHour == null ? 0 : 1) +
      (nightHour == null ? 0 : 1);

  MedicationInformation copyWith({
    Pill? pill,
    List<MedicationSchedule>? medicationSchedules,
  }) =>
      MedicationInformation(
        id: id,
        pill: pill ?? this.pill,
        takeCount: takeCount,
        moringHour: moringHour,
        afternoonHour: afternoonHour,
        eveningHour: eveningHour,
        nightHour: nightHour,
        beforePush: beforePush,
        afterPush: afterPush,
        push: push,
        medicationCycle: medicationCycle,
        medicationSchedules: medicationSchedules ?? this.medicationSchedules,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        pill,
        takeCount,
        medicationCycle,
        moringHour,
        afternoonHour,
        eveningHour,
        nightHour,
        medicationSchedules,
        beforePush,
        afterPush,
        push,
        createdAt,
        updatedAt,
      ];
}
