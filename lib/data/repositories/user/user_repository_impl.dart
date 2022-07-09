import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/datasources/local/user/user_local_data_source.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.userLocalDataSource);

  final UserLocalDataSource userLocalDataSource;

  @override
  Future<Either<Failure, User>> createUser(UsersCompanion companion) async {
    try {
      final userModel = await userLocalDataSource.createUser(companion);
      return Right(User.fromJson(userModel.toJson()));
    } on SqliteException catch (error) {
      print(error);

      return Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String pinCode) async {
    try {
      final userModel = await userLocalDataSource.getUser(pinCode);
      return Right(User.fromJson(userModel.toJson()));
    } on SqliteException {
      return Left(QueryFailure());
    }
  }
}
