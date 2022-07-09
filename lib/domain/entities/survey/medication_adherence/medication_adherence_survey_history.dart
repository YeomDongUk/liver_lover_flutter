import 'package:equatable/equatable.dart';

class MedicationAdherenceSurveyHistory extends Equatable {
  const MedicationAdherenceSurveyHistory({
    required this.id,
    required this.hospitalVisitScheduleId,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicationAdherenceSurveyHistory.fromJson(
    Map<String, dynamic> json,
  ) =>
      MedicationAdherenceSurveyHistory(
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

  MedicationAdherenceSurveyHistory copyWith({bool? done}) =>
      MedicationAdherenceSurveyHistory(
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
