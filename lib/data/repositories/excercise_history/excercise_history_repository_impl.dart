// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/excercise_history/excercise_history_local_data_source.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/repositories/excercise_history/excercise_history_repository.dart';

class ExcerciseHistoryRepositoryImpl implements ExcerciseHistoryRepository {
  const ExcerciseHistoryRepositoryImpl({
    required this.userId,
    required this.excerciseHistoryLocalDataSource,
  });

  final UserId userId;
  final ExcerciseHistoryLocalDataSource excerciseHistoryLocalDataSource;

  @override
  Future<Either<Failure, List<ExcerciseHistory>>> getExcerciseHistories({
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    try {
      final histories =
          await excerciseHistoryLocalDataSource.getExcerciseHistories(
        userId: userId.value,
        startAt: startAt,
        endAt: endAt,
      );

      return Right(
        histories
            .map(
              (e) => ExcerciseHistory.fromJson(
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
  Future<Either<Failure, double>> getExcerciseHistoryAverage({
    required String id,
  }) async {
    try {
      final average =
          await excerciseHistoryLocalDataSource.getExcerciseHistoryAverage(
        id: id,
        userId: userId.value,
      );

      return Right(average.average);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, ExcerciseHistory>> upsertExcerciseHistory({
    required ExcerciseHistoriesCompanion companion,
  }) async {
    try {
      final history =
          await excerciseHistoryLocalDataSource.upsertExcerciseHistory(
        userId: userId.value,
        companion: companion.copyWith(
          userId: Value(userId.value),
        ),
      );

      return Right(
        ExcerciseHistory.fromJson(
          history.toJson(),
        ),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
