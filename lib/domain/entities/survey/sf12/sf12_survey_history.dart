// Package imports:
import 'package:equatable/equatable.dart';

class SF12SurveyHistory extends Equatable {
  const SF12SurveyHistory({
    required this.id,
    required this.hospitalVisitScheduleId,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SF12SurveyHistory.fromJson(
    Map<String, dynamic> json,
  ) =>
      SF12SurveyHistory(
        id: json['id'] as String,
        hospitalVisitScheduleId: json['hospitalVisitScheduleId'] as String,
        done: json['done'] as bool,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final String hospitalVisitScheduleId;
  final bool done;
  final DateTime createdAt;
  final DateTime updatedAt;

  SF12SurveyHistory copyWith({bool? done}) => SF12SurveyHistory(
        id: id,
        hospitalVisitScheduleId: hospitalVisitScheduleId,
        done: done ?? this.done,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        hospitalVisitScheduleId,
        done,
        createdAt,
        updatedAt,
      ];
}
