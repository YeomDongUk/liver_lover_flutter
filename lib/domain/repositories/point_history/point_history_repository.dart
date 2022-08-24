// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/point_history/point_history.dart';

abstract class PointHistoryRepository {
  Future<Either<Failure, List<PointHistory>>> getPointHistories({
    required int? cursor,
  });

  Future<Either<Failure, void>> initPointHistorySubscription();
}
