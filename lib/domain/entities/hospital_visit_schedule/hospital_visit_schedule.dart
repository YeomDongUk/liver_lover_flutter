import 'package:equatable/equatable.dart';

enum HospitalVisitScheduleStatus {
  none,
  inProgress,
  done,
}

class HospitalVisitSchedule extends Equatable {
  const HospitalVisitSchedule({
    required this.id,
    required this.hospitalName,
    required this.medicalSubject,
    required this.doctorName,
    required this.reservedAt,
    required this.visitedAt,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HospitalVisitSchedule.fromJson(Map<String, dynamic> json) =>
      HospitalVisitSchedule(
        id: json['id'] as String,
        hospitalName: json['hospitalName'] as String,
        medicalSubject: json['medicalSubject'] as String,
        doctorName: json['doctorName'] as String,
        reservedAt:
            DateTime.fromMillisecondsSinceEpoch(json['reservedAt'] as int),
        visitedAt: json['visitedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['visitedAt'] as int),
        push: json['push'] as bool,
        beforePush: json['beforePush'] as bool,
        afterPush: json['afterPush'] as bool,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  ///아이디
  final String id;

  /// 병원 이름
  final String hospitalName;

  /// 진료 과목
  final String medicalSubject;

  /// 의사 이름
  final String doctorName;

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

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  HospitalVisitScheduleStatus get status => visitedAt != null
      ? HospitalVisitScheduleStatus.done
      : DateTime.now().isAfter(reservedAt)
          ? HospitalVisitScheduleStatus.inProgress
          : HospitalVisitScheduleStatus.none;

  HospitalVisitSchedule copyWith({
    String? hospitalName,
    String? medicalSubject,
    String? doctorName,
    DateTime? reservedAt,
    DateTime? visitedAt,
    bool? push,
    bool? beforePush,
    bool? afterPush,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      HospitalVisitSchedule(
        id: id,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        reservedAt: reservedAt ?? this.reservedAt,
        visitedAt: visitedAt ?? this.visitedAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        hospitalName,
        medicalSubject,
        doctorName,
        reservedAt,
        visitedAt,
        push,
        beforePush,
        afterPush,
        createdAt,
        updatedAt,
      ];
}
