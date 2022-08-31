// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class HospitalVisitScheduleDoneCheckDialog extends StatelessWidget {
  const HospitalVisitScheduleDoneCheckDialog({
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
              '진료완료 확인',
              style: const TextStyle(
                fontSize: 17,
                color: AppColors.primary,
              ).rixMGoEB,
            ),
            const SizedBox(height: 12),
            Text(
              '예정된 진료를 완료 하셨습니까?',
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 13,
              ).rixMGoB,
            ),
            const SizedBox(height: 40),
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
                            .doneSchedule(hospitalVisitScheduleId);
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
