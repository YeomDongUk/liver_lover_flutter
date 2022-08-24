// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class HospitalVisitScheduleConfirmDialog extends StatelessWidget {
  const HospitalVisitScheduleConfirmDialog({
    super.key,
    required this.hospitalVisitSchedule,
  });

  final HospitalVisitSchedule hospitalVisitSchedule;

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        children: [],
      ),
    );
  }
}
