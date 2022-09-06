// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:yak/presentation/bloc/medication_schedules/groups/update/medication_schedule_group_update_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';
import 'package:yak/presentation/widget/medication_schedule/detail/medication_schedule_information_list_view.dart';

class MedicationScheduleCheckDialog extends StatefulWidget {
  const MedicationScheduleCheckDialog({
    super.key,
    required this.reservedAt,
  });
  final DateTime reservedAt;

  @override
  State<MedicationScheduleCheckDialog> createState() =>
      _MedicationScheduleCheckDialogState();
}

class _MedicationScheduleCheckDialogState
    extends State<MedicationScheduleCheckDialog> {
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
    scrollController.dispose();
    medicationScheduleGroupUpdateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationScheduleGroupUpdateCubit,
        MedicationScheduleGroupUpdateState>(
      bloc: medicationScheduleGroupUpdateCubit,
      builder: (context, state) => BlocBuilder<CurrentTimeCubit, DateTime>(
        builder: (context, now) {
          final group = state.medicationScheduleGroup;

          if (group == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final isOver = group.reservedAt.isBefore(now);

          return CommonDialog(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Column(
                    children: [
                      Text(
                        hhmmFormat.format(DateTime.now()),
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        yyyyMMddFormat
                            .format(DateTime.now())
                            .split('.')
                            .sublist(1)
                            .join('.'),
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/alarm.svg'),
                      const SizedBox(width: 5),
                      Text(
                        hhmmFormat
                            .format(state.medicationScheduleGroup!.reservedAt),
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '30분 전 알림, 30분 후 알림',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
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
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        height: 285,
                        child: MedicationScheduleInformationListView(
                          now: now,
                          state: state,
                          scrollController: scrollController,
                          isOver: isOver,
                          medicate: medicationScheduleGroupUpdateCubit.medicate,
                        ),
                      ),
                      if (!state.medicationScheduleGroup!.isAllMedicated) ...[
                        const SizedBox(height: 24),
                        BlocBuilder<CurrentTimeCubit, DateTime>(
                          builder: (context, now) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: ElevatedButton(
                              onPressed: group.isAllMedicated
                                  ? null
                                  : medicationScheduleGroupUpdateCubit
                                      .medicateAll,
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
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

                      // const SizedBox(height: 16),
                      // ScrollIndexIndicator(
                      //   childWidth: 196,
                      //   scollController: scrollController,
                      //   pageCount: widget.medicationSchedulesGroup
                      //           .medicationInformations.length -
                      //       1,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
