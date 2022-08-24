// // Package imports:
// import 'package:cuid/cuid.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Project imports:
// import 'package:yak/core/database/database.dart';
// import 'package:yak/core/error/failure.dart';
// import 'package:yak/domain/entities/user/user.dart';
// import 'package:yak/domain/repositories/user/user_repository.dart';
// import 'package:yak/domain/usecases/user/create_user.dart';
// import '../../../mock/mock_hive_data_source.dart';

// class MockUserRepository extends Mock implements UserRepository {}

// void main() {
//   late CreateUser createUser;
//   late MockUserRepository mockUserRepository;
//   late MockHiveDataSource mockHiveDataSource;
//   final userJson = {
//     'id': newCuid(),
//     'name': '염동욱',
//     'phone': '01023937318',
//     'birthYear': 1995,
//     'sex': 0,
//     'height': 173,
//     'weight': 64,
//     'pinCode': '000000',
//     'metabolicDisease': false,
//     'createdAt': DateTime.now().millisecondsSinceEpoch,
//     'updatedAt': DateTime.now().millisecondsSinceEpoch,
//   };

//   final user = User.fromJson(userJson);
//   final companion = UserModel.fromJson(userJson).toCompanion(true);

//   setUp(() {
//     mockUserRepository = MockUserRepository();
//     mockHiveDataSource = MockHiveDataSource();
//     createUser = CreateUser(
//       userRepository: mockUserRepository,
//       hiveDataSource: mockHiveDataSource,
//     );
//   });

//   setUpAll(() {
//     registerFallbackValue(companion);
//   });

//   test('should get created user from repository', () async {
//     // assert
//     when(() => mockUserRepository.createUser(any())).thenAnswer(
//       (invocation) async => Right(user),
//     );

//     // act
//     final eitherUser = await createUser.call(companion);

//     // assert
//     expect(
//       eitherUser.fold(
//         (l) => l,
//         (r) => r,
//       ),
//       user,
//     );

//     verify(() => mockUserRepository.createUser(companion));
//   });

//   test('should get create failure from repository', () async {
//     // assert
//     when(() => mockUserRepository.createUser(any())).thenAnswer(
//       (invocation) async => const Left(CreateFailure()),
//     );

//     // act
//     final eitherUser = await createUser.call(companion);

//     // assert
//     expect(
//       eitherUser.fold(
//         (l) => l,
//         (r) => r,
//       ),
//       const TypeMatcher<CreateFailure>(),
//     );

//     verify(() => mockUserRepository.createUser(companion));
//   });
// }
