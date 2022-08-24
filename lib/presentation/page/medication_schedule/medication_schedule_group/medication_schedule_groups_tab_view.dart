// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_schedule_group_list_page_view.dart';

class MedicationScheduleGroupsTabView extends StatefulWidget {
  const MedicationScheduleGroupsTabView({super.key});

  @override
  State<MedicationScheduleGroupsTabView> createState() =>
      _MedicationScheduleGroupsTabViewState();
}

class _MedicationScheduleGroupsTabViewState
    extends State<MedicationScheduleGroupsTabView>
    with AutomaticKeepAliveClientMixin {
  late final PageController pageController;
  late final DateTime firstDate;

  late int pageIndex;

  void Function(void Function())? _setState;

  @override
  void initState() {
    final createdAt = context.read<AuthCubit>().state.user.createdAt!;
    final now = DateTime.now();
    firstDate = DateTime(createdAt.year, createdAt.month, createdAt.day);

    pageIndex =
        DateTime(now.year, now.month, now.day).difference(firstDate).inDays;

    pageController = PageController(initialPage: pageIndex);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        SizedBox(
          height: 68,
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: BlocBuilder<CurrentTimeCubit, DateTime>(
              builder: (context, now) => StatefulBuilder(
                builder: (context, setState) {
                  _setState = setState;
                  return Row(
                    children: [
                      IconButton(
                        onPressed: pageIndex < 1
                            ? null
                            : () => pageController.jumpToPage(pageIndex - 1),
                        icon: SvgPicture.asset(
                          'assets/svg/left.svg',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            mmDDFormat.format(
                              firstDate.add(Duration(days: pageIndex)),
                            ),
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              color: firstDate
                                      .add(Duration(days: pageIndex))
                                      .isBefore(
                                        DateTime(
                                          now.year,
                                          now.month,
                                          now.day,
                                        ),
                                      )
                                  ? AppColors.gray
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            pageController.jumpToPage(pageIndex + 1),
                        icon: SvgPicture.asset(
                          'assets/svg/right.svg',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) => _setState?.call(() => pageIndex = value),
            controller: pageController,
            itemBuilder: (context, index) =>
                MedicationScheduleGroupListPageView(
              date: firstDate.add(Duration(days: index)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
