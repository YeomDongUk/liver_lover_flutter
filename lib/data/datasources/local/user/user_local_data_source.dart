// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class UserLocalDataSource {
  Future<UserModel> createUser(UsersCompanion companion);

  /// 로그인
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
    with DaoMixin
    implements UserLocalDataSource {
  UserLocalDataSourceImpl({
    required AppDatabase attachedDatabase,
  }) : super(attachedDatabase);

  LocalNotification get localNotification =>
      KiwiContainer().resolve<LocalNotification>();

  @override
  Future<UserModel?> autoLogin() async {
    final lastLoginUserModel = await select(lastLoginUsers).getSingleOrNull();

    if (lastLoginUserModel == null) return null;

    final userModel = await (select(users)
          ..where((tbl) => tbl.id.equals(lastLoginUserModel.userId)))
        .getSingleOrNull();

    if (userModel != null) {
      final notificationScheduleModels = await (select(notificationSchedules)
            ..where(
              (tbl) =>
                  tbl.userId.equals(userModel.id) &
                  tbl.reservedAt.isBiggerThanValue(DateTime.now()),
            ))
          .get();

      await localNotification.onLoginCallback(
        userId: userModel.id,
        notificationScheduleModels: notificationScheduleModels,
      );
    }

    return userModel;
  }

  @override
  Future<UserModel> createUser(UsersCompanion companion) {
    return transaction(() async {
      await localNotification.cancelAll();
      final userModel = await into(users).insertReturning(companion);
      await into(userPoints)
          .insert(UserPointsCompanion.insert(userId: userModel.id));
      await _writeLastLoginUserModel(userModel.id);
      return userModel;
    });
  }

  ///  로그인
  @override
  Future<UserModel> getUser(String pinCode) {
    return transaction(() async {
      final userModel = await (select(users)
            ..where((tbl) => tbl.pinCode.equals(pinCode)))
          .getSingle();

      await _writeLastLoginUserModel(userModel.id);

      final notificationScheduleModels = await (select(notificationSchedules)
            ..where(
              (tbl) =>
                  tbl.userId.equals(userModel.id) &
                  tbl.reservedAt.isBiggerThanValue(DateTime.now()),
            ))
          .get();

      await localNotification.cancelAll();

      await localNotification.onLoginCallback(
        userId: userModel.id,
        notificationScheduleModels: notificationScheduleModels,
      );

      return userModel;
    });
  }

  @override
  Future<UserModel> getUserWithId(String id) =>
      (select(users)..where((tbl) => tbl.id.equals(id))).getSingle();

  @override
  Future<void> logOut() => delete(lastLoginUsers).go();

  @override
  Future<void> updatePinCode({
    required String userId,
    required String pinCode,
  }) =>
      (update(users)..where((tbl) => tbl.id.equals(userId)))
          .write(UsersCompanion(pinCode: Value(pinCode)));

  @override
  Future<UserModel> updateUser({
    required String userId,
    required UsersCompanion companion,
  }) async {
    final userModels = await (update(users)
          ..where((tbl) => tbl.id.equals(userId)))
        .writeReturning(companion);

    return userModels.first;
  }

  Future<void> _writeLastLoginUserModel(String userId) async {
    await delete(lastLoginUsers).go();
    await into(lastLoginUsers)
        .insert(LastLoginUsersCompanion.insert(userId: userId));
  }
}
