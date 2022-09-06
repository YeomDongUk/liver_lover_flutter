import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_daily_group.dart';
import 'package:yak/presentation/bloc/auth/auth_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_schedule_calendar.dart';

class MedicationScheduleCalendarPage extends StatefulWidget {
  const MedicationScheduleCalendarPage({super.key});

  @override
  State<MedicationScheduleCalendarPage> createState() =>
      _MedicationScheduleCalendarPageState();
}

class _MedicationScheduleCalendarPageState
    extends State<MedicationScheduleCalendarPage> {
  bool? isLoading;
  late final DateTime firstDay;
  late final PageController pageController;
  late final int lastPageIndex;
  late int pageIndex;
  late final DateTime? lastestSchduleDateTime;
  void Function(void Function())? _setState;
  DateTime? selectedDate;

  @override
  void initState() {
    initCalendar();
    super.initState();
  }

  Future<void> initCalendar() async {
    setState(() => isLoading = true);
    lastestSchduleDateTime = await KiwiContainer()
        .resolve<MedicationScheduleLocalDataSource>()
        .getLastMedicationSchedule(
          userId: KiwiContainer().resolve<UserId>().value,
        );

    if (!mounted) return;

    final now = DateTime.now();

    final lastReservedAt = lastestSchduleDateTime;

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

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    if (isLoading == false) {
      pageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('복약이력'),
      ),
      body: SafeArea(
        child: isLoading != false
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) {
                      _setState = setState;
                      return SizedBox(
                        height: 68,
                        child: Material(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: pageIndex < 1
                                    ? null
                                    : () => pageController
                                        .jumpToPage(pageIndex - 1),
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
                                    : () => pageController
                                        .jumpToPage(pageIndex + 1),
                                icon: SvgPicture.asset(
                                  'assets/svg/right.svg',
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Provider<DateTime? Function()>.value(
                    value: () => selectedDate,
                    child: Provider<void Function(DateTime)>.value(
                      value: (DateTime dateTime) => setState(
                        () => selectedDate =
                            dateTime == selectedDate ? null : dateTime,
                      ),
                      child: ExpandablePageView.builder(
                        allowImplicitScrolling: true,
                        controller: pageController,
                        onPageChanged: (value) =>
                            _setState?.call(() => pageIndex = value),
                        itemCount: lastPageIndex + 1,
                        itemBuilder: (context, index) =>
                            MedicationScheduleCalendar(
                          firstDateOfMonth: DateTime(
                            firstDay.year,
                            firstDay.month + index,
                          ),
                        ),
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
                        _MedicationScheduleStatusWidget(
                          status: MedicationScheduleDailyGroupStatus.done,
                        ),
                        SizedBox(width: 24),
                        _MedicationScheduleStatusWidget(
                          status: MedicationScheduleDailyGroupStatus.partitial,
                        ),
                        SizedBox(width: 24),
                        _MedicationScheduleStatusWidget(
                          status: MedicationScheduleDailyGroupStatus.none,
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

class _MedicationScheduleStatusWidget extends StatelessWidget {
  const _MedicationScheduleStatusWidget({
    super.key,
    required this.status,
  });

  final MedicationScheduleDailyGroupStatus status;

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
