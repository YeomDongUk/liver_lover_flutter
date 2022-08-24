// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/point_history/point_history.dart';
import 'package:yak/domain/usecases/point_history/get_point_histories.dart';
import 'package:yak/presentation/bloc/point_histories/point_histories_cubit.dart';
import 'package:yak/presentation/bloc/user_point/user_point_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class PointHistoryPage extends StatefulWidget {
  const PointHistoryPage({super.key});

  @override
  State<PointHistoryPage> createState() => _PointHistoryPageState();
}

class _PointHistoryPageState extends State<PointHistoryPage> {
  late final PointHistoriesCubit pointHistoriesCubit;

  @override
  void initState() {
    pointHistoriesCubit = PointHistoriesCubit(
      getPointHistories: KiwiContainer().resolve<GetPointHistories>(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    pointHistoriesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('포인트'),
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed(Routes.pointInformation),
            icon: SvgPicture.asset('assets/svg/icon_info.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: CommonShadowBox(
          margin: const EdgeInsets.all(24),
          child: BlocBuilder<PointHistoriesCubit, PointHistoriesState>(
            bloc: pointHistoriesCubit,
            builder: (context, state) => ListView.separated(
              itemCount: state.pointHistories.length + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) => index == 0
                  ? BlocBuilder<UserPointCubit, UserPointState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: SvgPicture.asset(
                                        'assets/svg/icon_${state.userPoint?.grade.toLowerCase() ?? ''}.svg',
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.userPoint?.grade ?? '',
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      color: AppColors.gray,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.lato(
                                  fontSize: 50,
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${state.userPoint?.point ?? 0}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
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
                    )
                  : PointHistoryTile(
                      pointHistory: state.pointHistories[index - 1],
                    ),
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ),
      ),
    );
  }
}

class PointHistoryTile extends StatelessWidget {
  const PointHistoryTile({
    super.key,
    required this.pointHistory,
  });
  final PointHistory pointHistory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 21,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  pointHistory.event.text,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColors.blueGrayDark,
                  ).rixMGoB,
                ),
                const SizedBox(height: 1),
                Text(
                  reservedAtDateFormat.format(pointHistory.createdAt),
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.lato(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                  text: '${pointHistory.point}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
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
    );
  }
}
