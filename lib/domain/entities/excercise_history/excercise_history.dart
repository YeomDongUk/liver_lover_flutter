// Package imports:
import 'package:equatable/equatable.dart';

class ExcerciseHistory extends Equatable {
  const ExcerciseHistory({
    required this.id,
    required this.minuite,
    required this.weight,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExcerciseHistory.fromJson(Map<String, dynamic> json) =>
      ExcerciseHistory(
        id: json['id'] as String,
        minuite: json['minuite'] as int,
        weight: (json['weight'] as int) / 1000,
        date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final int minuite;
  final double weight;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExcerciseHistory copyWith({
    int? minuite,
    double? weight,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ExcerciseHistory(
        id: id,
        date: date,
        minuite: minuite ?? this.minuite,
        weight: weight ?? this.weight,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        minuite,
        weight,
        date,
        createdAt,
        updatedAt,
      ];
}
