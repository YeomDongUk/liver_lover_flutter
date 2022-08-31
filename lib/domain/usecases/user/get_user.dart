// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class GetUser implements UseCase<User, String> {
  GetUser({
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  Future<Either<Failure, User>> call(String params) async {
    final either = await userRepository.getUser(params);

    return either;
  }
}
