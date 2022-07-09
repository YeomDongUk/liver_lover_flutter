import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/user/user_local_data_source.dart';
import 'package:yak/data/repositories/user/user_repository_impl.dart';
import 'package:yak/domain/entities/user/user.dart';

class MockUserLocalDataSource extends Mock implements UserLocalDataSource {}

void main() {
  late UserRepositoryImpl userRepositoryImpl;
  late MockUserLocalDataSource mockUserLocalDataSource;
  setUp(() {
    mockUserLocalDataSource = MockUserLocalDataSource();
    userRepositoryImpl = UserRepositoryImpl(mockUserLocalDataSource);
  });

  final userJson = {
    'id': '12345678asdaf9',
    'name': '염동욱',
    'phone': '01023937318',
    'birthYear': 1995,
    'sex': 0,
    'height': 173,
    'weight': 64,
    'pinCode': '000000',
    'metabolicDisease': false,
    'createdAt': DateTime(1900).millisecondsSinceEpoch,
    'updatedAt': DateTime(1900).millisecondsSinceEpoch,
  };

  test('get User', () async {
    // arrange
    when(() => mockUserLocalDataSource.getUser('000000')).thenAnswer(
      (invocation) async => UserModel(
        id: '12345678asdaf9',
        name: '염동욱',
        phone: '01023937318',
        birthYear: 1995,
        sex: 0,
        height: 173,
        weight: 64,
        pinCode: '000000',
        metabolicDisease: false,
        createdAt: DateTime(1900),
        updatedAt: DateTime(1900),
      ),
    );

    // act
    final getUserResult = await userRepositoryImpl.getUser('000000');

    expect(
      getUserResult.fold((l) => l, (r) => r),
      User.fromJson(userJson),
    );
  });
}
