// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/examination_result/examination_result_local_data_source.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/presentation/widget/common/pageview_indicator.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';
import 'package:yak/presentation/widget/home/home_screen/home_label.dart';
import 'package:yak/presentation/widget/home/home_screen/value_column.dart';

class RecentTestResultView extends StatefulWidget {
  const RecentTestResultView({super.key});

  @override
  State<RecentTestResultView> createState() => _RecentTestResultViewState();
}

class _RecentTestResultViewState extends State<RecentTestResultView> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: HomeLabel(
            grayText: '최근 ',
            primaryText: '검사결과',
          ),
        ),
        StreamBuilder<ExaminationResultModel>(
          stream: KiwiContainer()
              .resolve<ExaminationResultLocalDataSource>()
              .getLastExaminationResult(
                userId: KiwiContainer().resolve<UserId>().value,
              ),
          builder: (context, snapshot) {
            final examinationResult = snapshot.data == null
                ? null
                : ExaminationResult.fromJson(snapshot.data!.toJson());

            return SizedBox(
              height: 192,
              child: PageView(
                controller: pageController,
                children: [
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '간효소',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ValueColumn(
                                  label: 'AST',
                                  value: examinationResult?.ast?.toInt(),
                                  unitText: 'IU/mL',
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: ValueColumn(
                                  label: 'ALT',
                                  value: examinationResult?.alt?.toInt(),
                                  unitText: 'IU/mL',
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: ValueColumn(
                                  label: 'GGT',
                                  value: examinationResult?.ggt?.toInt(),
                                  unitText: 'IU/mL',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'B형/C형 간염바이러스',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ValueColumn(
                                  label: 'HBV',
                                  value: examinationResult?.hbvDna?.toInt(),
                                  unitText: 'IU/mL',
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: ValueColumn(
                                  label: 'HCV',
                                  value: examinationResult?.hcvRna?.toInt(),
                                  unitText: 'IU/mL',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '빌리루빈',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: ValueColumn(
                            label: 'Bilirubin',
                            value: examinationResult?.bilirubin?.toInt(),
                            unitText: 'mg/dL',
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '알부민',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: ValueColumn(
                            label: 'Albumin',
                            value: examinationResult?.albumin?.toInt(),
                            unitText: 'mg/dL',
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '알파태아단백질',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.magenta,
                            ).rixMGoEB,
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: ValueColumn(
                            label: 'AFP',
                            value: examinationResult?.afp?.toInt(),
                            unitText: 'mg/dL',
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                    .map(
                      (e) => Center(
                        child: SizedBox(
                          height: 172,
                          child: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        Center(
          child: PageviewIndicator(
            pageController: pageController,
            pageCoount: 5,
          ),
        ),
      ],
    );
  }
}
