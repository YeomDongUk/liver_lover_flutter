import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:kiwi/kiwi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/hospital_visit_schedule/hospital_visit_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_notification/medication_notification_local_data_source.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/datasources/local/metabolic_disease/metabolic_disease_local_data_source.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/data/datasources/local/sf12_survey/sf_12_survey_answer_local_data_source.dart';
import 'package:yak/data/datasources/local/survey_group/survey_group_local_data_source.dart';
import 'package:yak/data/datasources/local/user/user_local_data_source.dart';
import 'package:yak/data/datasources/remote/pill/pill_remote_data_source.dart';
import 'package:yak/data/repositories/hospital_visit_schedule/hospital_visit_schedule_repository_impl.dart';
import 'package:yak/data/repositories/medication_schedule/medication_schedule_repository_impl.dart';
import 'package:yak/data/repositories/metabolic_disease/metabolic_disease_repository_impl.dart';
import 'package:yak/data/repositories/pill/pill_repository_impl.dart';
import 'package:yak/data/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';
import 'package:yak/data/repositories/survey/survey_group_repository_impl.dart';
import 'package:yak/data/repositories/user/user_repository_impl.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';
import 'package:yak/domain/repositories/metabolic_disease/metabolic_disease_repository.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';
import 'package:yak/domain/repositories/survey/sf_12_survey_answer/sf_12_survey_answer_repository.dart';
import 'package:yak/domain/repositories/survey/survey_group_repository.dart';
import 'package:yak/domain/repositories/user/user_repository.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/medication_schedule/get_today_medication_schedules.dart';
import 'package:yak/domain/usecases/metabolic_disease/get_metabolic_disease.dart';
import 'package:yak/domain/usecases/metabolic_disease/upsert_metabolic_disease.dart';
import 'package:yak/domain/usecases/pill/create_pills.dart';
import 'package:yak/domain/usecases/pill/search_pills.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_history.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/create_sf_12_survey_answers.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/get_sf_12_survey_answers.dart';

import 'package:yak/domain/usecases/user/create_user.dart';
import 'package:yak/domain/usecases/user/get_user.dart';
import 'package:yak/domain/usecases/user/update_pin_code.dart';
import 'package:yak/domain/usecases/user/update_user.dart';

// ignore: unused_element
LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase(
        file,
        logStatements: false,
      );
    });

class Di {
  static Future<void> setup(bool isProduction) async {
    KiwiContainer()
      ..registerInstance<LazyDatabase>(
        // _openConnection(),
        LazyDatabase(() => NativeDatabase.memory(logStatements: true)),
      )
      ..registerSingleton<AppDatabase>(
        (c) => AppDatabase(
          c<LazyDatabase>(),
        ),
      )
      ..registerInstance<UserId>(
        UserIdImpl(),
      )
      ..registerSingleton<LocalNotification>(
        (c) => LocalNotificationImpl(),
      )
      ..registerSingleton<UserLocalDataSource>(
        (c) => UserLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<UserRepository>(
        (c) => UserRepositoryImpl(
          userId: c<UserId>(),
          userLocalDataSource: c<UserLocalDataSource>(),
        ),
      )
      ..registerSingleton<GetUser>(
        (c) => GetUser(
          c<UserRepository>(),
        ),
      )
      ..registerSingleton<CreateUser>(
        (c) => CreateUser(
          c<UserRepository>(),
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
      ..registerSingleton<MedicationNotificationLocalDataSource>(
        (c) => MedicationNotificationLocalDataSourceImpl(
          c<AppDatabase>(),
          c<LocalNotification>(),
        ),
      )
      ..registerSingleton<MedicationInformationLocalDataSource>(
        (c) => MedicationInformationLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<MedicationScheduleLocalDataSource>(
        (c) => MedicationScheduleLocalDataSourceImpl(
          c<AppDatabase>(),
        ),
      )
      ..registerSingleton<MedicationScheduleRepository>(
        (c) => MedicationScheduleRepositoryImpl(
          c<MedicationScheduleLocalDataSource>(),
          c<UserId>(),
        ),
      )
      ..registerSingleton<GetTodayMedicationSchedules>(
        (c) => GetTodayMedicationSchedules(
          c<MedicationScheduleRepository>(),
        ),
      )
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
      ..registerSingleton<CreatePills>(
        (c) => CreatePills(
          c<PillRepository>(),
        ),
      )
      ..registerSingleton<PrescriptionLocalDataSource>(
        (c) => PrescriptionLocalDataSourceImpl(
          c<AppDatabase>(),
          c<MedicationInformationLocalDataSource>(),
          c<MedicationScheduleLocalDataSource>(),
          c<MedicationNotificationLocalDataSource>(),
        ),
      )
      ..registerSingleton<HospitalVisitScheduleLocalDataSource>(
        (c) => HospitalVisitScheduleLocalDataSourceImpl(c<AppDatabase>()),
      )
      ..registerSingleton<HospitalVisitScheduleRepository>(
        (c) => HospitalVisitScheduleRepositoryImpl(
          c<HospitalVisitScheduleLocalDataSource>(),
          c<UserId>(),
        ),
      )
      ..registerSingleton<GetHospitalVisitSchedules>(
        (c) => GetHospitalVisitSchedules(
          c<HospitalVisitScheduleRepository>(),
        ),
      )
      ..registerSingleton<GetHospitalVisitSchedule>(
        (c) => GetHospitalVisitSchedule(
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
      ..registerSingleton<GetSurveyGroupHistory>(
        (c) => GetSurveyGroupHistory(
          surveyGroupRepository: c<SurveyGroupRepository>(),
        ),
      )
      ..registerSingleton<GetSurveyGroupHistories>(
        (c) => GetSurveyGroupHistories(
          surveyGroupRepository: c<SurveyGroupRepository>(),
        ),
      )
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
      );
  }
}
