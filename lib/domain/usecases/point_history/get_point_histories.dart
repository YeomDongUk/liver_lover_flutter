// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/point_history/point_history.dart';
import 'package:yak/domain/repositories/point_history/point_history_repository.dart';

class GetPointHistories extends UseCase<List<PointHistory>, int?> {
  const GetPointHistories({required this.pointHistoryRepository});

  final PointHistoryRepository pointHistoryRepository;

  @override
  Future<Either<Failure, List<PointHistory>>> call(int? cursor) =>
      pointHistoryRepository.getPointHistories(cursor: cursor);
}
