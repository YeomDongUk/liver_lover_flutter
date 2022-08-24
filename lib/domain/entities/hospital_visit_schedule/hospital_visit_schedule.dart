// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/static/color.dart';

enum HospitalVisitScheduleStatus {
  done(color: AppColors.green, text: '진료완료'),
  wating(color: AppColors.orange, text: '진료예약'),
  inProgress(color: AppColors.magenta, text: '진료중');

  const HospitalVisitScheduleStatus({
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
}

class HospitalVisitSchedule extends Equatable {
  const HospitalVisitSchedule({
    required this.id,
    required this.hospitalName,
    required this.medicalSubject,
    required this.doctorName,
    required this.doctorOffice,
    required this.reservedAt,
    required this.visitedAt,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HospitalVisitSchedule.fromJson(Map<String, dynamic> json) {
    return HospitalVisitSchedule(
      id: json['id'] as String,
      hospitalName: json['hospitalName'] as String,
      medicalSubject: json['medicalSubject'] as String,
      doctorName: json['doctorName'] as String,
      doctorOffice: json['doctorOffice'] as String,
      reservedAt:
          DateTime.fromMillisecondsSinceEpoch(json['reservedAt'] as int),
      visitedAt: json['visitedAt'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['visitedAt'] as int),
      push: json['push'] as bool,
      beforePush: json['beforePush'] as bool,
      afterPush: json['afterPush'] as bool,
      type: json['type'] is int
          ? HospitalVisitScheduleType.values[json['type'] as int]
          : json['type'] as HospitalVisitScheduleType,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
    );
  }

  ///아이디
  final String id;

  /// 병원 이름
  final String hospitalName;

  /// 진료 과목
  final String medicalSubject;

  /// 의사 이름
  final String doctorName;

  /// 진료실
  final String doctorOffice;

  /// 방문 예약일
  final DateTime reservedAt;

  /// 방문일
  final DateTime? visitedAt;

  /// 알림
  final bool push;

  /// 1일 전 알림
  final bool beforePush;

  /// 2시간 전 알림
  final bool afterPush;

  /// 타입
  final HospitalVisitScheduleType type;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  HospitalVisitScheduleStatus get status => visitedAt != null
      ? HospitalVisitScheduleStatus.done
      : DateTime.now().isAfter(reservedAt)
          ? HospitalVisitScheduleStatus.inProgress
          : HospitalVisitScheduleStatus.wating;

  HospitalVisitSchedule copyWith({
    String? hospitalName,
    String? medicalSubject,
    String? doctorName,
    String? doctorOffice,
    DateTime? reservedAt,
    DateTime? visitedAt,
    bool? push,
    bool? beforePush,
    bool? afterPush,
    HospitalVisitScheduleType? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      HospitalVisitSchedule(
        id: id,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        doctorOffice: doctorOffice ?? this.doctorOffice,
        reservedAt: reservedAt ?? this.reservedAt,
        visitedAt: visitedAt ?? this.visitedAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        hospitalName,
        medicalSubject,
        doctorName,
        doctorOffice,
        reservedAt,
        visitedAt,
        push,
        beforePush,
        afterPush,
        type,
        createdAt,
        updatedAt,
      ];
}
