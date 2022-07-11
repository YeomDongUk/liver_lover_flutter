import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.paleGray,
        elevation: 0,
        leadingWidth: 100,
        leading: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.centerLeft,
          child: Semantics(
            button: true,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => print("?"),
              icon: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '27',
                      style: const TextStyle().airbnbB,
                    ),
                    TextSpan(
                      text: 'P',
                      style: const TextStyle().airbnbBl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
      body: ListView(
        padding: const EdgeInsets.only(top: 9, bottom: 24),
        children: [
          Center(
            child: BlocBuilder<CurrentTimeCubit, DateTime>(
              builder: (context, state) => Text(
                DateFormat('MM.dd').format(state),
                style: const TextStyle(
                  fontSize: 40,
                  color: AppColors.gray,
                ).airbnbB,
              ),
            ),
          ),
          const SizedBox(height: 9),
          HomeContainer(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                          text: '님 반갑습니다.',
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
                  '과로와 음주를 주의하고\n충분한 영양을 섭취하세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ).rixMGoEB,
                ),
                const SizedBox(height: 20),
                Text(
                  '간염 백신 접종과 예방수칙 준수로\n간 건강을 지키세요.',
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
          const TodayMedicationSchedulePageView(),
          const SizedBox(height: 24),
          const UpcomingHospitalVisitSchedulePageView(),
          const SizedBox(height: 24),
          const SurveyCheckView(),
          const SizedBox(height: 24),
          const RecentTestResultView(),
          const SizedBox(height: 24),
          const TodayDiaryPageView(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
