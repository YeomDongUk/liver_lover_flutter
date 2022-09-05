// ignore_for_file: always_use_package_imports

// Package imports:
import 'package:cuid/cuid.dart';
import 'package:drift/drift.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'table/drinking_history/drinking_history_table.dart';
import 'table/examination_result/examination_result_table.dart';
import 'table/exercise_history/exercise_history_table.dart';
import 'table/health_question/health_question_table.dart';
import 'table/hospital/hospital_table.dart';
import 'table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'table/last_login_user/last_login_user_table.dart';
import 'table/liver_level_history/liver_level_table.dart';
import 'table/medication_adherence_survey_history/medication_adherence_survey_answer.dart';
import 'table/medication_adherence_survey_history/medication_adherence_survey_history.dart';
import 'table/medication_information/medication_information_table.dart';
import 'table/medication_schedule/medication_schedule_table.dart';
import 'table/metabolic_disease/metabolic_disease_table.dart';
import 'table/notification_schedule/notification_schedule_table.dart';
import 'table/pill/pill_table.dart';
import 'table/point_history/point_history_table.dart';
import 'table/prescription/prescription_table.dart';
import 'table/sf_12_survey/sf12_survey_answer.dart';
import 'table/sf_12_survey/sf12_survey_history_table.dart';
import 'table/smoking_history/smoking_history_table.dart';
import 'table/user/user_table.dart';
import 'table/user_point/user_point.dart';

part 'database.g.dart';

/// DB 클래스
@DriftDatabase(
  tables: [
    Users,
    Pills,
    HospitalVisitSchedules,
    LiverLevelHistories,
    PointHistories,
    SF12SurveyHistories,
    MedicationAdherenceSurveyHistories,
    SF12SurveyAnswers,
    MetabolicDiseases,
    ExaminationResults,
    HealthQuestions,
    DrinkingHistories,
    SmokingHistories,
    ExcerciseHistories,
    Hospitals,
    MedicationAdherenceSurveyAnswers,
    UserPoints,
    Prescriptions,
    MedicationInformations,
    MedicationSchedules,
    NotificationSchedules,
    LastLoginUsers,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);
  AppDatabase.connect(super.c) : super.connect();

  @override
  int get schemaVersion => 2;

  // this is the new constructor

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          Logger().d('onCreate');
          await m.createAll();

          // await transaction(() async {
          //   final userModels = await select(users).get();

          //   if (userModels.isNotEmpty) return null;

          //   final userModel = await into(users).insertReturning(
          //     UsersCompanion.insert(
          //       id: const Value('test'),
          //       name: '염동욱',
          //       phone: '01023937318',
          //       birthYear: 1995,
          //       sex: 0,
          //       height: 172,
          //       weight: 64,
          //       pinCode: '000000',
          //     ),
          //   );
          //   await into(userPoints).insert(
          //     UserPointsCompanion.insert(userId: userModel.id),
          //   );
          // });
        },
        onUpgrade: (m, from, to) async {
          try {
            Logger().d('onUpgrade');

            await m.deleteTable(userPoints.actualTableName);

            await m.deleteTable(sF12SurveyAnswers.actualTableName);
            await m.deleteTable(sF12SurveyHistories.actualTableName);
            await m
                .deleteTable(medicationAdherenceSurveyAnswers.actualTableName);
            await m.deleteTable(
              medicationAdherenceSurveyHistories.actualTableName,
            );

            await m.deleteTable(medicationSchedules.actualTableName);
            await m.deleteTable(medicationInformations.actualTableName);
            await m.deleteTable(prescriptions.actualTableName);
            await m.deleteTable(pills.actualTableName);

            await m.deleteTable(hospitalVisitSchedules.actualTableName);
            await m.deleteTable(liverLevelHistories.actualTableName);
            await m.deleteTable(metabolicDiseases.actualTableName);
            await m.deleteTable(examinationResults.actualTableName);
            await m.deleteTable(healthQuestions.actualTableName);
            await m.deleteTable(drinkingHistories.actualTableName);
            await m.deleteTable(smokingHistories.actualTableName);
            await m.deleteTable(excerciseHistories.actualTableName);
            await m.deleteTable(hospitals.actualTableName);

            await m.deleteTable(notificationSchedules.actualTableName);

            await m.deleteTable(lastLoginUsers.actualTableName);
            await m.deleteTable(pointHistories.actualTableName);
            await m.deleteTable(users.actualTableName);

            await m.createAll();
          } catch (e) {
            Logger().e(e);
          }
        },
      );
}
