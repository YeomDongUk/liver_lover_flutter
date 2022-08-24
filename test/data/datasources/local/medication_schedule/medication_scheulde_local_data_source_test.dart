// // Package imports:
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Project imports:
// import 'package:yak/core/database/database.dart';
// import 'package:yak/core/local_notification/local_notification.dart';
// import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
// import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
// import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
// import 'package:yak/data/models/medication_information/medication_information_create_form.dart';
// import 'package:yak/data/models/prescription/prescription_create_input.dart';

// import '../../../../mock/mock_local_notification.dart';

// class MockLocalNotificationImpl extends Mock implements LocalNotification {}

// void main() {
//   late final AppDatabase attachedDatabase;
//   late MedicationScheduleLocalDataSourceImpl
//       medicationScheduleLocalDataSourceImpl;
//   late MedicationInformationLocalDataSourceImpl
//       medicationInformationLocalDataSourceImpl;
//   late PrescriptionLocalDataSourceImpl prescriptionLocalDataSourceImpl;

//   setUpAll(() async {
//     attachedDatabase = AppDatabase(
//       LazyDatabase(
//         NativeDatabase.memory,
//       ),
//     );

//     medicationScheduleLocalDataSourceImpl =
//         MedicationScheduleLocalDataSourceImpl(
//       localNotification: MockLocalNotification(),
//     );

//     medicationInformationLocalDataSourceImpl =
//         MedicationInformationLocalDataSourceImpl();

//     prescriptionLocalDataSourceImpl = PrescriptionLocalDataSourceImpl(
//         // attachedDatabase,
//         // medicationInformationLocalDataSourceImpl,
//         // medicationScheduleLocalDataSourceImpl,
//         );
//   });

//   group('CURD 테스트', () {
//     test('Create MedicationSchedules', () async {
//       final now = DateTime.now();
//       final prescriptionWriteResponse =
//           await prescriptionLocalDataSourceImpl.createPrescription(
//         userId: 'test',
//         createInput: PrescriptionCreateInput(
//           doctorName: '에단',
//           prescriptedAt: DateTime.now(),
//           medicatedAt: DateTime(now.year, now.month, now.day),
//           duration: 3,
//           medicationInformationCreateInputs: const [
//             MedicationInformationCreateInput(
//               pillId: '0',
//               takeCount: 30,
//               moring: 7,
//               afternoon: 11,
//               evening: 18,
//               night: 22,
//               takeCycle: 2,
//             ),
//           ],
//           afterPush: true,
//           beforePush: true,
//           push: true,
//         ),
//       );

//       expect(
//         prescriptionWriteResponse,
//         const TypeMatcher<PrescriptionWriteResponse>(),
//       );
//     });

//     test('Observe MedicationScheuldes', () async {
//       final typedResult = await medicationScheduleLocalDataSourceImpl
//           .getMedicationSchedulesGroupsStream(
//             userId: 'test',
//             date: DateTime.now().add(const Duration(days: 1)),
//           )
//           .first;

//       expect(typedResult.isNotEmpty, true);
//     });
//   });
// }
