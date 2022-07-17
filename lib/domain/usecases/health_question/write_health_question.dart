import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/repositories/health_question/health_question_repository.dart';

class WriteHealthQuestion
    extends UseCase<HealthQuestion, HealthQuestionsCompanion> {
  WriteHealthQuestion({required this.healthQuestionRepository});

  final HealthQuestionRepository healthQuestionRepository;

  @override
  Future<Either<Failure, HealthQuestion>> call(
    HealthQuestionsCompanion params,
  ) =>
      healthQuestionRepository.writeHealthQuestion(companion: params);
}
