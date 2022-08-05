// Package imports:
import 'package:equatable/equatable.dart';

class SF12Question extends Equatable {
  const SF12Question({
    required this.id,
    required this.question,
    required this.options,
    this.items,
  });

  factory SF12Question.fromJson(Map<String, dynamic> json) => SF12Question(
        id: json['id'] as int,
        question: json['question'] as String,
        items: json['items'] as List<String>?,
        options: json['options'] as List<String>,
      );

  final int id;

  /// 질문
  final String question;

  /// 서브 질문
  final List<String>? items;

  /// 선택지
  final List<String> options;

  @override
  List<Object?> get props => [
        id,
        question,
        items,
        options,
      ];
}
