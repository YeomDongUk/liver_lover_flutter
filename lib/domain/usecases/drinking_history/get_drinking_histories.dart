// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';

class GetDrinkingHistories
    extends UseCase<List<DrinkingHistory>, BetweenDateTime> {
  const GetDrinkingHistories({
    required this.drinkingHistoryRepository,
  });

  final DrinkingHistoryRepository drinkingHistoryRepository;

  @override
  Future<Either<Failure, List<DrinkingHistory>>> call(BetweenDateTime params) =>
      drinkingHistoryRepository.getDrinkingHistories(
        startAt: params.start,
        endAt: params.end,
      );
}
