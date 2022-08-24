// // Package imports:
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Project imports:
// import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
// import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';
// import 'package:yak/domain/usecases/medication_schedule/get_today_medication_schedules.dart';

// class MockMedicationScheduleRepository extends Mock
//     implements MedicationScheduleRepository {}

// void main() {
//   late GetTodayMedicationSchedules getTodayMedicationSchedules;
//   late MockMedicationScheduleRepository mockMedicationScheduleRepository;

//   setUp(() {
//     mockMedicationScheduleRepository = MockMedicationScheduleRepository();
//     getTodayMedicationSchedules = GetTodayMedicationSchedules(
//       medicationScheduleRepository: mockMedicationScheduleRepository,
//     );
//   });

//   test('오늘의 복용 일정을 가져온다.', () async {
//     /// Given: 오늘의 복용일정을 4개 가지고 있다.
//     when(
//       () =>
//           mockMedicationScheduleRepository.getTodayMedicationSchedulesStream(),
//     ).thenAnswer(
//       (invocation) async => Right(
//         Stream.fromIterable(
//           [
//             List.generate(
//               4,
//               (index) => MedicationSchedule(
//                 id: index,
//                 medicationInformationId: index,
//                 push: false,
//                 afterPush: false,
//                 beforePush: false,
//                 reservedAt: DateTime.now(),
//                 medicatedAt: null,
//                 createdAt: DateTime.now(),
//                 updatedAt: DateTime.now(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     /// When: 오늘의 복용일정을 조회한다.

//     final either = await getTodayMedicationSchedules.call(null);
//     final result = await either.fold(
//       (l) => Future(() => <MedicationSchedule>[]),
//       (r) => r.first,
//     );

//     /// Then: 오늘의 복용일정 4개가 조회된다.
//     expect(
//       result,
//       const TypeMatcher<List<MedicationSchedule>>(),
//     );
//     expect(
//       result.length,
//       4,
//     );
//   });
// }
