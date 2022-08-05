// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/hive/hive_data_source.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class GetUser implements UseCase<User, String> {
  GetUser({
    required this.userRepository,
    required this.hiveDataSource,
  });

  final UserRepository userRepository;
  final HiveDataSource hiveDataSource;

  @override
  Future<Either<Failure, User>> call(String params) async {
    final either = await userRepository.getUser(params);

    if (either.isRight()) {
      final user = either.foldRight(null, (r, previous) => r);
      if (user != null) {
        await hiveDataSource.setUserId(user.id);
      }
    }

    return either;
  }
}
