import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/physics.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/medication_schedules/groups/update/medication_schedule_group_update_cubit.dart';
import 'package:yak/presentation/widget/common/pill_detail_dialog.dart';
import 'package:yak/presentation/widget/medication_schedule/detail/medication_schedule_information_page_view.dart';

class MedicationScheduleInformationListView extends StatelessWidget {
  const MedicationScheduleInformationListView({
    super.key,
    required this.scrollController,
    required this.isOver,
    required this.state,
    required this.now,
    required this.medicate,
  });

  final ScrollController scrollController;
  final bool isOver;
  final MedicationScheduleGroupUpdateState state;
  final DateTime now;
  final void Function(String scheduleId) medicate;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: const CustomPageScrollPhysics(
        childWidth: 196,
      ),
      itemCount: state.medicationScheduleGroup!.medicationInformations.length,
      itemBuilder: (context, index) {
        final medicationInformation =
            state.medicationScheduleGroup!.medicationInformations[index];

        final pill = medicationInformation.pill;

        final medicationSchedule =
            state.medicationScheduleGroup!.medicationSchedules.firstWhere(
          (element) =>
              element.medicationInformationId == medicationInformation.id,
        );

        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (context) =>
                      PillDetailDialog(pill: medicationInformation.pill!),
                ),
                child: Container(
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
                        isOver: isOver,
                        medicationInformation: medicationInformation,
                        medicationSchedule: medicationSchedule,
                        medicate: medicate,
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
