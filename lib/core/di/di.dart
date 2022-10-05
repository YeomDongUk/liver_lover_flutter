// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:kiwi/kiwi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/drinking_history/drinking_history_local_data_source.dart';
import 'package:yak/data/datasources/local/examination_result/examination_result_local_data_source.dart';
import 'package:yak/data/datasources/local/excercise_history/excercise_history_local_data_source.dart';
import 'package:yak/data/datasources/local/health_question/health_question_local_data_source.dart';
import 'package:yak/data/datasources/local/hospital_visit_schedule/hospital_visit_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_adherence_survey_history/medication_adherence_survey_answer_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/metabolic_disease/metabolic_disease_local_data_source.dart';
import 'package:yak/data/datasources/local/notification_schedule/notification_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/datasources/local/point_history/point_history_local_data_source.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/data/datasources/local/sf12_survey/sf_12_survey_answer_local_data_source.dart';
import 'package:yak/data/datasources/local/smoking_history/smoking_history_local_data_source.dart';
import 'package:yak/data/datasources/local/survey_group/survey_group_local_data_source.dart';
import 'package:yak/data/datasources/local/user/user_local_data_source.dart';
import 'package:yak/data/datasources/local/user_point/user_point_local_data_source.dart';
import 'package:yak/data/datasources/remote/pill/pill_remote_data_source.dart';
import 'package:yak/data/repositories/drinking_history/drinking_history_repository_impl.dart';
import 'package:yak/data/repositories/examination_result/examination_result_repository_impl.dart';
import 'package:yak/data/repositories/excercise_history/excercise_history_repository_impl.dart';
import 'package:yak/data/repositories/health_question/health_question_repository_impl.dart';
import 'package:yak/data/repositories/hospital_visit_schedule/hospital_visit_schedule_repository_impl.dart';
import 'package:yak/data/repositories/medication_schedule/medication_schedule_repository_impl.dart';
import 'package:yak/data/repositories/metabolic_disease/metabolic_disease_repository_impl.dart';
import 'package:yak/data/repositories/pill/pill_repository_impl.dart';
import 'package:yak/data/repositories/point_history/point_history_repository_impl.dart';
import 'package:yak/data/repositories/prescription/prescription_repository_impl.dart';
import 'package:yak/data/repositories/smoking_history/smoking_history_repository_impl.dart';
import 'package:yak/data/repositories/survey/medication_adherence_survey_answer/medication_adherence_survey_answer_repository.dart';
import 'package:yak/data/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';
import 'package:yak/data/repositories/survey/survey_group_repository_impl.dart';
import 'package:yak/data/repositories/user/user_repository_impl.dart';
import 'package:yak/data/repositories/user_point/user_point_repository_impl.dart';
import 'package:yak/domain/repositories/drinking_history/drinking_history_repository.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';
import 'package:yak/domain/repositories/excercise_history/excercise_history_repository.dart';
import 'package:yak/domain/repositories/health_question/health_question_repository.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';
import 'package:yak/domain/repositories/metabolic_disease/metabolic_disease_repository.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';
import 'package:yak/domain/repositories/point_history/point_history_repository.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';
import 'package:yak/domain/repositories/smoking_history/smoking_history_repository.dart';
import 'package:yak/domain/repositories/survey/medication_adherence_survey_answer/medication_adherence_survey_answer_repository.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';
import 'package:yak/domain/repositories/survey/survey_group_repository.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';
import 'package:yak/domain/repositories/user_point/user_point_repository.dart';
import 'package:yak/domain/usecases/drinking_history/get_drinking_histories.dart';
import 'package:yak/domain/usecases/drinking_history/get_drinking_history_average.dart';
import 'package:yak/domain/usecases/drinking_history/get_last_drinking_history_stream.dart';
import 'package:yak/domain/usecases/drinking_history/upsert_drinking_history.dart';
import 'package:yak/domain/usecases/examination_result/get_examination_results.dart';
import 'package:yak/domain/usecases/examination_result/upsert_examination_result.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_histories.dart';
import 'package:yak/domain/usecases/excercise_history/get_excercise_history_average.dart';
import 'package:yak/domain/usecases/excercise_history/upsert_excercise_history.dart';
import 'package:yak/domain/usecases/health_question/delete_health_question.dart';
import 'package:yak/domain/usecases/health_question/get_health_questions.dart';
import 'package:yak/domain/usecases/health_question/update_health_question.dart';
import 'package:yak/domain/usecases/health_question/write_health_question.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/delete_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/toggle_hospital_visit_schedule_push.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_daily_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_group_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/domain/usecases/metabolic_disease/get_metabolic_disease.dart';
import 'package:yak/domain/usecases/metabolic_disease/upsert_metabolic_disease.dart';
import 'package:yak/domain/usecases/pill/create_pill.dart';
import 'package:yak/domain/usecases/pill/search_pills.dart';
import 'package:yak/domain/usecases/point_history/get_point_histories.dart';
import 'package:yak/domain/usecases/point_history/init_point_history_subscription.dart';
import 'package:yak/domain/usecases/prescription/create_prescriotion.dart';
import 'package:yak/domain/usecases/prescription/get_prescriptions.dart';
import 'package:yak/domain/usecases/prescription/update_prescription.dart';
import 'package:yak/domain/usecases/smoking_history/get_last_smoking_history_stream.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_histories.dart';
import 'package:yak/domain/usecases/smoking_history/get_smoking_history_average.dart';
import 'package:yak/domain/usecases/smoking_history/upsert_smoking_history.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/create_medication_adherence_survey_answers.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/get_medication_adherence_survey_answers.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/create_sf_12_survey_answers.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/get_sf_12_survey_answers.dart';
import 'package:yak/domain/usecases/user/auto_login.dart';
import 'package:yak/domain/usecases/user/create_user.dart';
import 'package:yak/domain/usecases/user/get_user.dart';
import 'package:yak/domain/usecases/user/update_pin_code.dart';
import 'package:yak/domain/usecases/user/update_user.dart';
import 'package:yak/domain/usecases/user_point/get_user_point.dart';

