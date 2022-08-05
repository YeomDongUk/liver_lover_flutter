// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/repositories/health_question/health_question_repository.dart';

class UpdateHealthQuestion
    extends UseCase<HealthQuestion, HealthQuestionsCompanion> {
  UpdateHealthQuestion({required this.healthQuestionRepository});

  final HealthQuestionRepository healthQuestionRepository;

  @override
  Future<Either<Failure, HealthQuestion>> call(
    HealthQuestionsCompanion params,
  ) =>
      healthQuestionRepository.updateHealthQuestion(companion: params);
}
