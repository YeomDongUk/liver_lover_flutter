// Package imports:
import 'package:objectbox/objectbox.dart';

@Entity()
class MedicationInformationModel {
  MedicationInformationModel({
    this.id = 0,
    required this.prescriptionId,
    required this.pillId,
    required this.takeCount,
    required this.morningHour,
    required this.afternoonHour,
    required this.eveningHour,
    required this.nightHour,
    required this.medicationCycle,
    required this.beforePush,
    required this.afterPush,
    required this.push,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }

  late int id;
  late int prescriptionId;
  late String pillId;
  late double takeCount;
  late int? morningHour;
  late int? afternoonHour;
  late int? eveningHour;
  late int? nightHour;

  /// 30분 전 알림
  late bool beforePush;

  /// 30분 후 알림
  late bool afterPush;

  /// 30분 후 알림
  late bool push;

  late int medicationCycle;

  @Property(type: PropertyType.date)
  late DateTime createdAt;

  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  MedicationInformationModel copyWith({
    bool? beforePush,
    bool? afterPush,
    bool? push,
  }) =>
      MedicationInformationModel(
        id: id,
        prescriptionId: prescriptionId,
        pillId: pillId,
        takeCount: takeCount,
        morningHour: morningHour,
        afternoonHour: afternoonHour,
        eveningHour: eveningHour,
        nightHour: nightHour,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
        push: push ?? this.push,
        medicationCycle: medicationCycle,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'prescriptionId': prescriptionId,
        'pillId': pillId,
        'takeCount': takeCount,
        'moringHour': morningHour,
        'afternoonHour': afternoonHour,
        'eveningHour': eveningHour,
        'nightHour': nightHour,
        'medicationCycle': medicationCycle,
        'beforePush': beforePush,
        'afterPush': afterPush,
        'push': push,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };
}
