// Package imports:
import 'package:equatable/equatable.dart';

class UserPoint extends Equatable {
  const UserPoint({
    required this.id,
    required this.point,
    required this.hospitalVisitScheduleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPoint.fromJson(Map<String, dynamic> json) => UserPoint(
        id: json['id'] as String,
        point: json['point'] as int,
        hospitalVisitScheduleId: json['hospitalVisitScheduleId'] as String?,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final String? hospitalVisitScheduleId;
  final int point;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get grade {
    if (point <= 209) {
      return 'Bronze';
    } else if (point <= 239) {
      return 'Silver';
    } else if (point <= 269) {
      return 'Gold';
    }

    return 'Diamond';
  }

  @override
  List<Object?> get props => [
        id,
        point,
        hospitalVisitScheduleId,
        createdAt,
        updatedAt,
      ];
}
