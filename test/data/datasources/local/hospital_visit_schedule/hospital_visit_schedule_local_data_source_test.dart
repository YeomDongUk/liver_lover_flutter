// // Package imports:
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Project imports:
// import 'package:yak/core/class/notification.dart';
// import 'package:yak/core/database/database.dart';
// import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
// import 'package:yak/data/datasources/local/hospital_visit_schedule/hospital_visit_schedule_local_data_source.dart';
// import '../../../../mock/mock_local_notification.dart';

// void main() {
//   late final AppDatabase attachedDatabase;
//   late HospitalVisitScheduleLocalDataSourceImpl
//       hospitalVisitScheduleLocalDataSourceImpl;

//   setUpAll(() async {
//     attachedDatabase = AppDatabase(
//       LazyDatabase(
//         NativeDatabase.memory,
//       ),
//     );

//     hospitalVisitScheduleLocalDataSourceImpl =
//         HospitalVisitScheduleLocalDataSourceImpl(
//       attachedDatabase: attachedDatabase,
//       localNotification: MockLocalNotification(),
//     );

//     await Future.wait(
//       List.generate(
//         5,
//         (index) => hospitalVisitScheduleLocalDataSourceImpl
//             .createHospitalVisitSchedule(
//           userId: 'test',
//           companion: HospitalVisitSchedulesCompanion.insert(
//             id: Value('$index'),
//             userId: 'test',
//             type: HospitalVisitScheduleType.regular,
//             hospitalName: '테스트 병원',
//             doctorOffice: '테스트 진료실',
//             medicalSubject: '테스트 진료과목',
//             doctorName: '테스트 의사',
//             reservedAt: DateTime.now().add(Duration(days: index)),
//             push: const Value(true),
//             afterPush: const Value(true),
//             beforePush: const Value(true),
//           ),
//         ),
//       ),
//     );
//   });

