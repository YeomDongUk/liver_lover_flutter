import 'package:cuid/cuid.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yak/domain/entities/user/user.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';
import 'package:yak/domain/usecases/user/get_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUser getUser;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUser = GetUser(mockUserRepository);
  });

  const pinCode = '000000';
  final user = User(
    id: newCuid(),
    name: '염동욱',
    phone: '01023937318',
    birthYear: 1995,
    sex: 0,
    height: 173,
    weight: 64,
    pinCode: '000000',
    point: 0,
  );

  test('get User', () async {
    // assert
    when(() => mockUserRepository.getUser(pinCode)).thenAnswer(
      (invocation) async => Right(user),
    );

    // act
    final eitherUser = await getUser.call(pinCode);

    // assert
    expect(
      eitherUser.fold(
        (l) => l,
        (r) => r,
      ),
      user,
    );

    verify(() => mockUserRepository.getUser(pinCode));

    verifyNoMoreInteractions(mockUserRepository);
  });
}
