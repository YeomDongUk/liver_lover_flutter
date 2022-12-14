// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';
import 'package:yak/presentation/bloc/examination_result/histories/examination_result_histories_cubit.dart';

class BloodTestHistoriesScreen extends StatefulWidget {
  const BloodTestHistoriesScreen({super.key});

  @override
  State<BloodTestHistoriesScreen> createState() =>
      _BloodTestHistoriesScreenState();
}

class _BloodTestHistoriesScreenState extends State<BloodTestHistoriesScreen>
    with AutomaticKeepAliveClientMixin {
  late final ExaminationResultHistoriesCubit examinationResultHistoriesCubit;

  @override
  void initState() {
    examinationResultHistoriesCubit = ExaminationResultHistoriesCubit(
      isBloodTest: true,
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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        height: 576.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 68.5,
                    padding: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '??????',
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ).rixMGoM,
                    ),
                  ),
                  const Divider(),
                  ...List.generate(19, (index) {
                    if (index.isEven) {
                      return SizedBox(
                        height: index == 0 || index == 18 ? 20 : 24,
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            [
                              '?????????',
                              '?????????(AST)',
                              '?????????(ALT)',
                              '?????????(GGT)',
                              '????????????',
                              '?????????',
                              'HBV DNA',
                              'HCV RNA',
                              '????????????\n??????(AFP)'
                            ][index ~/ 2],
                            style: const TextStyle(
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ).rixMGoM,
                          ),
                          const SizedBox(height: 1),
                          Text(
                            [
                              'X10 /mm',
                              'IU/L',
                              'IU/L',
                              'IU/L',
                              'mg/dL',
                              'g/dL',
                              'IU/mL',
                              'IU/mL',
                              'ng/mL'
                            ][index ~/ 2],
                            style: GoogleFonts.lato(
                              color: AppColors.blueGrayLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ).rixMGoM,
                          )
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: BlocBuilder<ExaminationResultHistoriesCubit,
                  ExaminationResultHistoriesState>(
                bloc: examinationResultHistoriesCubit,
                builder: (context, state) => ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.examinationResults.length,
                  itemBuilder: (context, index) {
                    final resultHistory = state.examinationResults[index];
                    return Row(
                      children: [
                        SizedBox(
                          width: 83.5,
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
                              ...List.generate(19, (index) {
                                if (index.isEven) {
                                  return SizedBox(
                                    height: index == 0 || index == 18 ? 20 : 24,
                                  );
                                }

                                return Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(
                                    '${[
                                          resultHistory.platelet,
                                          resultHistory.ast,
                                          resultHistory.alt,
                                          resultHistory.ggt,
                                          resultHistory.bilirubin,
                                          resultHistory.albumin,
                                          resultHistory.hbvDna,
                                          resultHistory.hcvRna,
                                          resultHistory.afp,
                                        ][index ~/ 2] ?? ''}',
                                    style: GoogleFonts.lato(
                                      color: AppColors.blueGrayDark,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 25,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        if (index == state.examinationResults.length - 1)
                          const VerticalDivider(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const VerticalDivider(),
                ),
              ),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
