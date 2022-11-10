// ignore_for_file: always_use_package_imports

// Package imports:
import 'package:cuid/cuid.dart';
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';

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
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await KiwiContainer().resolve<PillRepository>().initCommonPills();
        },
      );
}
