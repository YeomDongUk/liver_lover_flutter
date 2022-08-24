// Package imports:
import 'package:equatable/equatable.dart';

abstract class SurveryQuestion extends Equatable {
  const SurveryQuestion({
    required this.id,
    required this.question,
    required this.options,
  });

  final int id;
  final String question;
  final List<String> options;

  @override
  List<Object?> get props => [
        id,
        question,
        options,
      ];
}
