// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';

class PrescriptionDetailPage extends StatefulWidget {
  const PrescriptionDetailPage({
    super.key,
    required this.prescription,
  });

  final Prescription prescription;

  @override
  State<PrescriptionDetailPage> createState() => _PrescriptionDetailPageState();
}

class _PrescriptionDetailPageState extends State<PrescriptionDetailPage> {
  late final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('처방전정보'),
        actions: [
          // IconButton(
          //   onPressed: () => context.beamToNamed,
          //   icon: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       5,
          //       (index) => index.isOdd
          //           ? const SizedBox(width: 2)
          //           : Container(
          //               width: 4,
          //               height: 4,
          //               decoration: const BoxDecoration(
          //                 color: AppColors.blueGrayDark,
          //               ),
          //             ),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            CommonShadowBox(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            yyyyMMddFormat
                                .format(widget.prescription.prescriptedAt),
                            style: GoogleFonts.lato(
                              fontSize: 28,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '처방의',
                                style: const TextStyle(
                                  color: AppColors.gray,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                ).rixMGoB,
                              ),
                              const WidgetSpan(child: SizedBox(width: 5)),
                              TextSpan(
                                text: widget.prescription.doctorName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.blueGrayDark,
                                ).rixMGoB,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 414,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount:
                          widget.prescription.medicationInformations!.length,
                      itemBuilder: (context, index) {
                        final medicationInformation =
                            widget.prescription.medicationInformations![index];

                        final pill = medicationInformation.pill!;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(6),
                                ),
                                child: SizedBox(
                                  height: 161,
                                  child: pill.image == null
                                      ? null
                                      : Image.memory(
                                          pill.image!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(6),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xffebebec),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              pill.name,
                                              style: const TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 17,
                                              ).rixMGoEB,
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              pill.entpName,
                                              style: const TextStyle(
                                                color: AppColors.gray,
                                                fontSize: 13,
                                              ).rixMGoB,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 16,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            3,
                                            (index) => Column(
                                              children: [
                                                Text(
                                                  [
                                                    '1회투약량',
                                                    '1일투여횟수',
                                                    '총투약일수'
                                                  ][index],
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: AppColors.gray,
                                                  ).rixMGoB,
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  '${[
                                                    medicationInformation
                                                        .takeCount,
                                                    medicationInformation
                                                        .takePerDay,
                                                    widget
                                                        .prescription.duration,
                                                  ][index]}',
                                                  style: GoogleFonts.lato(
                                                    fontSize: 20,
                                                    color:
                                                        AppColors.blueGrayDark,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '복약시간',
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color: AppColors.primary,
                                              ).rixMGoEB,
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                4,
                                                (index) => Column(
                                                  children: [
                                                    Text(
                                                      [
                                                        '아침',
                                                        '점심',
                                                        '저녁',
                                                        '취침'
                                                      ][index],
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: AppColors.gray,
                                                      ).rixMGoB,
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Text(
                                                      '${[
                                                        medicationInformation
                                                                .timeOne ??
                                                            '0',
                                                        medicationInformation
                                                                .timeTwo ??
                                                            '0',
                                                        medicationInformation
                                                                .timeThree ??
                                                            '0',
                                                        medicationInformation
                                                                .timeFour ??
                                                            '0',
                                                      ][index]}',
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        color: AppColors
                                                            .blueGrayDark,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: PageIndexIndicator(
                      pageController: pageController,
                      pageCount:
                          widget.prescription.medicationInformations!.length,
                    ),
                  ),
                  // ...[
                  //   const Divider(),
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 24,
                  //       vertical: 16,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         SvgPicture.asset('assets/svg/alarm.svg'),
                  //         const SizedBox(width: 10),
                  //         Text(
                  //           '30분 전 알림, 30분 후 알림',
                  //           style: const TextStyle(
                  //             fontSize: 13,
                  //             color: AppColors.gray,
                  //           ).rixMGoB,
                  //         ),
                  //         const Spacer(),
                  //         CommonSwitch(
                  //           value:
                  //               widget.prescription.medicationInformations!.any(
                  //             (medicationInformation) =>
                  //                 medicationInformation.medicationSchedules.any(
                  //               (medicationSchedule) => medicationSchedule.push,
                  //             ),
                  //           ),
                  //           onToggle: print,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
