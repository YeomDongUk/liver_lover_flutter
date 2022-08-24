// // Package imports:
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:flutter_test/flutter_test.dart';

// // Project imports:
// import 'package:yak/core/database/database.dart';
// import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
// import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
// import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
// import 'package:yak/data/models/medication_information/medication_information_create_form.dart';
// import 'package:yak/data/models/prescription/prescription_create_input.dart';
// import 'package:yak/data/models/prescription/prescription_write_response.dart';

// import '../../../../mock/mock_local_notification.dart';

// void main() {
//   late final PrescriptionLocalDataSourceImpl prescriptionLocalDataSourceImpl;
//   late final AppDatabase attachedDatabase;
//   late final MedicationInformationLocalDataSourceImpl
//       medicationInformationLocalDataSourceImpl;
//   late final MedicationScheduleLocalDataSourceImpl
//       medicationScheduleLocalDataSourceImpl;

//   setUpAll(() {
//     attachedDatabase = AppDatabase(
//       LazyDatabase(
//         NativeDatabase.memory,
//       ),
//     );

//     medicationInformationLocalDataSourceImpl =
//         MedicationInformationLocalDataSourceImpl(attachedDatabase);
//     medicationScheduleLocalDataSourceImpl =
//         MedicationScheduleLocalDataSourceImpl(
//       attachedDatabase: attachedDatabase,
//       localNotification: MockLocalNotification(),
//     );

//     prescriptionLocalDataSourceImpl = PrescriptionLocalDataSourceImpl(
//       attachedDatabase,
//       medicationInformationLocalDataSourceImpl,
//       medicationScheduleLocalDataSourceImpl,
//     );
//   });

//   group('curd test', () {
//     test('create prescription', () async {
//       final prescriptionWriteResponse =
//           await prescriptionLocalDataSourceImpl.createPrescription(
//         userId: 'test',
//         prescriptionCreateInput: PrescriptionCreateInput(
//           doctorName: '에단',
//           prescriptedAt: DateTime.now(),
//           medicatedAt: DateTime.now(),
//           duration: 30,
//           medicationInformationCreateInputs: const [
//             MedicationInformationCreateInput(
//               pillId: '0',
//               takeCount: 30,
//               moring: 7,
//               afternoon: 11,
//               evening: 18,
//               night: 22,
//               takeCycle: 1,
//               push: true,
//               beforePush: true,
//               afterPush: true,
//             ),
//           ],
//         ),
//       );

//       expect(
//         prescriptionWriteResponse,
//         const TypeMatcher<PrescriptionWriteResponse>(),
//       );
//     });

//     // test('get overviews before create', () async {
//     // final overviews = await prescriptionLocalDataSourceImpl
//     //     .getPrescriptionOverviews('test');

//     // expect(overviews.isEmpty, true);
//     // });

//     // test('create prescription', () async {
//     //   final response = await prescriptionLocalDataSourceImpl.createPrescription(
//     //     prescriptionsCompanion: PrescriptionsCompanion.insert(
//     //       id: const Value('prescriptionId'),
//     //       userId: 'test',
//     //       doctorName: '테스트 닥터',
//     //       prescriptedAt: DateTime(2022, 6, 24),
//     //       medicatedAt: DateTime(2022, 6, 24),
//     //       medicationEndAt: DateTime(2022, 6, 24).add(const Duration(days: 3)),
//     //     ),
//     //     medicationInformationsCompanions: List.generate(
//     //       5,
//     //       (index) => MedicationInformationsCompanion.insert(
//     //         prescriptionId: 'prescriptionId',
//     //         pillId: '$index',
//     //         dayDuration: 3,
//     //         takeCount: 2,
//     //         moring: const Value(7),
//     //         afternoon: const Value(11),
//     //         evening: const Value(18),
//     //         night: const Value(22),
//     //       ),
//     //     ),
//     //   );

//     //   // 3일동안 4번 먹는데 *2배가 잇어야함

//     //   expect(response, const TypeMatcher<PrescriptionWriteResponse>());
//     // });

//     // test('get overviews after create', () async {
//     //   final overviews = await prescriptionLocalDataSourceImpl
//     //       .getPrescriptionOverviews('test');
//     //   expect(overviews.isNotEmpty, true);
//     // });

//     // test('get notifications', () async {
//     //   final notifications = await (prescriptionLocalDataSourceImpl
//     //           .select(
//     //     attachedDatabase.medicationNotifications,
//     //   )
//     //           .join([
//     //     leftOuterJoin(
//     //       attachedDatabase.medicationSchedules,
//     //       attachedDatabase.medicationSchedules.id.equalsExp(
//     //         attachedDatabase.medicationNotifications.medicationScheduleId,
//     //       ),
//     //     ),
//     //     leftOuterJoin(
//     //       attachedDatabase.prescriptions,
//     //       attachedDatabase.prescriptions.id
//     //           .equalsExp(attachedDatabase.medicationSchedules.prescriptionId),
//     //     ),
//     //   ])
//     //         ..where(attachedDatabase.prescriptions.id.equals('prescriptionId')))
//     //       .get();

//     //   print(notifications.length);

//     //   expect(notifications.isNotEmpty, true);
//     // });
//   });
// }
