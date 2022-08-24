// // Package imports:
// import 'package:cuid/cuid.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Project imports:
// import 'package:yak/core/database/database.dart';
// import 'package:yak/core/user/user_id.dart';
// import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
// import 'package:yak/data/repositories/medication_schedule/medication_schedule_repository_impl.dart';
// import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';

// class MockUserId extends Mock implements UserId {}

// class MockMedicationScheduleLocalDataSource extends Mock
//     implements MedicationScheduleLocalDataSource {}

// void main() {
//   late MedicationScheduleRepositoryImpl medicationScheduleRepositoryImpl;
//   late MockUserId mockUserId;
//   late MockMedicationScheduleLocalDataSource
//       mockMedicationScheduleLocalDataSource;

//   setUp(() {
//     mockUserId = MockUserId();
//     mockMedicationScheduleLocalDataSource =
//         MockMedicationScheduleLocalDataSource();
//     medicationScheduleRepositoryImpl = MedicationScheduleRepositoryImpl(
//       mockMedicationScheduleLocalDataSource,
//       mockUserId,
//     );
//   });

//   test('오늘의 복약 일정을 조회한다', () async {
//     /// Given: 오늘의 복용일정을 4개 가지고 있다.
//     when(() => mockUserId.value).thenReturn('test');
//     when(
//       () => mockMedicationScheduleLocalDataSource
//           .getTodayMedicationSchedulesStream(
//         userId: any(named: 'userId'),
//       ),
//     ).thenAnswer(
//       (invocation) => Stream.fromFuture(
//         Future(
//           () => List.generate(
//             4,
//             (index) => MedicationScheduleModel(
//               id: newCuid(),
//               medicationInformationId: 'medicationInformationId',
//               reservedAt: DateTime.now()..add(const Duration(days: 1)),
//               beforePush: true,
//               afterPush: true,
//               push: true,
//               createdAt: DateTime.now(),
//               updatedAt: DateTime.now(),
//             ),
//           ),
//         ),
//       ),
//     );

//     /// When: 오늘의 섭취전인 복용일정을 조회한다.
//     final result = await medicationScheduleRepositoryImpl
//         .getTodayMedicationSchedulesStream();

//     /// Then: 오늘의 복용일정 4개가 조회된다.
//     expect(
//       result.fold((l) => l, (r) => r),
//       const TypeMatcher<Stream<List<MedicationSchedule>>>(),
//     );
//     expect(
//       (await (result.fold((l) => l, (r) => r)
//                   as Stream<List<MedicationSchedule>>)
//               .first)
//           .length,
//       4,
//     );
//   });
// }
