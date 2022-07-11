import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String pinCode);
  Future<Either<Failure, User>> createUser(UsersCompanion companion);
  Future<Either<Failure, User>> updateUser(UsersCompanion companion);
  Future<Either<Failure, void>> updatePinCode(String pinCode);
  // Future<Either<Failure, User>> updateUser(UsersCompanion user);
}