//   group('병원 방문 일정 생성', () {
//     test(
//       '오늘보다 이전의 병원 방문 일정을 생성한다',
//       () async {
//         try {
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .createHospitalVisitSchedule(
//             userId: 'test',
//             companion: HospitalVisitSchedulesCompanion.insert(
//               type: HospitalVisitScheduleType.regular,
//               userId: 'test',
//               doctorOffice: '테스트 실',
//               hospitalName: '테스트 병원',
//               medicalSubject: '테스트 진료과목',
//               doctorName: '테스트 의사',
//               reservedAt:
//                   DateTime.now().add(const Duration(days: -1, hours: 12)),
//               push: const Value(true),
//               afterPush: const Value(true),
//               beforePush: const Value(true),
//             ),
//           );
//         } catch (e) {
//           expect(e, const TypeMatcher<Exception>());
//         }
//       },
//     );

//     test('오늘 이후의 병원 방문 일정을 생성한다', () async {
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .createHospitalVisitSchedule(
//         userId: 'test',
//         companion: HospitalVisitSchedulesCompanion.insert(
//           userId: 'test',
//           doctorOffice: '테스트 실',
//           hospitalName: '테스트 병원',
//           medicalSubject: '테스트 진료과목',
//           doctorName: '테스트 의사',
//           type: HospitalVisitScheduleType.regular,
//           reservedAt: DateTime.now().add(const Duration(days: 1, hours: 12)),
//           push: const Value(true),
//           afterPush: const Value(true),
//           beforePush: const Value(true),
//         ),
//       );
//       expect(
//         hospitalVisitSchedule,
//         const TypeMatcher<HospitalVisitScheduleModel>(),
//       );
//     });

//     test('병원 방문 일정에 따른 설문 기록을 가져온다', () async {
//       final queryResults = await (attachedDatabase
//               .select(attachedDatabase.hospitalVisitSchedules)
//               .join([
//         leftOuterJoin(
//           attachedDatabase.sF12SurveyHistories,
//           attachedDatabase.hospitalVisitSchedules.id.equalsExp(
//             attachedDatabase.sF12SurveyHistories.hospitalVisitScheduleId,
//           ),
//         ),
//         leftOuterJoin(
//           attachedDatabase.medicationAdherenceSurveyHistories,
//           attachedDatabase
//               .medicationAdherenceSurveyHistories.hospitalVisitScheduleId
//               .equalsExp(
//             attachedDatabase.hospitalVisitSchedules.id,
//           ),
//         ),
//       ])
//             ..where(
//               attachedDatabase.hospitalVisitSchedules.userId.equals('test'),
//             ))
//           .get();

//       expect(queryResults.isNotEmpty, true);
//     });
//   });

//   group('병원 방문 일정을 조회한다', () {
//     test('병원 방문 일정 조회', () async {
//       final hospitalVisitSchedules =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .getHospitalVisitSchedules(
//         userId: 'test',
//         visited: false,
//       );

//       expect(hospitalVisitSchedules.isNotEmpty, true);
//     });

//     test('병원 방문 일정 알림 생성 조회', () async {
//       when(
//         () => hospitalVisitScheduleLocalDataSourceImpl.localNotification
//             .createHospitalVisitNotification(
//           NotificationModel(
//             id: 1,
//             userId: 'test',
//             scheduleId: 'hospitalVisitSchedulesId',
//             status: NotificationStatus.on,
//             type: NotificationType.hospitalVisit,
//             subType: NotificationSubType.beforeDay,
//             reservedAt: DateTime.now(),
//             createdAt: DateTime.now(),
//             updatedAt: DateTime.now(),
//           ),
//         ),
//       ).thenAnswer((invocation) => Future(() => true));

//       // print(hospitalVisitNotifications);
//       final query =
//           hospitalVisitScheduleLocalDataSourceImpl.attachedDatabase.select(
//         hospitalVisitScheduleLocalDataSourceImpl.attachedDatabase.notifications,
//       );
//       final hospitalVisitNotifications = await (query
//             ..where((tbl) => tbl.userId.equals('test'))
//             ..where(
//               (tbl) => tbl.type.equals(NotificationType.hospitalVisit.index),
//             ))
//           .get();
//       // .get();

//       expect(hospitalVisitNotifications.isNotEmpty, true);
//     });
//   });

//   group('병원 방문 일정을 수정한다', () {
//     test('병원 방문 일정 예약 일시 수정', () async {
//       final now = DateTime.fromMillisecondsSinceEpoch(
//         DateTime.now().millisecondsSinceEpoch ~/ 1000 * 1000,
//       );
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: HospitalVisitSchedulesCompanion(
//           reservedAt: Value(now),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.reservedAt,
//         now,
//       );
//     });

//     test('병원 방문 일정 예약 병원 수정', () async {
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion:
//             const HospitalVisitSchedulesCompanion(hospitalName: Value('동욱 병원')),
//       );

//       expect(
//         hospitalVisitSchedule.hospitalName,
//         '동욱 병원',
//       );
//     });

//     test('병원 방문 일정 예약 진료과목 수정', () async {
//       const medicalSubject = '변경된 과목';
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: const HospitalVisitSchedulesCompanion(
//           medicalSubject: Value(medicalSubject),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.medicalSubject,
//         medicalSubject,
//       );
//     });

//     test('병원 방문 일정 예약 담당의사 수정', () async {
//       const doctorName = '변경된 의사';
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: const HospitalVisitSchedulesCompanion(
//           doctorName: Value(doctorName),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.doctorName,
//         doctorName,
//       );
//     });

//     test('병원 방문 일정 예약 알림사용 수정', () async {
//       const push = true;
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: const HospitalVisitSchedulesCompanion(
//           push: Value(push),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.push,
//         push,
//       );
//     });

//     test('병원 방문 일정 예약 하루전 알림 수정', () async {
//       const beforePush = true;
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: const HospitalVisitSchedulesCompanion(
//           beforePush: Value(beforePush),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.beforePush,
//         beforePush,
//       );
//     });
//     test('병원 방문 일정 예약 2시간 전 알림 수정', () async {
//       const afterPush = true;
//       final hospitalVisitSchedule =
//           await hospitalVisitScheduleLocalDataSourceImpl
//               .updateHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//         companion: const HospitalVisitSchedulesCompanion(
//           afterPush: Value(afterPush),
//         ),
//       );

//       expect(
//         hospitalVisitSchedule.afterPush,
//         afterPush,
//       );
//     });
//   });

//   group('병원 방문 일정 삭제', () {
//     test('존재하지 않는 병원 방문 일정 삭제', () async {
//       final effetedRowsCount = await hospitalVisitScheduleLocalDataSourceImpl
//           .deleteHospitalVisitSchedule(
//         id: '0',
//         userId: 'test',
//       );
//       expect(effetedRowsCount, 1);
//     });
//     test('존재하는 병원 방문 일정 삭제', () async {
//       final effetedRowsCount = await hospitalVisitScheduleLocalDataSourceImpl
//           .deleteHospitalVisitSchedule(
//         id: '100',
//         userId: 'test',
//       );
//       expect(effetedRowsCount, 0);
//     });
//   });
// }
