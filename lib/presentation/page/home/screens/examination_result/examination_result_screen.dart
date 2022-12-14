// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:table_calendar/table_calendar.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/examination_result/get_examination_results.dart';
import 'package:yak/domain/usecases/examination_result/upsert_examination_result.dart';
import 'package:yak/presentation/bloc/calendar/calendar_cubit.dart';
import 'package:yak/presentation/bloc/examination_result/examination_results_cubit.dart';
import 'package:yak/presentation/bloc/examination_result/result/examination_result_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/weekly_table_calendar.dart';
import 'package:yak/presentation/widget/examination_result/examination_result_dialog.dart';

class ExaminationResultScreen extends StatefulWidget {
  const ExaminationResultScreen({super.key});

  @override
  State<ExaminationResultScreen> createState() =>
      _ExaminationResultScreenState();
}

class _ExaminationResultScreenState extends State<ExaminationResultScreen> {
  late final CalendarCubit calendarCubit;
  late final ExaminationResultsCubit examinationResultsCubit;
  late final ExaminationResultCubit examinationResultCubit;

  @override
  void initState() {
    final now = DateTime.now();
    final focusDate = DateTime(now.year, now.month, now.day)
        .add(Duration(days: -(now.weekday % 7)));

    calendarCubit = CalendarCubit(
      now: DateTime(now.year, now.month, now.day),
      focusDate: focusDate,
    );

    examinationResultsCubit = ExaminationResultsCubit(
      getExaminationResults: KiwiContainer().resolve<GetExaminationResults>(),
    )..load(
        BetweenDateTime(
          start: focusDate,
          end: focusDate.add(const Duration(days: 6)),
        ),
      ).then(
        (value) => examinationResultCubit.updateExaminationResult(
          date: DateTime(now.year, now.month, now.day),
          examinationResult:
              examinationResultsCubit.state.examinationResults.firstWhereOrNull(
            (element) => element.date == DateTime(now.year, now.month, now.day),
          ),
        ),
      );

    examinationResultCubit = ExaminationResultCubit(
      upsertExaminationResult:
          KiwiContainer().resolve<UpsertExaminationResult>(),
    );

    super.initState();
  }

  @override
  void dispose() {
    calendarCubit.close();
    examinationResultsCubit.close();
    examinationResultCubit.close();
    super.dispose();
  }

