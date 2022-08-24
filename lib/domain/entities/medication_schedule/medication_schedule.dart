// Package imports:
import 'package:equatable/equatable.dart';

class MedicationSchedule extends Equatable {
  const MedicationSchedule({
    required this.id,
    required this.medicationInformationId,
    required this.reservedAt,
    required this.medicatedAt,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicationSchedule.fromJson(Map<String, dynamic> json) =>
      MedicationSchedule(
        id: json['id'] as int,
        medicationInformationId: json['medicationInformationId'] as int,
        reservedAt:
            DateTime.fromMillisecondsSinceEpoch(json['reservedAt'] as int),
        medicatedAt: json['medicatedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['medicatedAt'] as int),
        push: json['push'] as bool? ?? false,
        beforePush: json['beforePush'] as bool? ?? false,
        afterPush: json['afterPush'] as bool? ?? false,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final int id;

  /// 복용 정보 아이디
  final int medicationInformationId;

  /// 알림 발송 예약일
  final DateTime reservedAt;

  /// 복용일
  final DateTime? medicatedAt;

  /// 알림
  final bool push;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  MedicationSchedule copyWith({
    DateTime? medicatedAt,
    DateTime? updatedAt,
  }) =>
      MedicationSchedule(
        id: id,
        medicationInformationId: medicationInformationId,
        reservedAt: reservedAt,
        push: push,
        beforePush: beforePush,
        afterPush: afterPush,
        createdAt: createdAt,
        medicatedAt: medicatedAt ?? this.medicatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'medicationInformationId': medicationInformationId,
        'push': push,
        'beforePush': beforePush,
        'afterPush': afterPush,
        'reservedAt': reservedAt.millisecondsSinceEpoch,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'medicatedAt': medicatedAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };

  @override
  List<Object?> get props => [
        id,
        medicationInformationId,
        reservedAt,
        push,
        beforePush,
        afterPush,
        medicatedAt,
        createdAt,
        updatedAt,
      ];
}
