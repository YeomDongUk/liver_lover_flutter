import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class GetUser implements UseCase<User, String> {
  GetUser(this.userRepository);

  final UserRepository userRepository;
  @override
  Future<Either<Failure, User>> call(String params) =>
      userRepository.getUser(params);
}
