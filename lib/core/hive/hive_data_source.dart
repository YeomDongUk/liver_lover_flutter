// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataSource {
  late final Box<String> _autoLoginUserIdBox;
  Future<void> initHive() async {
    await Hive.initFlutter();
    _autoLoginUserIdBox = await Hive.openBox<String>('auto_login_user_id');
  }

  String? getUserId() => _autoLoginUserIdBox.get('id');

  Future<void> setUserId(String userId) =>
      _autoLoginUserIdBox.put('id', userId);
}
