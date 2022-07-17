import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';

class PointInformationPage extends StatelessWidget {
  const PointInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text('리버포인트 제도'),
        actions: [
          IconButton(
            onPressed: () => context.beamBack(),
            icon: SvgPicture.asset('assets/svg/close.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            CommonShadowBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '복약확인',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '''복약 확인 시 마다 1일 1회 복약인 경우 1점, 2일에 1회 복약인 경우 2점, 3일에 1회 복약인 경우 3점''',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blueGrayDark,
                            height: 1.2,
                          ).rixMGoM,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '외래/검진 일정 등록',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '검진 일정 등록 시 30점, 외래 일정 등록 시 30점',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blueGrayDark,
                            height: 1.2,
                          ).rixMGoM,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '설문 작성',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '설문지 모두 작성 시 30점',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blueGrayDark,
                            height: 1.2,
                          ).rixMGoM,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '검사결과 등록',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '외래 검사결과 등록 시 30점',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.blueGrayDark,
                            height: 1.2,
                          ).rixMGoM,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '다음 외래 전까지',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ).rixMGoEB,
                        ),
                        const SizedBox(height: 3),
                        ...List.generate(
                          4,
                          (index) => Row(
                            children: [
                              SizedBox(
                                width: 60,
                                child: Text(
                                  [
                                    'Diamond',
                                    'Gold',
                                    'SIlver',
                                    'Bronze',
                                  ][index],
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    color: AppColors.blueGrayDark,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                [
                                  '270P ~ 300P',
                                  '240P ~ 269P',
                                  '210P ~ 239P',
                                  '90P ~ 209P',
                                ][index],
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  color: AppColors.green,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          '다음 외래 일정 등록 시 포인트 리셋',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.magenta,
                          ).rixMGoM,
                        ),
                      ],
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
}
