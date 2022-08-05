// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';

abstract class ExcerciseHistoryRepository {
  Future<Either<Failure, List<ExcerciseHistory>>> getExcerciseHistories({
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<Either<Failure, ExcerciseHistory>> upsertExcerciseHistory({
    required ExcerciseHistoriesCompanion companion,
  });

  Future<Either<Failure, double>> getExcerciseHistoryAverage({
    required String id,
  });
}
