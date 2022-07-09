import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/di/di.dart';
import 'package:yak/core/router/auth_location.dart';
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/hospital_visit_schedule_location.dart';
import 'package:yak/core/router/medication_schedule_location.dart';
import 'package:yak/core/router/prescription_location.dart';
import 'package:yak/core/router/sf_12_survey_location.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/get_hospital_visit_schedules.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedules.dart';
import 'package:yak/domain/usecases/medication_schedule/get_today_medication_schedules.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_histories.dart';
import 'package:yak/domain/usecases/survey/get_survey_group_history.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/medication_schedules_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/today/today_medication_schedules_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Di.setup(false);

  // await Hive.initFlutter();
  runApp(YackApp());
}

class YackApp extends StatelessWidget {
  YackApp({super.key});

  final routerDelegate = BeamerDelegate(
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
            getHospitalVisitSchedule:
                KiwiContainer().resolve<GetHospitalVisitSchedule>(),
            getHospitalVisitSchedules:
                KiwiContainer().resolve<GetHospitalVisitSchedules>(),
            updateHospitalVisitSchedule:
                KiwiContainer().resolve<UpdateHospitalVisitSchedule>(),
          ),
        ),
        BlocProvider<MedicationSchedulesCubit>(
          create: (_) => MedicationSchedulesCubit(
              // KiwiContainer().resolve<GetMedicationSchedules>(),
              ),
        ),
        BlocProvider<TodayMedicationSchedulesCubit>(
          create: (_) => TodayMedicationSchedulesCubit(
            KiwiContainer().resolve<GetTodayMedicationSchedules>(),
          ),
        ),
        BlocProvider<SurveyGroupsCubit>(
          create: (_) => SurveyGroupsCubit(
            getSurveyGroupHistory:
                KiwiContainer().resolve<GetSurveyGroupHistory>(),
            getSurveyGroupHistories:
                KiwiContainer().resolve<GetSurveyGroupHistories>(),
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
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: AppColors.paleGray,
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
              primary: AppColors.primary,
              textStyle: const TextStyle(
                color: Colors.white,
              ).rixMGoEB,
            ),
          ),
        ),
      ),
    );
  }
}
