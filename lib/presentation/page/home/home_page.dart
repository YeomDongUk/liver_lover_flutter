import 'dart:math';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/icon.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/medication_schedules_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/today/today_medication_schedules_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/page/home/hoem_screen.dart';
import 'package:yak/presentation/page/home/hospital_visit_schedules_screen.dart';
import 'package:yak/presentation/page/medication_management/medication_management_screen.dart';

import 'package:yak/presentation/widget/home/global_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  late final HospitalVisitSchedulesCubit _hospitalVisitSchedulesCubit;
  late final MedicationSchedulesCubit _medicationSchedulesCubit;
  late final TodayMedicationSchedulesCubit _todayMedicationSchedulesCubit;
  late final SurveyGroupsCubit _surveyGroupsCubit;
  late final ItemScrollController _itemcrollController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 5);

    _hospitalVisitSchedulesCubit = context.read<HospitalVisitSchedulesCubit>()
      ..loadSchedules();
    _medicationSchedulesCubit = context.read<MedicationSchedulesCubit>()
      ..loadSchedules();
    _todayMedicationSchedulesCubit =
        context.read<TodayMedicationSchedulesCubit>()..loadSchedules();
    _surveyGroupsCubit = context.read<SurveyGroupsCubit>()..loadSurveyGroups();
    _itemcrollController = ItemScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _hospitalVisitSchedulesCubit.onLogout();
    _medicationSchedulesCubit.onLogout();
    _todayMedicationSchedulesCubit.onLogout();
    _surveyGroupsCubit.onLogout();
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
          children: [
            const MedicationManagementScreen(),
            const HospitalVisitSchedulesScreen(),
            Container(),
            Container(),
            Container(),
            const HomeScreen(),
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
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.scan,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '처방전 스캔',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.medication,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '복약일정 등록',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ).rixMGoB,
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () =>
                context.beamToNamed(Routes.hospitalVisitScheduleCreate),
            backgroundColor: Colors.white,
            child: Icon(
              IconDatas.hospitalVisit,
              size: 19,
              color: Theme.of(context).primaryColor,
            ),
            labelWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '진료 일정등록',
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
      bottomNavigationBar: GlobalNavigationBar(
        pageController: _pageController,
      ),
    );
  }
}
