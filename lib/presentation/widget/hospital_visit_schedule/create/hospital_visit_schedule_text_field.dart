import 'package:flutter/material.dart';

class HospitalVisitScheduleTextField extends StatelessWidget {
  const HospitalVisitScheduleTextField({
    super.key,
    required this.label,
    required this.focusNode,
    this.nextFocusNode,
    required this.onChanged,
  });

  final String label;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
        ),
        TextField(
          focusNode: focusNode,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          onSubmitted: (str) =>
              FocusScope.of(context).requestFocus(nextFocusNode),
        ),
      ],
    );
  }
}
