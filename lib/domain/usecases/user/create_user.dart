// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class CreateUser implements UseCase<User, UsersCompanion> {
  CreateUser({
    required this.userRepository,
  });

  final UserRepository userRepository;
  @override
  Future<Either<Failure, User>> call(UsersCompanion params) async {
    final either = await userRepository.createUser(params);

    if (either.isRight()) {
      final user = either.foldRight(null, (r, previous) => r);
      if (user != null) {
        // await hiveDataSource.setUserId(user.id);
      }
    }
    return either;
  }
}
