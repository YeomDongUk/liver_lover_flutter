// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/metabolic_disease/upsert/upsert_metabolic_disease_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';

class HBVUpdateForm extends StatelessWidget {
  const HBVUpdateForm({
    super.key,
  });

  void openDatePicker({
    required BuildContext context,
    required DateTime? initialValue,
    required void Function(DateTime) onConfirm,
  }) =>
      DatePicker.showDatePicker(
        context,
        currentTime: initialValue ?? DateTime.now(),
        maxTime: DateTime.now(),
        locale: LocaleType.ko,
        onConfirm: onConfirm,
      );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpsertMetabolicDiseaseCubit>();
    return BlocBuilder<UpsertMetabolicDiseaseCubit,
        UpsertMetabolicDiseaseState>(
      builder: (context, state) => CommonShadowBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'B형 간염',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ).rixMGoEB,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OpacityCheckButton(
                              onTap: () => cubit.updateHbv(true),
                              opacity:
                                  (state.metabolicDisease.hbv == true) ? 1 : 0,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '예',
                              style: const TextStyle(
                                fontSize: 15,
                              ).rixMGoB,
                            ),
                            const SizedBox(width: 24),
                            OpacityCheckButton(
                              onTap: () => cubit.updateHbv(false),
                              opacity:
                                  (state.metabolicDisease.hbv == false) ? 1 : 0,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '아니오',
                              style: const TextStyle(
                                fontSize: 15,
                              ).rixMGoB,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        '확인일자',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => openDatePicker(
                          context: context,
                          initialValue: state.metabolicDisease.hbvConfirmedAt,
                          onConfirm: cubit.updateHbvConfirmedAt,
                        ),
                        child: SizedBox(
                          width: 159,
                          child: JoinContainer(
                            child: Center(
                              child: Text(
                                state.metabolicDisease.hbvConfirmedAt == null
                                    ? ''
                                    : yyyyMMddFormat.format(
                                        state.metabolicDisease.hbvConfirmedAt!,
                                      ),
                                style: GoogleFonts.lato(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(24),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Text(
            //         'B형 간염 바이러스 비활동성 보유상태',
            //         style: const TextStyle(
            //           fontSize: 15,
            //         ).rixMGoB,
            //       ),
            //       const SizedBox(height: 20),
            //       Row(
            //         children: [
            //           Text(
            //             '확인일자',
            //             style: const TextStyle(
            //               fontSize: 13,
            //               color: AppColors.gray,
            //             ).rixMGoB,
            //           ),
            //           const Spacer(),
            //           GestureDetector(
            //             onTap: () => openDatePicker(
            //               context: context,
            //               initialValue:
            //                   state.metabolicDisease.hbvInactivityConfirmedAt,
            //               onConfirm: cubit.updateHbvInactivityConfirmedAt,
            //             ),
            //             child: SizedBox(
            //               width: 159,
            //               child: JoinContainer(
            //                 child: Center(
            //                   child: Text(
            //                     state.metabolicDisease
            //                                 .hbvInactivityConfirmedAt ==
            //                             null
            //                         ? ''
            //                         : yyyyMMddFormat.format(
            //                             state.metabolicDisease
            //                                 .hbvInactivityConfirmedAt!,
            //                           ),
            //                     style: GoogleFonts.lato(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(24),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Text(
            //         '만성 B형 간염',
            //         style: const TextStyle(
            //           fontSize: 15,
            //         ).rixMGoB,
            //       ),
            //       const SizedBox(height: 20),
            //       Row(
            //         children: [
            //           Text(
            //             '확인일자',
            //             style: const TextStyle(
            //               fontSize: 13,
            //               color: AppColors.gray,
            //             ).rixMGoB,
            //           ),
            //           const Spacer(),
            //           GestureDetector(
            //             onTap: () => openDatePicker(
            //               context: context,
            //               initialValue:
            //                   state.metabolicDisease.chronicHbvConfirmedAt,
            //               onConfirm: cubit.updateChronicHbvConfirmedAt,
            //             ),
            //             child: SizedBox(
            //               width: 159,
            //               child: JoinContainer(
            //                 child: Center(
            //                   child: Text(
            //                     state.metabolicDisease.chronicHbvConfirmedAt ==
            //                             null
            //                         ? ''
            //                         : yyyyMMddFormat.format(
            //                             state.metabolicDisease
            //                                 .chronicHbvConfirmedAt!,
            //                           ),
            //                     style: GoogleFonts.lato(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(24),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Text(
            //         '간경변증',
            //         style: const TextStyle(
            //           fontSize: 15,
            //         ).rixMGoB,
            //       ),
            //       const SizedBox(height: 20),
            //       Row(
            //         children: [
            //           Text(
            //             '확인일자',
            //             style: const TextStyle(
            //               fontSize: 13,
            //               color: AppColors.gray,
            //             ).rixMGoB,
            //           ),
            //           const Spacer(),
            //           GestureDetector(
            //             onTap: () => openDatePicker(
            //               context: context,
            //               initialValue:
            //                   state.metabolicDisease.cirrhosisConfirmedAt,
            //               onConfirm: cubit.updateCirrhosisConfirmedAt,
            //             ),
            //             child: SizedBox(
            //               width: 159,
            //               child: JoinContainer(
            //                 child: Center(
            //                   child: Text(
            //                     state.metabolicDisease.cirrhosisConfirmedAt ==
            //                             null
            //                         ? ''
            //                         : yyyyMMddFormat.format(
            //                             state.metabolicDisease
            //                                 .cirrhosisConfirmedAt!,
            //                           ),
            //                     style: GoogleFonts.lato(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
