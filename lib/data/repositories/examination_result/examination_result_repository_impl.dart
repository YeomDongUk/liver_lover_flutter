// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/examination_result/examination_result_local_data_source.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';

class ExaminationResultRepositoryImpl implements ExaminationResultRepository {
  const ExaminationResultRepositoryImpl({
    required this.userId,
    required this.examiationResultLocalDataSource,
  });

  final UserId userId;
  final ExaminationResultLocalDataSource examiationResultLocalDataSource;

  @override
  Future<Either<Failure, List<ExaminationResult>>> getExaminationResults({
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    try {
      final histories =
          await examiationResultLocalDataSource.getExaminationResults(
        userId: userId.value,
        startAt: startAt,
        endAt: endAt,
      );

      return Right(
        histories
            .map(
              (e) => ExaminationResult.fromJson(
                e.toJson(),
              ),
            )
            .toList(),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, ExaminationResult>> upsertExaminationResult({
    required ExaminationResultsCompanion companion,
  }) async {
    try {
      final history =
          await examiationResultLocalDataSource.upsertExaminationResult(
        userId: userId.value,
        companion: companion.copyWith(
          userId: Value(userId.value),
        ),
      );

      return Right(
        ExaminationResult.fromJson(
          history.toJson(),
        ),
      );
    } catch (e) {
      print(e);
      return const Left(QueryFailure());
    }
  }
}
