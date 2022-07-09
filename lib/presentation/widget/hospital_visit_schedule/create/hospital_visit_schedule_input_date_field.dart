import 'package:flutter/material.dart';
import 'package:yak/core/static/static.dart';

class HospitalScheduleInputDateField extends StatelessWidget {
  const HospitalScheduleInputDateField({
    super.key,
    required this.label,
    required this.strDateTimeAt,
    this.onTap,
  });
  final String label;
  final String strDateTimeAt;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        GestureDetector(
          onTap: onTap,
          child: Text(
            strDateTimeAt.isEmpty
                ? strDateTimeAt
                : reservedAtDateFormat.format(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(strDateTimeAt),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
