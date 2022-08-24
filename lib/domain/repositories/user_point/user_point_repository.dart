// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/user/user_point.dart';

abstract class UserPointRepository {
  Either<Failure, Stream<UserPoint>> getUserPoint();
}
