// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/object_box/object_box.dart';
import 'package:yak/data/models/user/last_login_user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> createUser(UsersCompanion companion);
  Future<UserModel> getUser(String pinCode);
  Future<UserModel?> autoLogin();
  Future<void> logOut();
  Future<UserModel> getUserWithId(String id);
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
    with ObjectBoxMixin
    implements UserLocalDataSource {
  UserLocalDataSourceImpl(super.appDatabase);

  $UsersTable get users => attachedDatabase.users;

  @override
  Future<UserModel> createUser(UsersCompanion companion) =>
      transaction(() async {
        final userModel = await into(users).insertReturning(companion);
        await into(attachedDatabase.userPoints).insert(
          UserPointsCompanion.insert(userId: userModel.id),
        );

        lastLoginUserBox
          ..removeAll()
          ..put(LastLoginUserModel(userId: userModel.id));

        return userModel;
      });

  @override
  Future<UserModel> getUser(String pinCode) async {
    final user = await (select(users)..where((u) => u.pinCode.equals(pinCode)))
        .getSingle();

    lastLoginUserBox
      ..removeAll()
      ..put(LastLoginUserModel(userId: user.id));

    return user;
  }

  @override
  Future<UserModel> getUserWithId(String id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingle();

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

  @override
  Future<UserModel?> autoLogin() async {
    final users = lastLoginUserBox.getAll();
    if (users.isEmpty) return null;
    return getUserWithId(users.first.userId);
  }

  @override
  Future<void> logOut() async {
    lastLoginUserBox.removeAll();
    return AwesomeNotifications().cancelAll();
  }
}
