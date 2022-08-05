// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/smoking_history/smoking_history_repository.dart';

class GetSmokingHistoryAverage extends UseCase<double, String> {
  const GetSmokingHistoryAverage({
    required this.smokingHistoryRepository,
  });

  final SmokingHistoryRepository smokingHistoryRepository;

  @override
  Future<Either<Failure, double>> call(String params) =>
      smokingHistoryRepository.getSmokingHistoryAverage(id: params);
}
