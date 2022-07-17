import 'package:equatable/equatable.dart';

class DrinkingHistory extends Equatable {
  const DrinkingHistory({
    required this.id,
    required this.amount,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DrinkingHistory.fromJson(Map<String, dynamic> json) =>
      DrinkingHistory(
        id: json['id'] as String,
        amount: json['amount'] as int,
        date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  final String id;
  final int amount;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  DrinkingHistory copyWith({
    int? amount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DrinkingHistory(
        id: id,
        date: date,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        amount,
        date,
        createdAt,
        updatedAt,
      ];
}
