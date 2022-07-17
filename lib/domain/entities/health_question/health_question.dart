import 'package:equatable/equatable.dart';

class HealthQuestion extends Equatable {
  const HealthQuestion({
    required this.id,
    required this.qusetion,
    required this.answer,
    required this.doctorName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HealthQuestion.fromJson(Map<String, dynamic> json) => HealthQuestion(
        id: json['id'] as String,
        qusetion: json['qusetion'] as String,
        answer: json['answer'] as String?,
        doctorName: json['doctorName'] as String?,
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          json['createdAt'] as int,
        ),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
          json['updatedAt'] as int,
        ),
      );

  HealthQuestion copyWith({
    String? id,
    String? qusetion,
    String? answer,
    String? doctorName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      HealthQuestion(
        id: id ?? this.id,
        qusetion: qusetion ?? this.qusetion,
        answer: answer ?? this.answer,
        doctorName: doctorName ?? this.doctorName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  final String id;
  final String qusetion;
  final String? answer;
  final String? doctorName;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        qusetion,
        answer,
        doctorName,
        createdAt,
        updatedAt,
      ];
}
