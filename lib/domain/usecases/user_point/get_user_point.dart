// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user_point.dart';
import 'package:yak/domain/repositories/user_point/user_point_repository.dart';

class GetUserPoint extends UseCase<Stream<UserPoint>, void> {
  const GetUserPoint({
    required this.userPointRepository,
  });

  final UserPointRepository userPointRepository;

  @override
  Future<Either<Failure, Stream<UserPoint>>> call(void params) async =>
      userPointRepository.getUserPoint();
}
