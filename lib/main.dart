// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/di/di.dart';
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/router/auth_location.dart';
import 'package:yak/core/router/drinking_history_location.dart';
import 'package:yak/core/router/examination_result_location.dart';
import 'package:yak/core/router/excercise_history_location.dart';
import 'package:yak/core/router/health_question_location.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/hospital_visit_schedule_location.dart';
import 'package:yak/core/router/medication_adherence_survey_location.dart';
import 'package:yak/core/router/medication_schedule_location.dart';
import 'package:yak/core/router/my_location.dart';
import 'package:yak/core/router/point_location.dart';
import 'package:yak/core/router/prescription_location.dart';
import 'package:yak/core/router/sf_12_survey_location.dart';
import 'package:yak/core/router/smoking_history_location.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/domain/usecases/health_question/delete_health_question.dart';
import 'package:yak/domain/usecases/health_question/get_health_questions.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/delete_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/toggle_hospital_visit_schedule_push.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/metabolic_disease/get_metabolic_disease.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/domain/usecases/user_point/get_user_point.dart';
import 'package:yak/firebase_options.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/health_questions/health_questions_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/metabolic_disease/metabolic_disease_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/bloc/user_point/user_point_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Di.setup(false);
  await KiwiContainer().resolve<LocalNotification>().initialize();
  // await Hive.initFlutter();
  await initializeDateFormatting();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 30),
      minimumFetchInterval: Duration.zero,
    ),
  );

  runApp(const YackApp());
}

class YackApp extends StatelessWidget {
  const YackApp({super.key});

  static final routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        guardNonMatching: true,
        pathPatterns: [
          '/auth',
          '/auth/*',
        ],
        check: (context, state) =>
            context.read<AuthCubit>().state.user.id != '-',
        beamToNamed: (context, target) => '/auth',
      ),
    ],
    initialPath: '/auth',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
        AuthLocation(),
        PrescriptionLocation(),
        MedicationScheduleLocation(),
        HospitalVisitScheduleLocation(),
        SF12SurveyLocation(),
        MyLocation(),
        PointLocation(),
        HealthQuestionLocation(),
        DrinkingHistoryLocation(),
        MedicationAdherenceSurveyLocation(),
        SmokingHistoryLocation(),
        ExcerciseHistoryLocation(),
        ExaminationResultLocation(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) =>
              AuthCubit(KiwiContainer().resolve<UserId>() as UserIdImpl),
          lazy: false,
        ),
        BlocProvider<CurrentTimeCubit>(
          create: (_) => CurrentTimeCubit(),
          lazy: false,
        ),
        BlocProvider<HospitalVisitSchedulesCubit>(
          create: (_) => HospitalVisitSchedulesCubit(
            getHospitalVisitSchedulesStream:
                KiwiContainer().resolve<GetHospitalVisitSchedulesStream>(),
            updateHospitalVisitSchedule:
                KiwiContainer().resolve<UpdateHospitalVisitSchedule>(),
            toggleHospitalVisitSchedulePush:
                KiwiContainer().resolve<ToggleHospitalVisitSchedulePush>(),
            deleteHospitalVisitSchedule:
                KiwiContainer().resolve<DeleteHospitalVisitSchedule>(),
          ),
        ),
        BlocProvider<SurveyGroupsCubit>(
          create: (_) => SurveyGroupsCubit(
            getSurveyGroupHistories:
                KiwiContainer().resolve<GetSurveyGroupHistories>(),
          ),
        ),
        BlocProvider<MetabolicDiseaseCubit>(
          create: (context) => MetabolicDiseaseCubit(
            getMetabolicDisease: KiwiContainer().resolve<GetMetabolicDisease>(),
          ),
        ),
        BlocProvider<UserPointCubit>(
          create: (context) => UserPointCubit(
            getUserPoint: KiwiContainer().resolve<GetUserPoint>(),
          ),
        ),
        BlocProvider<HealthQuestionsCubit>(
          create: (context) => HealthQuestionsCubit(
            getHealthQuestions: KiwiContainer().resolve<GetHealthQuestions>(),
            deleteHealthQuestion:
                KiwiContainer().resolve<DeleteHealthQuestion>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        themeMode: ThemeMode.light,
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: AppColors.primary,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              color: AppColors.primary,
            ).rixMGoB,
            unselectedItemColor: AppColors.gray,
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              color: AppColors.gray,
            ).rixMGoB,
          ),
          textTheme: const TextTheme(),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ).rixMGoB,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          dividerTheme: DividerThemeData(
            color: AppColors.blueGrayLight.withOpacity(0.4),
            thickness: 1,
            space: 1,
          ),
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.paleGray,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.primary,
              fixedSize: const Size.fromHeight(70),
              textStyle: const TextStyle(
                color: Colors.white,
              ).rixMGoEB,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: AppColors.primary,
            labelStyle: const TextStyle(
              fontSize: 16,
            ).rixMGoB,
            unselectedLabelColor: AppColors.gray,
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
            ).rixMGoB,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primary,
                  width: 4,
                ),
              ),
            ),
          ),
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
            boldText: false,
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}
