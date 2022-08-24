// Project imports:
import 'package:yak/domain/entities/survey/survey_question.dart';

class SF12Question extends SurveryQuestion {
  const SF12Question({
    required super.id,
    required super.question,
    required super.options,
    this.items,
  });

  factory SF12Question.fromJson(Map<String, dynamic> json) => SF12Question(
        id: json['id'] as int,
        question: json['question'] as String,
        items: json['items'] as List<String>?,
        options: json['options'] as List<String>,
      );

  /// 서브 질문
  final List<String>? items;

  @override
  List<Object?> get props => [
        ...super.props,
        items,
      ];
}
