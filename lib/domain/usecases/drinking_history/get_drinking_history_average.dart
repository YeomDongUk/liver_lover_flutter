// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';

class GetDrinkingHistoryAverage extends UseCase<double, String> {
  const GetDrinkingHistoryAverage({
    required this.drinkingHistoryRepository,
  });

  final DrinkingHistoryRepository drinkingHistoryRepository;

  @override
  Future<Either<Failure, double>> call(String params) =>
      drinkingHistoryRepository.getDrinkingHistoryAverage(id: params);
}
