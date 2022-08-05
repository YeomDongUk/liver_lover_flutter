// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';

abstract class HealthQuestionRepository {
  Future<Either<Failure, List<HealthQuestion>>> getHealthQuestions();
  Future<Either<Failure, HealthQuestion>> writeHealthQuestion({
    required HealthQuestionsCompanion companion,
  });
  Future<Either<Failure, HealthQuestion>> updateHealthQuestion({
    required HealthQuestionsCompanion companion,
  });
  Future<Either<Failure, void>> deleteHealthQuestion({
    required String id,
  });
}
