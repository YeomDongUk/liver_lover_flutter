import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/metabolic_disease/upsert/upsert_metabolic_disease_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';

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
      builder: (context, state) => DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [BoxShadow(color: Color(0x7ecdced2), blurRadius: 20)],
          color: Colors.white,
        ),
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
                      const Spacer(),
                      SizedBox(
                        width: 159,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => cubit.updateHbv(true),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.lightGray,
                                  ),
                                ),
                                child: AnimatedOpacity(
                                  opacity: (state.metabolicDisease.hbv == true)
                                      ? 1
                                      : 0,
                                  duration: const Duration(
                                    milliseconds: 100,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svg/join_check.svg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '예',
                              style: const TextStyle(
                                fontSize: 15,
                              ).rixMGoB,
                            ),
                            const SizedBox(width: 24),
                            InkWell(
                              onTap: () => cubit.updateHbv(false),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.lightGray,
                                  ),
                                ),
                                child: AnimatedOpacity(
                                  opacity: (state.metabolicDisease.hbv == false)
                                      ? 1
                                      : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: SvgPicture.asset(
                                    'assets/svg/join_check.svg',
                                  ),
                                ),
                              ),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'B형 간염 바이러스 비활동성 보유상태',
                    style: const TextStyle(
                      fontSize: 15,
                    ).rixMGoB,
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
                          initialValue:
                              state.metabolicDisease.hbvInactivityConfirmedAt,
                          onConfirm: cubit.updateHbvInactivityConfirmedAt,
                        ),
                        child: SizedBox(
                          width: 159,
                          child: JoinContainer(
                            child: Center(
                              child: Text(
                                state.metabolicDisease
                                            .hbvInactivityConfirmedAt ==
                                        null
                                    ? ''
                                    : yyyyMMddFormat.format(
                                        state.metabolicDisease
                                            .hbvInactivityConfirmedAt!,
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '만성 B형 간염',
                    style: const TextStyle(
                      fontSize: 15,
                    ).rixMGoB,
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
                          initialValue:
                              state.metabolicDisease.chronicHbvConfirmedAt,
                          onConfirm: cubit.updateChronicHbvConfirmedAt,
                        ),
                        child: SizedBox(
                          width: 159,
                          child: JoinContainer(
                            child: Center(
                              child: Text(
                                state.metabolicDisease.chronicHbvConfirmedAt ==
                                        null
                                    ? ''
                                    : yyyyMMddFormat.format(
                                        state.metabolicDisease
                                            .chronicHbvConfirmedAt!,
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '간경변증',
                    style: const TextStyle(
                      fontSize: 15,
                    ).rixMGoB,
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
                          initialValue:
                              state.metabolicDisease.cirrhosisConfirmedAt,
                          onConfirm: cubit.updateCirrhosisConfirmedAt,
                        ),
                        child: SizedBox(
                          width: 159,
                          child: JoinContainer(
                            child: Center(
                              child: Text(
                                state.metabolicDisease.cirrhosisConfirmedAt ==
                                        null
                                    ? ''
                                    : yyyyMMddFormat.format(
                                        state.metabolicDisease
                                            .cirrhosisConfirmedAt!,
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
          ],
        ),
      ),
    );
  }
}
