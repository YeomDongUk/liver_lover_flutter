import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/health_question/health_question_local_data_source.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/repositories/health_question/health_question_repository.dart';

class HealthQuestionRepositoryImpl implements HealthQuestionRepository {
  const HealthQuestionRepositoryImpl({
    required this.healthQuestionLocalDataSource,
    required this.userId,
  });

  final HealthQuestionLocalDataSource healthQuestionLocalDataSource;
  final UserId userId;

  @override
  Future<Either<Failure, List<HealthQuestion>>> getHealthQuestions() async {
    try {
      final healthQuestions =
          await healthQuestionLocalDataSource.getHealthQuestions(
        userId: userId.value,
      );

      return Right(
        healthQuestions
            .map((e) => HealthQuestion.fromJson(e.toJson()))
            .toList(),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, HealthQuestion>> writeHealthQuestion({
    required HealthQuestionsCompanion companion,
  }) async {
    try {
      final healthQuestion =
          await healthQuestionLocalDataSource.upsertHealthQuestions(
        userId: userId.value,
        companion: companion,
      );

      return Right(
        HealthQuestion.fromJson(
          healthQuestion.toJson(),
        ),
      );
    } catch (e) {
      print(e);
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteHealthQuestion({
    required String id,
  }) async {
    try {
      await healthQuestionLocalDataSource.deleteHealthQuestion(
        id: id,
        userId: userId.value,
      );
      return const Right(null);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, HealthQuestion>> updateHealthQuestion({
    required HealthQuestionsCompanion companion,
  }) async {
    try {
      final healthQuestion =
          await healthQuestionLocalDataSource.updateHealthQuestion(
        userId: userId.value,
        companion: companion,
      );

      return Right(
        HealthQuestion.fromJson(
          healthQuestion.toJson(),
        ),
      );
    } catch (e) {
      print(e);
      return const Left(QueryFailure());
    }
  }
}
