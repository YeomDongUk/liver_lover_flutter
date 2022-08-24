// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';

abstract class SmokingHistoryRepository {
  Future<Either<Failure, List<SmokingHistory>>> getSmokingHistories({
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<Either<Failure, SmokingHistory>> upsertSmokingHistory({
    required SmokingHistoriesCompanion companion,
  });

  Future<Either<Failure, double>> getSmokingHistoryAverage({
    required String id,
  });

  Either<Failure, Stream<SmokingHistory?>> getLastSmokingHistoryStream();
}
