// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class UpdatePinCode extends UseCase<void, String> {
  const UpdatePinCode({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<Either<Failure, void>> call(String params) =>
      userRepository.updatePinCode(params);
}
