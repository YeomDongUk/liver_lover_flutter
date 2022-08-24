// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/database/table/point_history/point_history_table.dart';

class PointHistory extends Equatable {
  const PointHistory({
    required this.id,
    required this.forginId,
    required this.event,
    required this.point,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PointHistory.fromJson(Map<String, dynamic> json) => PointHistory(
        id: json['id'] as String,
        forginId: json['forginId'] as String,
        event: json['event'] as PointHistoryEvent,
        point: json['point'] as int,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final String id;

  /// 외래키
  final String forginId;

  /// 이벤트 종류
  final PointHistoryEvent event;

  /// 포인트
  final int point;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        forginId,
        event,
        point,
        createdAt,
        updatedAt,
      ];
}
