import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/user/user_local_data_source.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.userLocalDataSource,
    required this.userId,
  });

  final UserLocalDataSource userLocalDataSource;
  final UserId userId;

  @override
  Future<Either<Failure, User>> createUser(UsersCompanion companion) async {
    try {
      final userModel = await userLocalDataSource.createUser(
        companion.copyWith(
          phone: Value(
            companion.phone.value.replaceAll('-', ''),
          ),
        ),
      );
      return Right(User.fromJson(userModel.toJson()));
    } on SqliteException catch (error) {
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

  @override
  Future<Either<Failure, User>> updateUser(UsersCompanion companion) async {
    try {
      final userModel = await userLocalDataSource.updateUser(
        userId: userId.value,
        companion: companion.copyWith(
          phone: Value(
            companion.phone.value.replaceAll('-', ''),
          ),
        ),
      );
      return Right(User.fromJson(userModel.toJson()));
    } on SqliteException catch (error) {
      return Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePinCode(String pinCode) async {
    try {
      await userLocalDataSource.updatePinCode(
        userId: userId.value,
        pinCode: pinCode,
      );
      return const Right(null);
    } catch (e) {
      return Left(QueryFailure());
    }
  }
}