// ignore: unused_element

class Di {
  static Future<void> setup(bool isProduction) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'liverlover.sqlite'));

    final isolate = await DriftIsolate.spawn(
      () => DatabaseConnection(NativeDatabase(file)),
    );

    final connection = await isolate.connect();

    KiwiContainer()
      ..registerSingleton<AppDatabase>(
        (c) => AppDatabase.connect(connection),
      )

      /// User
      ..registerInstance<UserId>(
        UserIdImpl(),
      )
      ..registerSingleton<LocalNotification>(
        (c) => LocalNotificationImpl(
          userId: c<UserId>(),
        ),
      )

      /// ScheduleNotificaiton
      ..registerSingleton<NotificationScheduleLocalDataSource>(
        (c) => NotificationScheduleLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
          localNotification: c<LocalNotification>(),
        ),
      )
      ..registerSingleton<UserLocalDataSource>(
        (c) => UserLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
        ),
      )

      /// User
      ..registerSingleton<UserRepository>(
        (c) => UserRepositoryImpl(
          userId: c<UserId>(),
          userLocalDataSource: c<UserLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetUser>(
        (c) => GetUser(
          userRepository: c<UserRepository>(),
        ),
      )
      ..registerSingleton<AutoLogin>(
        (c) => AutoLogin(
          userRepository: c<UserRepository>(),
        ),
      )
      ..registerSingleton<CreateUser>(
        (c) => CreateUser(
          userRepository: c<UserRepository>(),
        ),
      )
      ..registerSingleton<UpdateUser>(
        (c) => UpdateUser(c<UserRepository>()),
      )
      ..registerSingleton<UpdatePinCode>(
        (c) => UpdatePinCode(
          userRepository: c<UserRepository>(),
        ),
      )

      /// UserPoint
      ..registerSingleton<UserPointLocalDataSource>(
        (c) => UserPointLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<UserPointRepository>(
        (c) => UserPointRepositoryImpl(
          userId: c<UserId>(),
          userPointLocalDataSource: c<UserPointLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetUserPoint>(
        (c) => GetUserPoint(
          userPointRepository: c<UserPointRepository>(),
        ),
      )

      /// Medication
      ..registerSingleton<MedicationInformationLocalDataSource>(
        (c) => MedicationInformationLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
        ),
      )
      ..registerSingleton<MedicationScheduleLocalDataSource>(
        (c) => MedicationScheduleLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
          notificationScheduleLocalDataSource:
              c<NotificationScheduleLocalDataSource>(),
        ),
      )
      ..registerSingleton<MedicationScheduleRepository>(
        (c) => MedicationScheduleRepositoryImpl(
          c<MedicationScheduleLocalDataSource>(),
          c<UserId>(),
        ),
      )
      ..registerSingleton<UpdateMedicationScheduleGroupPush>(
        (c) => UpdateMedicationScheduleGroupPush(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )
      ..registerSingleton<DoMedication>(
        (c) => DoMedication(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )
      ..registerSingleton<DoAllMedication>(
        (c) => DoAllMedication(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )
      ..registerSingleton<GetMedicationScheduleGroupsStream>(
        (c) => GetMedicationScheduleGroupsStream(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )
      ..registerSingleton<GetMedicationScheduleGroupStream>(
        (c) => GetMedicationScheduleGroupStream(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )
      ..registerSingleton<GetMedicationScheduleDailyGroupsStream>(
        (c) => GetMedicationScheduleDailyGroupsStream(
          medicationScheduleRepository: c<MedicationScheduleRepository>(),
        ),
      )

      /// Pill
      ..registerSingleton<PillLocalDataSource>(
        (c) => PillLocalDataSourceImpl(c<AppDatabase>()),
      )
      ..registerSingleton<PillRemoteDataSource>(
        (c) => PillRemoteDataSourceImpl(Dio()),
      )
      ..registerSingleton<PillRepository>(
        (c) => PillRepositoryImpl(
          c<PillLocalDataSource>(),
          c<PillRemoteDataSource>(),
        ),
      )
      ..registerSingleton<SearchPills>(
        (c) => SearchPills(
          c<PillRepository>(),
        ),
      )
      ..registerSingleton<CreatePill>(
        (c) => CreatePill(
          c<PillRepository>(),
        ),
      )

      /// Prescription
      ..registerSingleton<PrescriptionLocalDataSource>(
        (c) => PrescriptionLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
        ),
      )
      ..registerSingleton<PrescriptionRepository>(
        (c) => PrescriptionRepositoryImpl(
          userId: c<UserId>(),
          prescriptionLocalDataSource: c<PrescriptionLocalDataSource>(),
        ),
      )
      ..registerSingleton<CreatePrescription>(
        (c) => CreatePrescription(
          prescriptionRepository: c<PrescriptionRepository>(),
        ),
      )
      ..registerSingleton<UpdatePrescription>(
        (c) => UpdatePrescription(
          prescriptionRepository: c<PrescriptionRepository>(),
        ),
      )
      ..registerSingleton<GetPrescriptions>(
        (c) => GetPrescriptions(
          prescriptionRepository: c<PrescriptionRepository>(),
        ),
      )

      /// Hospital Visit Schedule
      ..registerSingleton<HospitalVisitScheduleLocalDataSource>(
        (c) => HospitalVisitScheduleLocalDataSourceImpl(
          attachedDatabase: c<AppDatabase>(),
          notificationScheduleLocalDataSource:
              c<NotificationScheduleLocalDataSource>(),
        ),
      )
      ..registerSingleton<HospitalVisitScheduleRepository>(
        (c) => HospitalVisitScheduleRepositoryImpl(
          c<HospitalVisitScheduleLocalDataSource>(),
          c<UserId>(),
        ),
      )
      ..registerSingleton<GetHospitalVisitSchedulesStream>(
        (c) => GetHospitalVisitSchedulesStream(
          c<HospitalVisitScheduleRepository>(),
        ),
      )
      ..registerSingleton<CreateHospitalVisitSchedule>(
        (c) => CreateHospitalVisitSchedule(
          c<HospitalVisitScheduleRepository>(),
        ),
      )
      ..registerSingleton<UpdateHospitalVisitSchedule>(
        (c) => UpdateHospitalVisitSchedule(
          c<HospitalVisitScheduleRepository>(),
        ),
      )
      ..registerSingleton<ToggleHospitalVisitSchedulePush>(
        (c) => ToggleHospitalVisitSchedulePush(
          c<HospitalVisitScheduleRepository>(),
        ),
      )
      ..registerSingleton<DeleteHospitalVisitSchedule>(
        (c) => DeleteHospitalVisitSchedule(
          c<HospitalVisitScheduleRepository>(),
        ),
      )

      /// Surver Group
      ..registerSingleton<SurveyGroupLocalDataSource>(
        (c) => SurveyGroupLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<SurveyGroupRepository>(
        (c) => SurveyGroupRepositoryImpl(
          surveyGroupLocalDataSource: c<SurveyGroupLocalDataSource>(),
          userId: c<UserId>(),
        ),
      )
      ..registerSingleton<GetSurveyGroupHistories>(
        (c) => GetSurveyGroupHistories(
          surveyGroupRepository: c<SurveyGroupRepository>(),
        ),
      )

      /// SF12SurveyAnswer
      ..registerSingleton<SF12SurveyAnswerLocalDataSource>(
        (c) => SF12SurveyAnswerLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<SF12SurveyAnswerRepository>(
        (c) => SF12SurveyAnswerRepositoryImpl(
          userId: c<UserId>(),
          sf12SurveyAnswerLocalDataSource: c<SF12SurveyAnswerLocalDataSource>(),
        ),
      )
      ..registerSingleton<CreateSF12SurveyAnswers>(
        (c) => CreateSF12SurveyAnswers(
          sf12SurveyAnswerRepository: c<SF12SurveyAnswerRepository>(),
        ),
      )
      ..registerSingleton<GetSF12SurveyAnswers>(
        (c) => GetSF12SurveyAnswers(
          sf12SurveyAnswerRepository: c<SF12SurveyAnswerRepository>(),
        ),
      )

      /// Medication Adherence Survey Answer
      ..registerSingleton<MedicationAdherenceSurveyAnswerLocalDataSource>(
        (c) => MedicationAdherenceSurveyAnswerLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<MedicationAdherenceSurveyAnswerRepository>(
        (c) => MedicationAdherenceSurveyAnswerRepositoryImpl(
          userId: c<UserId>(),
          medicationAdherenceSurveyAnswerLocalDataSource:
              c<MedicationAdherenceSurveyAnswerLocalDataSource>(),
        ),
      )
      ..registerSingleton<CreateMedicationAdherenceSurveyAnswers>(
        (c) => CreateMedicationAdherenceSurveyAnswers(
          medicationAdherenceSurveyAnswerRepository:
              c<MedicationAdherenceSurveyAnswerRepository>(),
        ),
      )
      ..registerSingleton<GetMedicationAdherenceSurveyAnswers>(
        (c) => GetMedicationAdherenceSurveyAnswers(
          medicationAdherenceSurveyAnswerRepository:
              c<MedicationAdherenceSurveyAnswerRepository>(),
        ),
      )

      /// Metabolic Disease
      ..registerSingleton<MetabolicDiseaseLocalDataSource>(
        (c) => MetabolicDiseaseLocalDataSourceImpl(c<AppDatabase>()),
      )
      ..registerSingleton<MetabolicDiseaseRepository>(
        (c) => MetabolicDiseaseRepositoryImpl(
          userId: c<UserId>(),
          metabolicDiseaseLocalDataSource: c<MetabolicDiseaseLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetMetabolicDisease>(
        (c) => GetMetabolicDisease(
          metabolicDiseaseRepository: c<MetabolicDiseaseRepository>(),
        ),
      )
      ..registerSingleton<UpsertMetabolicDisease>(
        (c) => UpsertMetabolicDisease(
          metabolicDiseaseRepository: c<MetabolicDiseaseRepository>(),
        ),
      )

      /// Health Quetion
      ..registerSingleton<HealthQuestionLocalDataSource>(
        (c) => HealthQuestionLocalDataSourceImpl(c<AppDatabase>()),
      )
      ..registerSingleton<HealthQuestionRepository>(
        (c) => HealthQuestionRepositoryImpl(
          userId: c<UserId>(),
          healthQuestionLocalDataSource: c<HealthQuestionLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetHealthQuestions>(
        (c) => GetHealthQuestions(
          healthQuestionRepository: c<HealthQuestionRepository>(),
        ),
      )
      ..registerSingleton<WriteHealthQuestion>(
        (c) => WriteHealthQuestion(
          healthQuestionRepository: c<HealthQuestionRepository>(),
        ),
      )
      ..registerSingleton<UpdateHealthQuestion>(
        (c) => UpdateHealthQuestion(
          healthQuestionRepository: c<HealthQuestionRepository>(),
        ),
      )
      ..registerSingleton<DeleteHealthQuestion>(
        (c) => DeleteHealthQuestion(
          healthQuestionRepository: c<HealthQuestionRepository>(),
        ),
      )

      /// Drinking History
      ..registerSingleton<DrinkingHistoryLocalDataSource>(
        (c) => DrinkingHistoryLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<DrinkingHistoryRepository>(
        (c) => DrinkingHistoryRepositoryImpl(
          userId: c<UserId>(),
          drinkingHistoryLocalDataSource: c<DrinkingHistoryLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetDrinkingHistoryAverage>(
        (c) => GetDrinkingHistoryAverage(
          drinkingHistoryRepository: c<DrinkingHistoryRepository>(),
        ),
      )
      ..registerSingleton<UpsertDrinkingHistory>(
        (c) => UpsertDrinkingHistory(
          drinkingHistoryRepository: c<DrinkingHistoryRepository>(),
        ),
      )
      ..registerSingleton<GetDrinkingHistories>(
        (c) => GetDrinkingHistories(
          drinkingHistoryRepository: c<DrinkingHistoryRepository>(),
        ),
      )
      ..registerSingleton<GetLastDrinkingHistoryStream>(
        (c) => GetLastDrinkingHistoryStream(
          drinkingHistoryRepository: c<DrinkingHistoryRepository>(),
        ),
      )

      //// Smoking History
      ..registerSingleton<SmokingHistoryLocalDataSource>(
        (c) => SmokingHistoryLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<SmokingHistoryRepository>(
        (c) => SmokingHistoryRepositoryImpl(
          userId: c<UserId>(),
          smokingHistoryLocalDataSource: c<SmokingHistoryLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetSmokingHistoryAverage>(
        (c) => GetSmokingHistoryAverage(
          smokingHistoryRepository: c<SmokingHistoryRepository>(),
        ),
      )
      ..registerSingleton<UpsertSmokingHistory>(
        (c) => UpsertSmokingHistory(
          smokingHistoryRepository: c<SmokingHistoryRepository>(),
        ),
      )
      ..registerSingleton<GetSmokingHistories>(
        (c) => GetSmokingHistories(
          smokingHistoryRepository: c<SmokingHistoryRepository>(),
        ),
      )
      ..registerSingleton<GetLastSmokingHistoryStream>(
        (c) => GetLastSmokingHistoryStream(
          smokingHistoryRepository: c<SmokingHistoryRepository>(),
        ),
      )

      //// Excercise History
      ..registerSingleton<ExcerciseHistoryLocalDataSource>(
        (c) => ExcerciseHistoryLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<ExcerciseHistoryRepository>(
        (c) => ExcerciseHistoryRepositoryImpl(
          userId: c<UserId>(),
          excerciseHistoryLocalDataSource: c<ExcerciseHistoryLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetExcerciseHistoryAverage>(
        (c) => GetExcerciseHistoryAverage(
          smokingHistoryRepository: c<ExcerciseHistoryRepository>(),
        ),
      )
      ..registerSingleton<UpsertExcerciseHistory>(
        (c) => UpsertExcerciseHistory(
          smokingHistoryRepository: c<ExcerciseHistoryRepository>(),
        ),
      )
      ..registerSingleton<GetExcerciseHistories>(
        (c) => GetExcerciseHistories(
          excerciseHistoryRepository: c<ExcerciseHistoryRepository>(),
        ),
      )

      /// Examination Result
      ..registerSingleton<ExaminationResultLocalDataSource>(
        (c) => ExaminationResultLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<ExaminationResultRepository>(
        (c) => ExaminationResultRepositoryImpl(
          userId: c<UserId>(),
          examiationResultLocalDataSource:
              c<ExaminationResultLocalDataSource>(),
        ),
      )
      ..registerSingleton<UpsertExaminationResult>(
        (c) => UpsertExaminationResult(
          examinationResultRepository: c<ExaminationResultRepository>(),
        ),
      )
      ..registerSingleton<GetExaminationResults>(
        (c) => GetExaminationResults(
          examinationResultRepository: c<ExaminationResultRepository>(),
        ),
      )

      /// Point History
      ..registerSingleton<PointHistoryLocalDataSource>(
        (c) => PointHistoryLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<PointHistoryRepository>(
        (c) => PointHistoryRepositoryImpl(
          userId: c<UserId>(),
          pointHistoryLocalDataSource: c<PointHistoryLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetPointHistories>(
        (c) => GetPointHistories(
          pointHistoryRepository: c<PointHistoryRepository>(),
        ),
      )
      ..registerSingleton<InitPointHistorySubscription>(
        (c) => InitPointHistorySubscription(
          pointHistoryRepository: c<PointHistoryRepository>(),
        ),
      );
  }
}
