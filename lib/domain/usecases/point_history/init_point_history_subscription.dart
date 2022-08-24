// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/point_history/point_history_repository.dart';

class InitPointHistorySubscription extends UseCase<void, void> {
  const InitPointHistorySubscription({required this.pointHistoryRepository});

  final PointHistoryRepository pointHistoryRepository;

  @override
  Future<Either<Failure, void>> call(void params) =>
      pointHistoryRepository.initPointHistorySubscription();
}
