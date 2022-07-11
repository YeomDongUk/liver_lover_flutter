import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class UpdateUser extends UseCase<User, UsersCompanion> {
  UpdateUser(this.userRepository);

  final UserRepository userRepository;
  @override
  Future<Either<Failure, User>> call(UsersCompanion params) =>
      userRepository.updateUser(params);
}
