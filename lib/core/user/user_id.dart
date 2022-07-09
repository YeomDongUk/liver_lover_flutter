// ignore_for_file: prefer_final_fields

abstract class UserId {
  String _value = '-';

  String get value => _value;
}

class UserIdImpl implements UserId {
  @override
  String _value = '-';

  @override
  String get value => _value;

  set value(String id) => _value = id;
}
