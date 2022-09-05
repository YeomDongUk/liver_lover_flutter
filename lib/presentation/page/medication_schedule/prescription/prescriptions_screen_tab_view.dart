// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/usecases/prescription/get_prescriptions.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/prescription/prescriptions_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/pill_detail_dialog.dart';

class PrescriptionsTabView extends StatefulWidget {
  const PrescriptionsTabView({super.key});

  @override
  State<PrescriptionsTabView> createState() => _PrescriptionsTabViewState();
}

class _PrescriptionsTabViewState extends State<PrescriptionsTabView>
    with AutomaticKeepAliveClientMixin {
  late final PrescriptionsCubit prescriptionsCubit;
  @override
  void initState() {
    prescriptionsCubit = PrescriptionsCubit(
      getPrescriptions: KiwiContainer().resolve<GetPrescriptions>(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    prescriptionsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PrescriptionsCubit, PrescriptionsState>(
      bloc: prescriptionsCubit,
      builder: (context, state) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: state.prescriptions.length,
        itemBuilder: (context, index) =>
            BlocBuilder<CurrentTimeCubit, DateTime>(
          builder: (context, now) {
            final prescription = state.prescriptions[index];

            return PrescriptionOverviewWidget(
              prescriptionsCubit: prescriptionsCubit,
              prescription: prescription,
            );
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class PrescriptionOverviewWidget extends StatelessWidget {
  const PrescriptionOverviewWidget({
    super.key,
    required this.prescriptionsCubit,
    required this.prescription,
  });
  final PrescriptionsCubit prescriptionsCubit;

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return CommonShadowBox(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => context.beamToNamed(
          '/prescriptions/${prescription.id}',
          data: {'prescriptionsCubit': prescriptionsCubit},
        ),
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
                      yyyyMMddFormat.format(prescription.prescriptedAt),
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        color: prescription.isOver
                            ? AppColors.gray
                            : AppColors.primary,
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
                          style: TextStyle(
                            fontSize: 15,
                            color: prescription.isOver
                                ? AppColors.gray
                                : AppColors.blueGrayDark,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                children: (prescription.medicationInformations ?? [])
                    .mapIndexed(
                      (index, e) => Column(
                        children: [
                          if (index > 0) const SizedBox(height: 16),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/icon_pill.svg',
                                color: prescription.isOver
                                    ? AppColors.gray
                                    : AppColors.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  e.pill!.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: prescription.isOver
                                        ? AppColors.gray
                                        : AppColors.blueGrayDark,
                                  ).rixMGoB,
                                ),
                              ),
                              const SizedBox(width: 28),
                              Text(
                                '${e.takeCount}'.padRight(4, '0'),
                                style: GoogleFonts.lato(
                                  color: AppColors.gray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 28),
                              GestureDetector(
                                onTap: () => showDialog<void>(
                                  context: context,
                                  builder: (_) => PillDetailDialog(
                                    pill: e.pill!,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/icon_info.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            // if (!isOver) ...[
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
            //         BlocBuilder<CurrentTimeCubit, DateTime>(
            //           builder: (context, now) => CommonSwitch(
            //             value: prescription.medicationInformations!.any(
            //               (medicationInformation) => medicationInformation
            //                   .medicationSchedules
            //                   .where(
            //                       (element) => element.reservedAt.isAfter(now))
            //                   .any(
            //                     (medicationSchedule) => medicationSchedule.push,
            //                   ),
            //             ),
            //             onToggle: (value) =>
            //                 prescriptionsCubit.toggle(id: prescription.id),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ]
          ],
        ),
      ),
    );
  }
}
