// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/repositories/smoking_history/smoking_history_repository.dart';

class GetSmokingHistories
    extends UseCase<List<SmokingHistory>, BetweenDateTime> {
  const GetSmokingHistories({
    required this.smokingHistoryRepository,
  });

  final SmokingHistoryRepository smokingHistoryRepository;

  @override
  Future<Either<Failure, List<SmokingHistory>>> call(BetweenDateTime params) =>
      smokingHistoryRepository.getSmokingHistories(
        startAt: params.start,
        endAt: params.end,
      );
}
