// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/health_question/health_question_repository.dart';

class DeleteHealthQuestion extends UseCase<void, String> {
  DeleteHealthQuestion({required this.healthQuestionRepository});

  final HealthQuestionRepository healthQuestionRepository;

  @override
  Future<Either<Failure, void>> call(
    String params,
  ) =>
      healthQuestionRepository.deleteHealthQuestion(id: params);
}
