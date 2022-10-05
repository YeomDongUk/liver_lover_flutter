import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';
import 'package:yak/presentation/bloc/examination_result/histories/examination_result_histories_cubit.dart';

class UltrasoundTestHistoriesScreen extends StatefulWidget {
  const UltrasoundTestHistoriesScreen({super.key});

  @override
  State<UltrasoundTestHistoriesScreen> createState() =>
      _UltrasoundTestHistoriesScreenState();
}

class _UltrasoundTestHistoriesScreenState
    extends State<UltrasoundTestHistoriesScreen>
    with AutomaticKeepAliveClientMixin {
  late final ExaminationResultHistoriesCubit examinationResultHistoriesCubit;

  @override
  void initState() {
    examinationResultHistoriesCubit = ExaminationResultHistoriesCubit(
      isBloodTest: false,
      examinationResultRepository:
          KiwiContainer().resolve<ExaminationResultRepository>(),
    )..loadHistories();

    super.initState();
  }

  @override
  void dispose() {
    examinationResultHistoriesCubit.close();
    super.dispose();
  }

  double getTextHeight(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: AppColors.blueGrayDark, fontSize: 13)
            .rixMGoM,
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 114, maxWidth: 114);
    return textPainter.size.height;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<ExaminationResultHistoriesCubit,
        ExaminationResultHistoriesState>(
      bloc: examinationResultHistoriesCubit,
      builder: (context, state) {
        final benignTumorHeight = state.examinationResults.isEmpty
            ? 0.0
            : state.examinationResults
                .map(
                  (result) => getTextHeight(
                    (result.benignTumor ?? '').trim(),
                  ),
                )
                .reduce(max);

        final beginTunorHeaderHeight = getTextHeight(
          '양성종양\n(혈관종, 낭종 등)',
        );

        final benignTumorRowHeight = beginTunorHeaderHeight > benignTumorHeight
            ? beginTunorHeaderHeight
            : benignTumorHeight;

        final dangerousNoduleHeight = state.examinationResults.isEmpty
            ? 0.0
            : state.examinationResults
                .map(
                  (result) => getTextHeight(
                    (result.dangerousNodule ?? '').trim(),
                  ),
                )
                .reduce(max);

        final dangerousNoduleHeaderHeight = getTextHeight(
          '위험결절',
        );

        final dangerousNoduleRowHeight =
            dangerousNoduleHeaderHeight > dangerousNoduleHeight
                ? dangerousNoduleHeaderHeight
                : dangerousNoduleHeight;

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height:
                benignTumorRowHeight + 32 + dangerousNoduleRowHeight + 32 + 71,
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 122,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 68.5,
                        padding: const EdgeInsets.only(left: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '구분',
                          style: const TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ).rixMGoM,
                        ),
                      ),
                      const Divider(),
                      Builder(
                        builder: (context) => Container(
                          margin: const EdgeInsets.all(16),
                          height: benignTumorRowHeight,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '양성종양\n(혈관종, 낭종 등)',
                            style: const TextStyle(
                              color: AppColors.gray,
                              fontSize: 13,
                            ).rixMGoM,
                          ),
                        ),
                      ),
                      const Divider(),
                      Builder(
                        builder: (context) => Container(
                          margin: const EdgeInsets.all(16),
                          height: dangerousNoduleRowHeight,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '위험결절',
                            style: const TextStyle(
                              color: AppColors.gray,
                              fontSize: 13,
                            ).rixMGoM,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.examinationResults.length,
                    itemBuilder: (context, index) {
                      final resultHistory = state.examinationResults[index];
                      return Row(
                        children: [
                          SizedBox(
                            width: 146,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 68.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${resultHistory.date.year}',
                                        style: GoogleFonts.lato(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        mmDDFormat.format(resultHistory.date),
                                        style: GoogleFonts.lato(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Builder(
                                  builder: (context) => Container(
                                    margin: const EdgeInsets.all(16),
                                    height: benignTumorRowHeight,
                                    alignment: Alignment.center,
                                    child: Text(
                                      (resultHistory.benignTumor ?? '').trim(),
                                      style: const TextStyle(
                                        color: AppColors.blueGrayDark,
                                        fontSize: 13,
                                      ).rixMGoM,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Builder(
                                  builder: (context) => Container(
                                    margin: const EdgeInsets.all(16),
                                    height: dangerousNoduleRowHeight,
                                    alignment: Alignment.center,
                                    child: Text(
                                      (resultHistory.dangerousNodule ?? '')
                                          .trim(),
                                      style: const TextStyle(
                                        color: AppColors.blueGrayDark,
                                        fontSize: 13,
                                      ).rixMGoM,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (index == state.examinationResults.length - 1)
                            const VerticalDivider(),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const VerticalDivider(),
                  ),
                ),
                const VerticalDivider(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
