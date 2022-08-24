// Package imports:
import 'package:objectbox/objectbox.dart';

// Project imports:

@Entity()
class PrescriptionModel {
  PrescriptionModel({
    this.id = 0,
    required this.userId,
    required this.prescriptedAt,
    required this.doctorName,
    required this.medicationStartAt,
    required this.medicationEndAt,
    required this.duration,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @Id()
  late int id;

  late String userId;

  /// 처방일
  @Property(type: PropertyType.date)
  late DateTime prescriptedAt;

  late String doctorName;

  /// 복약 시작일
  @Property(type: PropertyType.date)
  late DateTime medicationStartAt;

  @Property(type: PropertyType.date)
  late DateTime medicationEndAt;

  late int duration;

  @Property(type: PropertyType.date)
  late DateTime createdAt;

  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  PrescriptionModel copyWith({
    DateTime? updatedAt,
  }) =>
      PrescriptionModel(
        id: id,
        userId: userId,
        prescriptedAt: prescriptedAt,
        doctorName: doctorName,
        medicationStartAt: medicationStartAt,
        medicationEndAt: medicationEndAt,
        duration: duration,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'prescriptedAt': prescriptedAt.millisecondsSinceEpoch,
        'doctorName': doctorName,
        'medicationStartAt': medicationStartAt.millisecondsSinceEpoch,
        'medicationEndAt': medicationEndAt.millisecondsSinceEpoch,
        'duration': duration,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };
}
