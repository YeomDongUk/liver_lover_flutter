// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/hospital_visit_schedule_calendar.dart';

class HospitalVisitScheduleCalendarPage extends StatefulWidget {
  const HospitalVisitScheduleCalendarPage({super.key});

  @override
  State<HospitalVisitScheduleCalendarPage> createState() =>
      _HospitalVisitScheduleCalendarPageState();
}

class _HospitalVisitScheduleCalendarPageState
    extends State<HospitalVisitScheduleCalendarPage> {
  late final DateTime firstDay;
  late final PageController pageController;
  late final int lastPageIndex;
  late int pageIndex;
  DateTime? selectedDate;
  void Function(void Function())? _setState;

  @override
  void initState() {
    final now = DateTime.now();
    final lastReservedAt = context
        .read<HospitalVisitSchedulesCubit>()
        .state
        .hospitalVisitSchedules
        .lastOrNull
        ?.reservedAt;

    firstDay = context.read<AuthCubit>().state.user.createdAt!;

    pageIndex = (now.year - firstDay.year) * 12 + now.month - firstDay.month;

    lastPageIndex = lastReservedAt == null
        ? 0
        : (lastReservedAt.year - firstDay.year) * 12 +
            lastReservedAt.month -
            firstDay.month;

    pageController = PageController(
      initialPage: pageIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('외래/검진 이력'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 68,
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: StatefulBuilder(
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
                              yyyyMMFormat.format(
                                DateTime(
                                  firstDay.year,
                                  firstDay.month + pageIndex,
                                ),
                              ),
                              style: GoogleFonts.lato(
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: pageIndex >= lastPageIndex
                              ? null
                              : () => pageController.jumpToPage(pageIndex + 1),
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
            const SizedBox(height: 24),
            ExpandablePageView.builder(
              allowImplicitScrolling: true,
              controller: pageController,
              onPageChanged: (value) =>
                  _setState?.call(() => pageIndex = value),
              itemCount: lastPageIndex + 1,
              itemBuilder: (context, index) => BlocBuilder<
                  HospitalVisitSchedulesCubit, HospitalVisitSchedulesState>(
                builder: (context, state) => HospitalVisitScheduleCalendar(
                  onTap: (selectedDate) {
                    setState(
                      () => this.selectedDate =
                          this.selectedDate == selectedDate
                              ? null
                              : selectedDate,
                    );
                  },
                  selectedDate: selectedDate,
                  firstDateOfMonth: DateTime(
                    firstDay.year,
                    firstDay.month + index,
                  ),
                  hospitalVisitSchedules: state.hospitalVisitSchedules,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: AppColors.lightGray),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _HospitalVisitScheduleStatusWidget(
                    status: HospitalVisitScheduleStatus.done,
                  ),
                  SizedBox(width: 24),
                  _HospitalVisitScheduleStatusWidget(
                    status: HospitalVisitScheduleStatus.wating,
                  ),
                  SizedBox(width: 24),
                  _HospitalVisitScheduleStatusWidget(
                    status: HospitalVisitScheduleStatus.inProgress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HospitalVisitScheduleStatusWidget extends StatelessWidget {
  const _HospitalVisitScheduleStatusWidget({
    super.key,
    required this.status,
  });

  final HospitalVisitScheduleStatus status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: status.color,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          status.text,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoB,
        ),
      ],
    );
  }
}
