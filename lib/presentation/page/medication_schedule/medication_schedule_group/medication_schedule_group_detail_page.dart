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
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/usecases/medication_schedule/do_all_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/do_medication.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/update/medication_schedule_group_update_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class MedicationScheduleGroupDetailPage extends StatefulWidget {
  const MedicationScheduleGroupDetailPage({
    super.key,
    required this.medicationSchedulesGroup,
  });
  final MedicationSchedulesGroup medicationSchedulesGroup;

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
      medicationSchedulesGroup: widget.medicationSchedulesGroup,
      doMedication: KiwiContainer().resolve<DoMedication>(),
      doAllMedication: KiwiContainer().resolve<DoAllMedication>(),
      updateMedicationScheduleGroupPush:
          KiwiContainer().resolve<UpdateMedicationScheduleGroupPush>(),
    );
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
          builder: (context, state) => BlocBuilder<CurrentTimeCubit, DateTime>(
            builder: (context, now) {
              final group = state.medicationSchedulesGroup;

              final isOver = group.reservedAt.isBefore(now);

              final diff = now.difference(group.reservedAt);

              final canAllMedicate = now.isAfter(
                    group.reservedAt.add(const Duration(hours: -1)),
                  ) &&
                  now.isBefore(group.reservedAt.add(const Duration(hours: 1)));

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
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              height: 283,
                              child: MedicationScheduleInformationListView(
                                now: now,
                                state: state,
                                scrollController: scrollController,
                                group: group,
                                isOver: isOver,
                                medicationScheduleGroupUpdateCubit:
                                    medicationScheduleGroupUpdateCubit,
                              ),
                            ),
                            if (!state
                                .medicationSchedulesGroup.isAllMedicated) ...[
                              const SizedBox(height: 24),
                              BlocBuilder<CurrentTimeCubit, DateTime>(
                                builder: (context, now) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: !canAllMedicate
                                        ? null
                                        : group.isAllMedicated
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
                      if (now.isBefore(group.reservedAt) &&
                          !state.medicationSchedulesGroup.isAllMedicated) ...[
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
                                onToggle: (value) =>
                                    medicationScheduleGroupUpdateCubit
                                        .togglePush(),
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

class MedicationScheduleInformationListView extends StatelessWidget {
  const MedicationScheduleInformationListView({
    super.key,
    required this.scrollController,
    required this.group,
    required this.isOver,
    required this.medicationScheduleGroupUpdateCubit,
    required this.state,
    required this.now,
  });

  final ScrollController scrollController;
  final MedicationSchedulesGroup group;
  final bool isOver;
  final MedicationScheduleGroupUpdateCubit medicationScheduleGroupUpdateCubit;
  final MedicationScheduleGroupUpdateState state;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: const CustomPageScrollPhysics(
        childWidth: 196,
      ),
      itemCount: group.medicationInformations.length,
      itemBuilder: (context, index) {
        final medicationInformation =
            state.medicationSchedulesGroup.medicationInformations[index];

        final pill = medicationInformation.pill;

        final medicationSchedule =
            medicationInformation.medicationSchedules.first;

        final isMedicated = medicationSchedule.medicatedAt != null;

        final canMedicate = now.isAfter(
              medicationSchedule.reservedAt.add(
                const Duration(hours: -1),
              ),
            ) &&
            now.isBefore(
              medicationSchedule.reservedAt.add(const Duration(hours: 1)),
            ) &&
            medicationSchedule.medicatedAt == null;

        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              Container(
                height: 98,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6),
                  ),
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  image: pill!.image == null
                      ? null
                      : DecorationImage(
                          image: MemoryImage(
                            pill.image!,
                          ),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 182,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(6),
                    ),
                    border: Border.all(
                      color: const Color(0xffebebec),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        pill.name,
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                        ).rixMGoEB,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        pill.entpName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w400,
                        ).rixMGoEB,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Stack(
                        children: [
                          Container(
                            width: 116,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            width: 116,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      left: 4,
                                    ),
                                    child: Text(
                                      '${medicationInformation.takeCount}',
                                      style: GoogleFonts.lato(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    width: 48,
                                    child: Text(
                                      '정',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                      ).rixMGoM,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MedicationInformationPageview(
                        canMedicate: canMedicate,
                        isOver: isOver,
                        medicationScheduleGroupUpdateCubit:
                            medicationScheduleGroupUpdateCubit,
                        medicationInformation: medicationInformation,
                        medicationSchedule: medicationSchedule,
                        isMedicated: isMedicated,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MedicationInformationPageview extends StatelessWidget {
  const MedicationInformationPageview({
    super.key,
    required this.medicationScheduleGroupUpdateCubit,
    required this.medicationInformation,
    required this.medicationSchedule,
    required this.isMedicated,
    required this.isOver,
    required this.canMedicate,
  });

  final MedicationScheduleGroupUpdateCubit medicationScheduleGroupUpdateCubit;
  final MedicationInformation medicationInformation;
  final MedicationSchedule medicationSchedule;
  final bool isMedicated;
  final bool isOver;
  final bool canMedicate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !canMedicate
          ? null
          : () => medicationScheduleGroupUpdateCubit.medicate(
                medicationInformation: medicationInformation,
                medicationSchedule: medicationSchedule,
              ),
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              'assets/svg/check.svg',
              color: isMedicated
                  ? AppColors.primary
                  : isOver
                      ? AppColors.magenta
                      : null,
            ),
            const SizedBox(height: 7),
            if (!isMedicated && !isOver)
              Text(
                '복용전',
                style: const TextStyle(
                  color: AppColors.gray,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                ).rixMGoB,
                textAlign: TextAlign.center,
              )
            else if (!isMedicated && isOver)
              Text(
                '미복용',
                style: const TextStyle(
                  color: AppColors.magenta,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                ).rixMGoB,
                textAlign: TextAlign.center,
              )
            else
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${hhmmFormat.format(medicationInformation.medicationSchedules.first.medicatedAt!)} ',
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '복약완료',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                      ).rixMGoB,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
