// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_group_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/push_update/medication_schedule_group_push_update_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/update/medication_schedule_group_update_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';
import 'package:yak/presentation/widget/medication_schedule/detail/medication_schedule_information_list_view.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_done_check_dialog.dart';

class MedicationScheduleGroupDetailPage extends StatefulWidget {
  const MedicationScheduleGroupDetailPage({
    super.key,
    required this.reservedAt,
  });
  final DateTime reservedAt;

  @override
  State<MedicationScheduleGroupDetailPage> createState() =>
      _MedicationScheduleGroupDetailPageState();
}

class _MedicationScheduleGroupDetailPageState
    extends State<MedicationScheduleGroupDetailPage> {
  bool isOpend = false;
  late final MedicationScheduleGroupPushUpdateCubit
      medicationScheduleGroupPushUpdateCubit;
  late final scrollController = ScrollController();
  late final MedicationScheduleGroupUpdateCubit
      medicationScheduleGroupUpdateCubit;
  @override
  void initState() {
    medicationScheduleGroupPushUpdateCubit =
        MedicationScheduleGroupPushUpdateCubit(
      reservedAt: widget.reservedAt,
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    );
    medicationScheduleGroupUpdateCubit = MedicationScheduleGroupUpdateCubit(
      reservedAt: widget.reservedAt,
      doMedication: KiwiContainer().resolve<DoMedication>(),
      doAllMedication: KiwiContainer().resolve<DoAllMedication>(),
      getMedicationScheduleGroupStream:
          KiwiContainer().resolve<GetMedicationScheduleGroupStream>(),
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    )..loadScheduleGroup();

    super.initState();
  }

  @override
  void dispose() {
    medicationScheduleGroupUpdateCubit.close();
    medicationScheduleGroupPushUpdateCubit.close();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('복약정보'),
      ),
      body: SafeArea(
        child: BlocListener<MedicationScheduleGroupUpdateCubit,
            MedicationScheduleGroupUpdateState>(
          bloc: medicationScheduleGroupUpdateCubit,
          listener: (context, state) {
            medicationScheduleGroupPushUpdateCubit
              ..updateAfterPush(
                state.medicationScheduleGroup?.medicationSchedules
                        .any((element) => element.afterPush) ??
                    false,
              )
              ..updateBeforePush(
                state.medicationScheduleGroup?.medicationSchedules
                        .any((element) => element.beforePush) ??
                    false,
              );
          },
          child: BlocBuilder<MedicationScheduleGroupUpdateCubit,
              MedicationScheduleGroupUpdateState>(
            bloc: medicationScheduleGroupUpdateCubit,
            builder: (context, state) => state.medicationScheduleGroup == null
                ? const SizedBox()
                : BlocBuilder<CurrentTimeCubit, DateTime>(
                    builder: (context, now) {
                      final group = state.medicationScheduleGroup!;

                      final isOver = group.reservedAt.isBefore(now);

                      final diff = now.difference(group.reservedAt);

                      final isSameDate =
                          DateTime(now.year, now.month, now.day) ==
                              DateTime(
                                group.reservedAt.year,
                                group.reservedAt.month,
                                group.reservedAt.day,
                              );

                      return SingleChildScrollView(
                        child: CommonShadowBox(
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '''${'${group.reservedAt.hour}'.padLeft(2, '0')}:00''',
                                      style: GoogleFonts.lato(
                                        fontSize: 28,
                                        color: group.medicatedAt != null ||
                                                isOver
                                            ? AppColors.blueGrayLight
                                            : Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    // if()
                                    const SizedBox(width: 10),
                                    if (group.medicatedAt != null)
                                      Text(
                                        hhmmFormat.format(
                                          group.medicatedAt!,
                                        ),
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    else if (diff.inSeconds < 0)
                                      Text(
                                        '$diff'.split('.').first.substring(
                                              0,
                                              '$diff'.split('.').first.length -
                                                  3,
                                            ),
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: AppColors.skyBlue,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    const Spacer(),
                                    Text(
                                      yyyyMMddFormat.format(
                                        group.reservedAt,
                                      ),
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      height: 285,
                                      child:
                                          MedicationScheduleInformationListView(
                                        now: now,
                                        state: state,
                                        scrollController: scrollController,
                                        isOver: isOver,
                                        medicate:
                                            medicationScheduleGroupUpdateCubit
                                                .medicate,
                                      ),
                                    ),
                                    if (!group.isAllMedicated) ...[
                                      const SizedBox(height: 24),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                        ),
                                        child: ElevatedButton(
                                          onPressed: group.isAllMedicated
                                              ? null
                                              : () {
                                                  showDialog<void>(
                                                    context: context,
                                                    builder: (_) =>
                                                        MedicationDoneCheckDialog(
                                                      onTap:
                                                          medicationScheduleGroupUpdateCubit
                                                              .medicateAll,
                                                    ),
                                                  );
                                                },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize:
                                                const Size.fromHeight(60),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          child: const Text('모두 복용 완료'),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              if (now.isBefore(group.reservedAt) &&
                                  !group.isAllMedicated) ...[
                                const Divider(),
                                GestureDetector(
                                  onTap: isSameDate
                                      ? null
                                      : () =>
                                          setState(() => isOpend = !isOpend),
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/alarm.svg',
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '${group.hasBeforePush ? '30분 전 알림' : ''}${group.hasBeforePush && group.hasAfterPush ? ', ' : ''}${group.hasAfterPush ? '30분 후 알림' : ''}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.gray,
                                          ).rixMGoB,
                                        ),
                                        const Spacer(),
                                        if (isSameDate)
                                          CommonSwitch(
                                            value: group.push,
                                            onToggle:
                                                medicationScheduleGroupUpdateCubit
                                                    .togglePush,
                                          )
                                        else
                                          RotatedBox(
                                            quarterTurns: isOpend ? 3 : 1,
                                            child: SvgPicture.asset(
                                              'assets/svg/right.svg',
                                              color: AppColors.gray,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isOpend && !isSameDate) ...[
                                  const Divider(),
                                  BlocBuilder<
                                      MedicationScheduleGroupPushUpdateCubit,
                                      MedicationScheduleGroupPushUpdateState>(
                                    bloc:
                                        medicationScheduleGroupPushUpdateCubit,
                                    builder: (context, pushUpdateState) =>
                                        Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '알림설정',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.primary,
                                                ).rixMGoB,
                                              ),
                                              const Spacer(),
                                              Text(
                                                '알림사용',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.gray,
                                                ).rixMGoB,
                                              ),
                                              const SizedBox(width: 9),
                                              CommonSwitch(
                                                value: pushUpdateState
                                                        .beforePush ||
                                                    pushUpdateState.afterPush,
                                                onToggle:
                                                    medicationScheduleGroupPushUpdateCubit
                                                        .updatePush,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Row(
                                            children: [
                                              OpacityCheckButton(
                                                onTap: () =>
                                                    medicationScheduleGroupPushUpdateCubit
                                                        .updateBeforePush(
                                                  !pushUpdateState.beforePush,
                                                ),
                                                opacity:
                                                    pushUpdateState.beforePush
                                                        ? 1
                                                        : 0,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                '30분 전 알림',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ).rixMGoB,
                                              ),
                                              const Spacer(),
                                              OpacityCheckButton(
                                                onTap: () =>
                                                    medicationScheduleGroupPushUpdateCubit
                                                        .updateAfterPush(
                                                  !pushUpdateState.afterPush,
                                                ),
                                                opacity:
                                                    pushUpdateState.afterPush
                                                        ? 1
                                                        : 0,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                '30분 후 알림',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ).rixMGoB,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          ElevatedButton(
                                            onPressed: pushUpdateState
                                                            .beforePush ==
                                                        state
                                                            .medicationScheduleGroup!
                                                            .medicationSchedules
                                                            .any(
                                                          (element) => element
                                                              .beforePush,
                                                        ) &&
                                                    pushUpdateState.afterPush ==
                                                        state
                                                            .medicationScheduleGroup!
                                                            .medicationSchedules
                                                            .any(
                                                          (element) =>
                                                              element.afterPush,
                                                        )
                                                ? null
                                                : medicationScheduleGroupPushUpdateCubit
                                                    .submit,
                                            style: ElevatedButton.styleFrom(
                                              fixedSize:
                                                  const Size.fromHeight(60),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            child: const Text('알림 설정 저장'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
