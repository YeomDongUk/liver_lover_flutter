// Dart imports:
import 'dart:async';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Project imports:
import 'package:yak/core/local_notification/local_notification.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/icon.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/health_questions/health_questions_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/metabolic_disease/metabolic_disease_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/bloc/user_point/user_point_cubit.dart';
import 'package:yak/presentation/page/home/screens/examination_result/examination_result_screen.dart';
import 'package:yak/presentation/page/home/screens/health_diary/health_diary_screen.dart';
import 'package:yak/presentation/page/home/screens/health_information/health_information_screen.dart';
import 'package:yak/presentation/page/home/screens/home_screen.dart';
import 'package:yak/presentation/page/home/screens/hospital_visit_schedule/hospital_visit_schedules_screen.dart';
import 'package:yak/presentation/page/home/screens/medication_management/medication_management_screen.dart';
import 'package:yak/presentation/widget/home/global_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  late final HospitalVisitSchedulesCubit _hospitalVisitSchedulesCubit;
  late final SurveyGroupsCubit _surveyGroupsCubit;
  late final MetabolicDiseaseCubit _metabolicDiseaseCubit;
  late final ItemScrollController _itemcrollController;
  late final UserPointCubit _userPointCubit;
  late final HealthQuestionsCubit _healthQuestionsCubit;
  late final _localNotification = KiwiContainer().resolve<LocalNotification>();
  StreamSubscription? _notificationSubscription;

  @override
  void initState() {
    _pageController = PageController(initialPage: 5);

    _hospitalVisitSchedulesCubit = context.read<HospitalVisitSchedulesCubit>();
    // _medicationSchedulesCubit = context.read<MedicationSchedulesCubit>();

    _surveyGroupsCubit = context.read<SurveyGroupsCubit>()..loadSurveyGroups();
    _metabolicDiseaseCubit = context.read<MetabolicDiseaseCubit>()..loadMetabolicDisease();
    _userPointCubit = context.read<UserPointCubit>()..loadUserPoint();

    _itemcrollController = ItemScrollController();
    _healthQuestionsCubit = context.read<HealthQuestionsCubit>();

    _localNotification.requestPermission();

    _hospitalVisitSchedulesCubit.loadSchedules();

    _localNotification.setListeners(onActionReceivedMethod: NotificationController.onActionReceivedMethod);

    super.initState();
  }

  @override
  void dispose() {
    _hospitalVisitSchedulesCubit.onLogout();
    _surveyGroupsCubit.onLogout();
    _metabolicDiseaseCubit.onLogout();
    _healthQuestionsCubit.onLogout();
    _userPointCubit.onLogout();
    _notificationSubscription?.cancel();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ListenableProvider<PageController>.value(
            value: _pageController,
          ),
          Provider<ItemScrollController>.value(
            value: _itemcrollController,
          ),
        ],
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            MedicationManagementScreen(),
            HospitalVisitSchedulesScreen(),
            ExaminationResultScreen(),
            HealthDiaryScreen(),
            HealthInformationScreen(),
            HomeScreen(),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        buttonSize: const Size(36, 36),
        childrenButtonSize: const Size(36, 36),
        childMargin: EdgeInsets.zero,
        childPadding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.6,
        spaceBetweenChildren: 8,
        children: [
          SpeedDialChild(
            onTap: () => context.beamToNamed('/prescriptions/create'),
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.scan,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '????????? ??????',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () => context.beamToNamed(Routes.medicationSchedulesCreate),
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.medication,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '???????????? ??????',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () => context.beamToNamed(Routes.hospitalVisitScheduleCreate),
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.hospitalVisit,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '???????????? ??????',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () => context.beamToNamed(Routes.healthQuestionCreate),
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.question,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '?????? ??????',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
        ],
        animationAngle: pi / 1.35,
        activeChild: SvgPicture.asset(
          'assets/svg/fab.svg',
          width: 28,
          height: 28,
        ),
        child: SvgPicture.asset(
          'assets/svg/fab.svg',
          width: 28,
          height: 28,
        ),
      ),
      bottomNavigationBar: GlobalNavigationBar(pageController: _pageController),
    );
  }
}
