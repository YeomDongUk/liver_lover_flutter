// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

void main() {
  final userModel = UserModel(
    id: '12345678asdaf9',
    name: '염동욱',
    phone: '01023937318',
    birthYear: 1995,
    sex: 0,
    height: 173,
    weight: 64,
    pinCode: '000000',
    createdAt: DateTime(1900),
    updatedAt: DateTime(1900),
  );

  final userJson = <String, dynamic>{
    'id': '12345678asdaf9',
    'name': '염동욱',
    'phone': '01023937318',
    'birthYear': 1995,
    'sex': 0,
    'height': 173,
    'weight': 64,
    'pinCode': '000000',
    'createdAt': DateTime(1900).millisecondsSinceEpoch,
    'updatedAt': DateTime(1900).millisecondsSinceEpoch,
  };
  test('from Json', () {
    final result = UserModel.fromJson(userJson);

    expect(userModel, result);
  });

  test('to Json', () {
    final result = userModel.toJson();

    expect(result, userJson);
  });
}
