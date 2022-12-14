// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/domain/entities/medication_schedule/medication_adherenece_percent.dart';
import 'package:yak/domain/usecases/drinking_history/get_last_drinking_history_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_groups_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/domain/usecases/smoking_history/get_last_smoking_history_stream.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/medication_schedules_groups_cubit.dart';
import 'package:yak/presentation/bloc/today_diary/today_diary_cubit.dart';
import 'package:yak/presentation/bloc/user_point/user_point_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/custom_progress_bar_painter.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/recent_test_result_view.dart';
import 'package:yak/presentation/widget/home/home_screen/survey_check_view.dart';
import 'package:yak/presentation/widget/home/home_screen/today_diary_page_view.dart';
import 'package:yak/presentation/widget/home/home_screen/today_medication_schedule_page_view.dart';
import 'package:yak/presentation/widget/home/home_screen/upcoming_hospital_visit_schedule_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final TodayDiaryCubit todayDiaryCubit;
  late final simpleCommonSense =
      simpleCommonSenses[Random().nextInt(simpleCommonSenses.length - 1)];
  late final MedicationScheduleGroupsCubit medicationScheduleGroupsCubit;
  @override
  void initState() {
    todayDiaryCubit = TodayDiaryCubit(
      getLastDrinkingHistoryStream:
          KiwiContainer().resolve<GetLastDrinkingHistoryStream>(),
      getLastSmokingHistoryStream:
          KiwiContainer().resolve<GetLastSmokingHistoryStream>(),
    )..startListening();
    medicationScheduleGroupsCubit = MedicationScheduleGroupsCubit(
      getMedicationScheduleGroupsStream:
          KiwiContainer().resolve<GetMedicationScheduleGroupsStream>(),
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    )..load(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    todayDiaryCubit.close();
    medicationScheduleGroupsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                AppBar(
                  backgroundColor: AppColors.paleGray,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 20).airbnbBl,
                      children: [
                        const TextSpan(
                          text: 'LIVER',
                          style: TextStyle(color: AppColors.magenta),
                        ),
                        TextSpan(
                          text: 'LOVER',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => context.beamToNamed(Routes.my),
                      icon: SvgPicture.asset('assets/svg/my_info.svg'),
                    ),
                  ],
                ),
                Semantics(
                  button: true,
                  child: Material(
                    color: AppColors.paleGray,
                    child: InkWell(
                      onTap: () => context.beamToNamed(Routes.pointHistory),
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<UserPointCubit, UserPointState>(
                          builder: (context, state) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (state.userPoint != null) ...[
                                SvgPicture.asset(
                                  'assets/svg/icon_${state.userPoint!.grade.toLowerCase()}.svg',
                                  height: 17,
                                ),
                                const SizedBox(width: 8),
                              ],
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.lato(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${state.userPoint?.point ?? 0}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: 'P',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 9, bottom: 24),
                children: [
                  Center(
                    child: BlocBuilder<CurrentTimeCubit, DateTime>(
                      builder: (context, state) => Text(
                        DateFormat('MM.dd').format(state),
                        style: GoogleFonts.lato(
                          fontSize: 40,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) => RichText(
                            text: TextSpan(
                              style: const TextStyle(fontSize: 15).rixMGoB,
                              children: [
                                TextSpan(
                                  text: state.user.name,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: '??? ???????????????.',
                                  style: TextStyle(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          simpleCommonSense,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '?????? ?????? ????????? ???????????? ?????????\n??? ????????? ????????????.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const MedicationAdherenecePercentWidget(),
                  const SizedBox(height: 24),
                  const TodayMedicationSchedulePageView(),
                  const SizedBox(height: 24),
                  const UpcomingHospitalVisitSchedulePageView(),
                  const SizedBox(height: 24),
                  const SurveyCheckView(),
                  const SizedBox(height: 24),
                  const RecentTestResultView(),
                  const SizedBox(height: 24),
                  BlocBuilder<TodayDiaryCubit, TodayDiaryState>(
                    bloc: todayDiaryCubit,
                    builder: (context, state) => TodayDiaryPageView(
                      drinkingHistory: state.drinkingHistory,
                      smokingHistory: state.smokingHistory,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MedicationAdherenecePercentWidget extends StatelessWidget {
  const MedicationAdherenecePercentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MedicationAdherencePercent>(
      initialData: const MedicationAdherencePercent(
        allCount: 0,
        medicatedCount: 0,
        percent: 0,
      ),
      stream: KiwiContainer()
          .resolve<MedicationScheduleLocalDataSource>()
          .getMedicationAdherenecePercent(
            userId: KiwiContainer().resolve<UserId>().value,
          ),
      builder: (context, asyncSnapshot) => CommonShadowBox(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ).copyWith(
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '???????????????',
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.primary,
                    ).rixMGoEB,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${asyncSnapshot.data!.medicatedCount}',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: AppColors.skyBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '/${asyncSnapshot.data!.allCount}',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 8),
                      ),
                      TextSpan(
                        text:
                            '${(asyncSnapshot.data!.percent * 1000).floorToDouble() / 10}%',
                        style: GoogleFonts.lato(
                          fontSize: 28,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomPaint(
              painter: CustomProgressBarPainter(
                percent: asyncSnapshot.data!.percent,
              ),
              child: const SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
