import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class HospitalVisitScheduleDeleteCheckDialog extends StatelessWidget {
  const HospitalVisitScheduleDeleteCheckDialog({
    super.key,
    required this.hospitalVisitScheduleId,
  });

  final String hospitalVisitScheduleId;

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      hideCloseButton: true,
      child: SizedBox(
        height: 226,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '외래/진료일정 삭제',
              style: const TextStyle(
                fontSize: 17,
                color: AppColors.magenta,
              ).rixMGoEB,
            ),
            const SizedBox(height: 9),
            Text(
              '선택하신 일정을 삭제하시겠습니까?\n선택하신 일정을 삭제하면 포인트 이력이 리셋됩니다.',
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 13,
                height: 1.2,
              ).rixMGoB,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        '아니오',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ).rixMGoEB,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<HospitalVisitSchedulesCubit>()
                            .deleteSchedule(hospitalVisitScheduleId);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        '네',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ).rixMGoEB,
                      ),
                    ),
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
