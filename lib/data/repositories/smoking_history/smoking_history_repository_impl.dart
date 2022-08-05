// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/smoking_history/smoking_history_local_data_source.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/repositories/smoking_history/smoking_history_repository.dart';

class SmokingHistoryRepositoryImpl implements SmokingHistoryRepository {
  const SmokingHistoryRepositoryImpl({
    required this.userId,
    required this.smokingHistoryLocalDataSource,
  });

  final UserId userId;
  final SmokingHistoryLocalDataSource smokingHistoryLocalDataSource;

  @override
  Future<Either<Failure, List<SmokingHistory>>> getSmokingHistories({
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    try {
      final histories = await smokingHistoryLocalDataSource.getSmokingHistories(
        userId: userId.value,
        startAt: startAt,
        endAt: endAt,
      );

      return Right(
        histories
            .map(
              (e) => SmokingHistory.fromJson(
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
  Future<Either<Failure, double>> getSmokingHistoryAverage({
    required String id,
  }) async {
    try {
      final average =
          await smokingHistoryLocalDataSource.getSmokingHistoryAverage(
        id: id,
        userId: userId.value,
      );

      return Right(average.average);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, SmokingHistory>> upsertSmokingHistory({
    required SmokingHistoriesCompanion companion,
  }) async {
    try {
      final history = await smokingHistoryLocalDataSource.upsertSmokingHistory(
        userId: userId.value,
        companion: companion.copyWith(
          userId: Value(userId.value),
        ),
      );

      return Right(
        SmokingHistory.fromJson(
          history.toJson(),
        ),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
