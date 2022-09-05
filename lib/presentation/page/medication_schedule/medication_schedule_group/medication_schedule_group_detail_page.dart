// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/physics.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/get_medication_schedule_group_stream.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/update/medication_schedule_group_update_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
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
  late final scrollController = ScrollController();
  late final MedicationScheduleGroupUpdateCubit
      medicationScheduleGroupUpdateCubit;

  @override
  void initState() {
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
                                      color: isOver
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
                                            '$diff'.split('.').first.length - 3,
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
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    BlocBuilder<CurrentTimeCubit, DateTime>(
                                      builder: (context, now) => Padding(
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
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (now.isBefore(group.reservedAt) &&
                                !group.isAllMedicated) ...[
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/alarm.svg'),
                                    const SizedBox(width: 10),
                                    Text(
                                      '30분 전 알림, 30분 후 알림',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                      ).rixMGoB,
                                    ),
                                    const Spacer(),
                                    CommonSwitch(
                                      value: group.push,
                                      onToggle:
                                          medicationScheduleGroupUpdateCubit
                                              .togglePush,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