  Future<void> onSavePlatelet(double platelet) async {
    await examinationResultCubit.updatePlatelet(
      platelet,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveAst(double ast) async {
    await examinationResultCubit.updateAst(
      ast,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveAlt(double alt) async {
    await examinationResultCubit.updateAlt(
      alt,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveGgt(double ggt) async {
    await examinationResultCubit.updateGgt(
      ggt,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveBilirubin(double bilirubin) async {
    await examinationResultCubit.updateBilirubin(
      bilirubin,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveAlbumin(double albumin) async {
    await examinationResultCubit.updateAlbumin(
      albumin,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveHbvDna(double hbvDna) async {
    await examinationResultCubit.updateHbvDna(
      hbvDna,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveHcvRna(double hcvRna) async {
    await examinationResultCubit.updateHcvRna(
      hcvRna,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveAfp(double afp) async {
    await examinationResultCubit.updateAfp(
      afp,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveDangerousNodule(String dangerousNodule) async {
    await examinationResultCubit.updateDangerousNodule(
      dangerousNodule,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  Future<void> onSaveBenignTumor(String benignTumor) async {
    await examinationResultCubit.updateBenignTumor(
      benignTumor,
    );

    examinationResultsCubit.add(
      examinationResultCubit.state.examinationResult!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('????????????'),
        leading: IconButton(
          onPressed: () => context.read<PageController>().jumpToPage(5),
          icon: SvgPicture.asset('assets/svg/home.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed(Routes.my),
            icon: SvgPicture.asset('assets/svg/my_info.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            BlocBuilder<CalendarCubit, CalendarState>(
              bloc: calendarCubit,
              builder: (context, calendarState) =>
                  BlocBuilder<ExaminationResultsCubit, ExaminationResultsState>(
                bloc: examinationResultsCubit,
                builder: (context, state) => WeeklyTableCalendar(
                  firstDay: calendarCubit.firstDay,
                  focusedDay: calendarCubit.state.focusDate,
                  currentDay: calendarCubit.state.selectedDate,
                  singleMarkerBuilder: (context, day, event) =>
                      SvgPicture.asset(
                    'assets/svg/water.svg',
                    color: AppColors.magenta,
                  ),
                  eventLoader: (dateTime) => state.examinationResults
                      .map(
                        (e) =>
                            yyyyMMddFormat.format(e.date) ==
                            yyyyMMddFormat.format(dateTime),
                      )
                      .toList()
                      .where((element) => element == true)
                      .toList(),
                  selectedDayPredicate: (day) =>
                      day == calendarState.selectedDate,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(calendarState.selectedDate, selectedDay)) {
                      calendarCubit.updateSelectDate(selectedDay);
                      final examinationResult = examinationResultsCubit
                          .state.examinationResults
                          .firstWhereOrNull(
                        (element) => element.date == selectedDay,
                      );

                      examinationResultCubit.updateExaminationResult(
                        date: selectedDay,
                        examinationResult: examinationResult,
                      );
                    }
                  },
                  onPageChanged: (dateTime) {
                    final startDate = dateTime.add(
                      Duration(
                        days: -(dateTime.weekday == 7 ? 0 : dateTime.weekday),
                      ),
                    );

                    calendarCubit.updateFocusDate(
                      startDate.isBefore(calendarCubit.firstDay)
                          ? calendarCubit.firstDay
                          : startDate,
                    );
                    examinationResultsCubit.load(
                      BetweenDateTime(
                        start: startDate,
                        end: startDate.add(const Duration(days: 6)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ExaminationResultCubit, ExaminationResultState>(
              bloc: examinationResultCubit,
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonShadowBox(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            '????????????',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),

                        /// ?????????
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '?????????',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '?????????',
                                            unitText: '/mm',
                                            onSaved: onSavePlatelet,
                                          ),
                                        ),
                                        child: state.examinationResult
                                                    ?.platelet ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!
                                                      .platelet,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'X10',
                                        ),
                                        WidgetSpan(
                                          alignment: PlaceholderAlignment.top,
                                          child: Transform.translate(
                                            offset: const Offset(0, 2),
                                            child: const Text(
                                              '3',
                                              style: TextStyle(
                                                fontSize: 6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '/mm',
                                        ),
                                        WidgetSpan(
                                          alignment: PlaceholderAlignment.top,
                                          child: Transform.translate(
                                            offset: const Offset(0, 2),
                                            child: const Text(
                                              '2',
                                              style: TextStyle(
                                                fontSize: 6,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// ??? ??????(AST)
                              Row(
                                children: [
                                  Text(
                                    '?????????(AST)',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '?????????(AST)',
                                            unitText: 'IU/L',
                                            onSaved: onSaveAst,
                                          ),
                                        ),
                                        child: state.examinationResult?.ast ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!.ast,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      text: 'IU/L',
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// ??? ??????(ALT)
                              Row(
                                children: [
                                  Text(
                                    '?????????(ALT)',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '?????????(AST)',
                                            unitText: 'IU/L',
                                            onSaved: onSaveAlt,
                                          ),
                                        ),
                                        child: state.examinationResult?.alt ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!.alt,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      text: 'IU/L',
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Text(
                                    '?????????(GGT)',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '?????????(GGT)',
                                            unitText: 'IU/L',
                                            onSaved: onSaveGgt,
                                          ),
                                        ),
                                        child: state.examinationResult?.ggt ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!.ggt,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      text: 'IU/L',
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// ????????????
                              Row(
                                children: [
                                  Text(
                                    '????????????',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '????????????',
                                            unitText: 'mg/dL',
                                            onSaved: onSaveBilirubin,
                                          ),
                                        ),
                                        child: state.examinationResult
                                                    ?.bilirubin ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!
                                                      .bilirubin,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      text: 'mg/dL',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// ?????????
                              Row(
                                children: [
                                  Text(
                                    '?????????',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (_) =>
                                              UpsertNumberExaminationResultDialog(
                                            text: '?????????',
                                            unitText: 'g/dL',
                                            onSaved: onSaveAlbumin,
                                          ),
                                        ),
                                        child: state.examinationResult
                                                    ?.albumin ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!
                                                      .albumin,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      text: 'g/dL',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// HBV DNA
                              Row(
                                children: [
                                  Text(
                                    'HBV DNA',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  if (state.examinationResult?.hbvDna !=
                                      null) ...[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          numberForamt.format(
                                            state.examinationResult!.hbvDna,
                                          ),
                                          style: GoogleFonts.lato(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.blueGrayDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        text: 'IU/mL',
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                  ] else
                                    const Spacer(),
                                  CommonSwitch(
                                    value:
                                        state.examinationResult?.hbvDna != null,
                                    onToggle: (value) => value
                                        ? showDialog<void>(
                                            context: context,
                                            builder: (_) =>
                                                UpsertNumberExaminationResultDialog(
                                              text: 'HBV DNA',
                                              unitText: 'IU/mL',
                                              onSaved: onSaveHbvDna,
                                            ),
                                          )
                                        : examinationResultCubit
                                            .updateHbvDna(null),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// HCV RNA
                              Row(
                                children: [
                                  Text(
                                    'HCV RNA',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  if (state.examinationResult?.hcvRna !=
                                      null) ...[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: state.examinationResult
                                                    ?.hcvRna ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!
                                                      .hcvRna,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        text: 'IU/mL',
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                  ] else
                                    const Spacer(),
                                  CommonSwitch(
                                    value:
                                        state.examinationResult?.hcvRna != null,
                                    onToggle: (value) => value
                                        ? showDialog<void>(
                                            context: context,
                                            builder: (_) =>
                                                UpsertNumberExaminationResultDialog(
                                              text: 'HCV RNA',
                                              unitText: 'IU/mL',
                                              onSaved: onSaveHcvRna,
                                            ),
                                          )
                                        : examinationResultCubit
                                            .updateHcvRna(null),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// AFP
                              Row(
                                children: [
                                  Text(
                                    '??????????????????(AFP)',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  if (state.examinationResult?.afp != null) ...[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: state.examinationResult?.afp ==
                                                null
                                            ? SvgPicture.asset(
                                                'assets/svg/add.svg',
                                              )
                                            : Text(
                                                numberForamt.format(
                                                  state.examinationResult!.afp,
                                                ),
                                                style: GoogleFonts.lato(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blueGrayDark,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        text: 'ng/mL',
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                  ] else
                                    const Spacer(),
                                  CommonSwitch(
                                    value: state.examinationResult?.afp != null,
                                    onToggle: (value) => value
                                        ? showDialog<void>(
                                            context: context,
                                            builder: (_) =>
                                                UpsertNumberExaminationResultDialog(
                                              text: '??????????????????(AFP)',
                                              unitText: 'ng/mL',
                                              onSaved: onSaveAfp,
                                            ),
                                          )
                                        : examinationResultCubit
                                            .updateAfp(null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// ?????????
                  CommonShadowBox(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            '?????????/CT',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '????????????(?????????, ?????? ???)',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.gray,
                                        ).rixMGoM,
                                      ),
                                      const Spacer(),
                                      CommonSwitch(
                                        value: state.examinationResult
                                                ?.benignTumor !=
                                            null,
                                        onToggle: (value) => value
                                            ? showDialog<void>(
                                                context: context,
                                                builder: (_) =>
                                                    UpsertTextExaminationResultDialog(
                                                  text: '????????????(?????????, ?????? ???)',
                                                  onSaved: onSaveBenignTumor,
                                                ),
                                              )
                                            : examinationResultCubit
                                                .updateBenignTumor(null),
                                      ),
                                    ],
                                  ),
                                  if (state.examinationResult?.benignTumor !=
                                      null) ...[
                                    const SizedBox(height: 12),
                                    Text(
                                      state.examinationResult?.benignTumor ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.blueGrayDark,
                                        height: 1.2,
                                      ).rixMGoM,
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    '????????????',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                    ).rixMGoM,
                                  ),
                                  const Spacer(),
                                  CommonSwitch(
                                    value: state.examinationResult
                                            ?.dangerousNodule !=
                                        null,
                                    onToggle: (value) => value
                                        ? showDialog<void>(
                                            context: context,
                                            builder: (_) =>
                                                UpsertTextExaminationResultDialog(
                                              text: '????????????',
                                              onSaved: onSaveDangerousNodule,
                                            ),
                                          )
                                        : examinationResultCubit
                                            .updateDangerousNodule(null),
                                  ),
                                ],
                              ),
                              if (state.examinationResult?.dangerousNodule !=
                                  null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  state.examinationResult?.dangerousNodule ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.blueGrayDark,
                                    height: 1.2,
                                  ).rixMGoM,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => context.beamToNamed(
                  Routes.examinationResultHistories,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  fixedSize: const Size.fromHeight(60),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ).rixMGoB,
                ),
                child: const Text(
                  '?????? ??????',
                ),
              ),
            ),
            const SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}
