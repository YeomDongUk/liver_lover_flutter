// Package imports:
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
// ignore: must_be_immutable
class MedicationScheduleModel extends Equatable {
  MedicationScheduleModel({
    this.id = 0,
    required this.userId,
    required this.prescriptionId,
    required this.medicationInformationId,
    required this.reservedAt,
    required this.beforePush,
    required this.afterPush,
    required this.push,
    this.medicatedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }

  late int id;

  /// 유저 ID
  late String userId;

  /// 처방전 ID
  late int prescriptionId;

  /// 복용 정보 ID
  late int medicationInformationId;

  /// 복용 예정일
  @Property(type: PropertyType.date)
  late DateTime reservedAt;

  /// 30분 전 알림
  late bool beforePush;

  /// 30분 후 알림
  late bool afterPush;

  /// 30분 후 알림
  late bool push;

  /// 섭취일
  @Property(type: PropertyType.date)
  late DateTime? medicatedAt;

  @Property(type: PropertyType.date)
  late DateTime createdAt;

  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  MedicationScheduleModel coypWith({
    DateTime? reservedAt,
    DateTime? medicatedAt,
    bool? push,
    bool? beforePush,
    bool? afterPush,
  }) =>
      MedicationScheduleModel(
        id: id,
        userId: userId,
        prescriptionId: prescriptionId,
        medicationInformationId: medicationInformationId,
        reservedAt: reservedAt ?? this.reservedAt,
        medicatedAt: medicatedAt ?? this.medicatedAt,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
        push: push ?? this.push,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'prescriptionId': prescriptionId,
        'medicationInformationId': medicationInformationId,
        'reservedAt': reservedAt.millisecondsSinceEpoch,
        'medicatedAt': medicatedAt?.millisecondsSinceEpoch,
        'beforePush': beforePush,
        'afterPush': afterPush,
        'push': push,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        prescriptionId,
        medicationInformationId,
        reservedAt,
        beforePush,
        afterPush,
        push,
        medicatedAt,
        createdAt,
        updatedAt,
      ];
}
