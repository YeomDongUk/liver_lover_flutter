// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/repositories/excercise_history/excercise_history_repository.dart';

class GetExcerciseHistories
    extends UseCase<List<ExcerciseHistory>, BetweenDateTime> {
  const GetExcerciseHistories({
    required this.excerciseHistoryRepository,
  });

  final ExcerciseHistoryRepository excerciseHistoryRepository;

  @override
  Future<Either<Failure, List<ExcerciseHistory>>> call(
    BetweenDateTime params,
  ) =>
      excerciseHistoryRepository.getExcerciseHistories(
        startAt: params.start,
        endAt: params.end,
      );
}
