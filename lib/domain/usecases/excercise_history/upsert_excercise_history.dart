// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/repositories/excercise_history/excercise_history_repository.dart';

class UpsertExcerciseHistory
    extends UseCase<ExcerciseHistory, ExcerciseHistoriesCompanion> {
  const UpsertExcerciseHistory({
    required this.smokingHistoryRepository,
  });

  final ExcerciseHistoryRepository smokingHistoryRepository;

  @override
  Future<Either<Failure, ExcerciseHistory>> call(
    ExcerciseHistoriesCompanion params,
  ) =>
      smokingHistoryRepository.upsertExcerciseHistory(companion: params);
}
