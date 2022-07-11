import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class UserLocalDataSource {
  Future<UserModel> createUser(UsersCompanion companion);
  Future<UserModel> getUser(String pinCode);
  Future<UserModel> updateUser({
    required String userId,
    required UsersCompanion companion,
  });

  Future<void> updatePinCode({
    required String userId,
    required String pinCode,
  });
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

  @override
  Future<UserModel> updateUser({
    required String userId,
    required UsersCompanion companion,
  }) async {
    await (update(users)..where((u) => u.id.equals(userId))).write(
      companion.copyWith(id: Value(userId)),
    );

    return (select(users)..where((u) => u.id.equals(userId))).getSingle();
  }

  @override
  Future<void> updatePinCode({
    required String userId,
    required String pinCode,
  }) =>
      (update(users)..where((u) => u.id.equals(userId))).write(
        UsersCompanion(
          pinCode: Value(pinCode),
        ),
      );
}
