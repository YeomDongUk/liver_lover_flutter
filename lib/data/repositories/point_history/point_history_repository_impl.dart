// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/point_history/point_history_local_data_source.dart';
import 'package:yak/domain/entities/point_history/point_history.dart';
import 'package:yak/domain/repositories/point_history/point_history_repository.dart';

class PointHistoryRepositoryImpl implements PointHistoryRepository {
  const PointHistoryRepositoryImpl({
    required this.pointHistoryLocalDataSource,
    required this.userId,
  });

  final PointHistoryLocalDataSource pointHistoryLocalDataSource;
  final UserId userId;
  @override
  Future<Either<Failure, List<PointHistory>>> getPointHistories({
    required int? cursor,
  }) async {
    try {
      final pointHistoryModels =
          await pointHistoryLocalDataSource.getPointHistories(
        userId: userId.value,
        cursor: cursor,
      );

      return Right(
        pointHistoryModels
            .map((e) => PointHistory.fromJson(e.toJson()))
            .toList(),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, void>> initPointHistorySubscription() async =>
      Right(pointHistoryLocalDataSource.initSubscription(userId: userId.value));
}
