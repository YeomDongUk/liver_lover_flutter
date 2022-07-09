import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class UserLocalDataSource {
  Future<UserModel> createUser(UsersCompanion companion);
  Future<UserModel> getUser(String pinCode);
}

class UserLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements UserLocalDataSource {
  UserLocalDataSourceImpl(super.appDatabase);

  $UsersTable get users => attachedDatabase.users;

  @override
  Future<UserModel> createUser(UsersCompanion companion) =>
      into(users).insertReturning(companion);

  @override
  Future<UserModel> getUser(String pinCode) =>
      (select(users)..where((u) => u.pinCode.equals(pinCode))).getSingle();
}
