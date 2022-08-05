// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/drinking_history/drinking_history_local_data_source.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';

class DrinkingHistoryRepositoryImpl implements DrinkingHistoryRepository {
  const DrinkingHistoryRepositoryImpl({
    required this.userId,
    required this.drinkingHistoryLocalDataSource,
  });

  final UserId userId;
  final DrinkingHistoryLocalDataSource drinkingHistoryLocalDataSource;

  @override
  Future<Either<Failure, List<DrinkingHistory>>> getDrinkingHistories({
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    try {
      final histories =
          await drinkingHistoryLocalDataSource.getDrinkingHistories(
        userId: userId.value,
        startAt: startAt,
        endAt: endAt,
      );

      return Right(
        histories
            .map(
              (e) => DrinkingHistory.fromJson(
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
  Future<Either<Failure, double>> getDrinkingHistoryAverage({
    required String id,
  }) async {
    try {
      final average =
          await drinkingHistoryLocalDataSource.getDrinkingHistoryAverage(
        id: id,
        userId: userId.value,
      );

      return Right(average.average);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, DrinkingHistory>> upsertDrinkingHistory({
    required DrinkingHistoriesCompanion companion,
  }) async {
    try {
      final history =
          await drinkingHistoryLocalDataSource.upsertDrinkingHistory(
        userId: userId.value,
        companion: companion.copyWith(
          userId: Value(userId.value),
        ),
      );

      return Right(
        DrinkingHistory.fromJson(
          history.toJson(),
        ),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
