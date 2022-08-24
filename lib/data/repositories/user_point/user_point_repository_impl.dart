// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/user_point/user_point_local_data_source.dart';
import 'package:yak/domain/entities/user/user_point.dart';
import 'package:yak/domain/repositories/user_point/user_point_repository.dart';

class UserPointRepositoryImpl implements UserPointRepository {
  const UserPointRepositoryImpl({
    required this.userId,
    required this.userPointLocalDataSource,
  });

  final UserId userId;
  final UserPointLocalDataSource userPointLocalDataSource;

  @override
  Either<Failure, Stream<UserPoint>> getUserPoint() {
    final userPointModelStream =
        userPointLocalDataSource.getUserPoint(userId.value);

    return Right(
      userPointModelStream.map<UserPoint>(
        (userPointModel) => UserPoint.fromJson(
          userPointModel.toJson(),
        ),
      ),
    );
  }
}
