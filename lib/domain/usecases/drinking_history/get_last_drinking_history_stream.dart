// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';

class GetLastDrinkingHistoryStream
    extends UseCase<Stream<DrinkingHistory?>, void> {
  const GetLastDrinkingHistoryStream({
    required this.drinkingHistoryRepository,
  });

  final DrinkingHistoryRepository drinkingHistoryRepository;
  @override
  Future<Either<Failure, Stream<DrinkingHistory?>>> call(void params) async =>
      drinkingHistoryRepository.getLastDrinkingHistoryStream();
}
