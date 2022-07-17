import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';

class UpsertDrinkingHistory
    extends UseCase<DrinkingHistory, DrinkingHistoriesCompanion> {
  const UpsertDrinkingHistory({
    required this.drinkingHistoryRepository,
  });

  final DrinkingHistoryRepository drinkingHistoryRepository;

  @override
  Future<Either<Failure, DrinkingHistory>> call(
    DrinkingHistoriesCompanion params,
  ) =>
      drinkingHistoryRepository.upsertDrinkingHistory(companion: params);
}
