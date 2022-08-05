// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/excercise_history/excercise_history_repository.dart';

class GetExcerciseHistoryAverage extends UseCase<double, String> {
  const GetExcerciseHistoryAverage({
    required this.smokingHistoryRepository,
  });

  final ExcerciseHistoryRepository smokingHistoryRepository;

  @override
  Future<Either<Failure, double>> call(String params) =>
      smokingHistoryRepository.getExcerciseHistoryAverage(id: params);
}
