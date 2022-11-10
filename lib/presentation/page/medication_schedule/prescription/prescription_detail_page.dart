// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/prescription/prescriptions_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';

class PrescriptionDetailPage extends StatefulWidget {
  const PrescriptionDetailPage({
    super.key,
    required this.id,
    required this.prescriptionsCubit,
  });
  final String id;
  final PrescriptionsCubit prescriptionsCubit;

  @override
  State<PrescriptionDetailPage> createState() => _PrescriptionDetailPageState();
}

class _PrescriptionDetailPageState extends State<PrescriptionDetailPage> {
  late final PageController pageController = PageController();

  OverlayEntry? _overlayEntry;
  final _layerLink = LayerLink();

  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _removeOverlay,
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('처방전정보'),
          actions: [
            BlocBuilder<CurrentTimeCubit, DateTime>(
              builder: (context, now) =>
                  BlocBuilder<PrescriptionsCubit, PrescriptionsState>(
                bloc: widget.prescriptionsCubit,
                builder: (context, state) {
                  final prescription = state.prescriptions.firstWhere(
                    (element) => element.id == widget.id,
                  );

                  return prescription.deletedAt != null ||
                          now.isAfter(
                            prescription.medicationStartAt.add(
                              Duration(days: prescription.duration),
                            ),
                          )
                      ? const SizedBox()
                      : CompositedTransformTarget(
                          link: _layerLink,
                          child: IconButton(
                            onPressed: _createOverlay,
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) => index.isOdd
                                    ? const SizedBox(width: 2)
                                    : Container(
                                        width: 4,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                          color: AppColors.blueGrayDark,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<PrescriptionsCubit, PrescriptionsState>(
            bloc: widget.prescriptionsCubit,
            builder: (context, state) {
              final prescription = state.prescriptions.firstWhere(
                (element) => element.id == widget.id,
              );

              return ListView(
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
                                      .format(prescription.prescriptedAt),
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
                                      text: prescription.doctorName,
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
                        ExpandablePageView.builder(
                          controller: pageController,
                          itemCount:
                              prescription.medicationInformations!.length,
                          itemBuilder: (context, index) {
                            final medicationInformation =
                                prescription.medicationInformations![index];

                            final pill = medicationInformation.pill!;

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
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
                                  DecoratedBox(
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
                                                      prescription.duration,
                                                    ][index]}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: 20,
                                                      color: AppColors
                                                          .blueGrayDark,
                                                      fontWeight:
                                                          FontWeight.w900,
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
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                '복약시간',
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  color: AppColors.primary,
                                                ).rixMGoEB,
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 18,
                                                runSpacing: 18,
                                                children: [
                                                  if (medicationInformation
                                                          .timeOne !=
                                                      null) ...[
                                                    Text(
                                                      '${'${medicationInformation.timeOne!}'.padLeft(2, '0')}:00',
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        color: AppColors
                                                            .blueGrayDark,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                  if (medicationInformation
                                                          .timeTwo !=
                                                      null)
                                                    Text(
                                                      '${'${medicationInformation.timeTwo!}'.padLeft(2, '0')}:00',
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        color: AppColors
                                                            .blueGrayDark,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  if (medicationInformation
                                                          .timeThree !=
                                                      null)
                                                    Text(
                                                      '${'${medicationInformation.timeThree!}'.padLeft(2, '0')}:00',
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        color: AppColors
                                                            .blueGrayDark,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          child: PageIndexIndicator(
                            pageController: pageController,
                            pageCount:
                                prescription.medicationInformations!.length,
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
                        //               prescription.medicationInformations!.any(
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
              );
            },
          ),
        ),
      ),
    );
  }

  // 드롭다운.
  OverlayEntry _customDropdown() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: 80,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(-40, 40),
          child: GestureDetector(
            onTap: _removeOverlay,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x7ecdced2),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            barrierDismissible: false,
                          );
                          KiwiContainer()
                              .resolve<PrescriptionLocalDataSource>()
                              .endPrescription(
                                userId: KiwiContainer().resolve<UserId>().value,
                                prescriptionId: widget.id,
                              )
                              .then(
                            (value) {
                              _removeOverlay();
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            '종료',
                            style: const TextStyle(
                              color: AppColors.magenta,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            ).rixMGoB,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _removeOverlay();

                          final prescription = widget
                              .prescriptionsCubit.state.prescriptions
                              .firstWhere(
                            (element) => element.id == widget.id,
                          );

                          context.beamToNamed(
                            '/prescriptions/${prescription.id}/update',
                            data: {
                              'prescription': prescription,
                              'prescriptionsCubit': widget.prescriptionsCubit,
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            '수정',
                            style: const TextStyle(
                              color: AppColors.blueGrayDark,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            ).rixMGoB,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
