// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/hive/hive_data_source.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class AutoLogin implements UseCase<User, void> {
  AutoLogin({
    required this.userRepository,
    required this.hiveDataSource,
  });

  final UserRepository userRepository;
  final HiveDataSource hiveDataSource;

  @override
  Future<Either<Failure, User>> call(void params) {
    final userId = hiveDataSource.getUserId();

    return userId == null
        ? Future(() => const Left(QueryFailure()))
        : userRepository.getUserWithId(userId);
  }
}
