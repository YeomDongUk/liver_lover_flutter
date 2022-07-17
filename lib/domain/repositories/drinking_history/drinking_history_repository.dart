import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/models/drinking_history/drinking_history_avergage.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';

abstract class DrinkingHistoryRepository {
  Future<Either<Failure, List<DrinkingHistory>>> getDrinkingHistories({
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<Either<Failure, DrinkingHistory>> upsertDrinkingHistory({
    required DrinkingHistoriesCompanion companion,
  });

  Future<Either<Failure, double>> getDrinkingHistoryAverage({
    required String id,
  });
}
