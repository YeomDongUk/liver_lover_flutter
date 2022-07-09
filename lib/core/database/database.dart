// ignore_for_file: always_use_package_imports

import 'package:cuid/cuid.dart';
import 'package:drift/drift.dart';
import 'package:yak/core/class/notification.dart';

import 'table/blood_glucose_history/blood_glucose_history_table.dart';
import 'table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'table/liver_level_history/liver_level_table.dart';
import 'table/medication_adherence_survey_history/medication_adherence_survey_history.dart';
import 'table/medication_information/medication_information_table.dart';
import 'table/medication_notification/medication_notification_table.dart';
import 'table/medication_schedule/medication_schedule_table.dart';
import 'table/pill/pill_table.dart';
import 'table/point_history/point_history_table.dart';
import 'table/prescription/prescription_table.dart';
import 'table/sf_12_survey/sf12_survey_answer.dart';
import 'table/sf_12_survey/sf12_survey_history_table.dart';
import 'table/user/user_table.dart';

part 'database.g.dart';

/// DB 클래스
@DriftDatabase(
  tables: [
    Users,
    Pills,
    Prescriptions,
    MedicationInformations,
    MedicationSchedules,
    MedicationNotifications,
    HospitalVisitSchedules,
    BloodGlucoseHistories,
    LiverLevelHistories,
    PointHistories,
    SF12SurveyHistories,
    MedicationAdherenceSurveyHistories,
    SF12SurveyAnswers,
  ],
  daos: [
    // UserDao,
    // WeightHistoryDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e) {
    // delete(this.sF12SurveyAnswers).go().then((value) => print(value));
  }

  @override
  int get schemaVersion => 0;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          // await into(users).insertReturning(
          //   UsersCompanion.insert(
          //     id: const Value('test'),
          //     name: '염동욱',
          //     phone: '01023937318',
          //     birthYear: 1995,
          //     sex: 0,
          //     height: 172,
          //     weight: 64,
          //     pinCode: '000000',
          //   ),
          // );

          // await batch((batch) {
          //   // final pillsCompanions = List.generate(
          //   //   5,
          //   //   (index) => PillsCompanion.insert(
          //   //     id: Value('$index'),
          //   //     name: '테스트 $index 약품',
          //   //     entpName: '우리집',
          //   //     imageUrl: '',
          //   //     effect: '이거짱임1',
          //   //     useage: '진짜좋음',
          //   //     material: '',
          //   //   ),
          //   // );

          //   // batch
          //   //   ..insertAll(
          //   //     pills,
          //   //     pillsCompanions,
          //   //   );
          //   // ..insertAll(
          //   //   hospitalVisitSchedules,
          //   //   List.generate(
          //   //     10,
          //   //     (index) => HospitalVisitSchedulesCompanion(
          //   //       id: Value('$index'),
          //   //       userId: const Value('test'),
          //   //       hospitalName: const Value('테스트 병원'),
          //   //       medicalSubject: const Value('테스트 진료과목'),
          //   //       doctorName: const Value('테스트 의사'),
          //   //       reservedAt:
          //   //           Value(DateTime.now().add(Duration(days: index))),
          //   //     ),
          //   //   ),
          //   // );
          //   //   ..insert(
          //   //     prescriptions,
          //   //     PrescriptionsCompanion.insert(
          //   //       id: const Value('0'),
          //   //       userId: user.id,
          //   //       doctorName: '테스트 의사',
          //   //       prescribedAt: DateTime.now(),
          //   //       medicationStartAt: DateTime(2022, 7, 2),
          //   //       medicationEndAt: DateTime(2022, 7, 12),
          //   //     ),
          //   //   )
          //   //   ..insertAll(
          //   //     medicationSchedules,
          //   //     List.generate(
          //   //       11,
          //   //       (index) => MedicationSchedulesCompanion.insert(
          //   //         prescriptionId: '0',
          //   //         type: MedicationScheduleType.values[index % 3],
          //   //         reservedAt: DateTime(2022, 7, 1, 13).add(
          //   //           Duration(days: index),
          //   //         ),
          //   //       ),
          //   //     ),
          //   //   );

          //   // batch.insertAll(
          //   //   medicationSchedules,
          //   //   List.generate(
          //   //     5,
          //   //     (index) => MedicationSchedulesCompanion.insert(
          //   //       userId: userId,
          //   //       prescriptionId: prescriptionId,
          //   //       type: type,
          //   //       reservedAt: reservedAt,
          //   //     ),
          //   //   ),
          //   // );

          //   // for (var i = 0; i < 100; i++) {
          //   //   batch.insert(
          //   //     medicationSchedules,
          //   //     MedicationSchedulesCompanion.insert(
          //   //       userId: user.id,
          //   //       doctorName: '테스트 닥터 $i',
          //   //       pillId: pillsCompanions[i % 5].id.value,
          //   //       count: 2,
          //   //       prescribedAt: DateTime.now().add(Duration(days: i)),
          //   //       medicatedAt: DateTime.now().add(
          //   //         Duration(days: i ~/ 5),
          //   //       ),
          //   //     ),
          //   //   );
          //   // }
          // });
        },
        // onUpgrade: (m, from, to) async {
        //   try {
        //     await m.deleteTable('alarms');
        //     await m.deleteTable('excercises');
        //     await m.deleteTable('users');

        //     await m.createAll();
        //   } catch (e) {
        //     print(e);
        //   }
        // },
      );
}
