// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/auth/join/join_input_form_field.dart';

class HospitalVisitScheduleTextField extends StatelessWidget {
  const HospitalVisitScheduleTextField({
    super.key,
    required this.label,
    required this.focusNode,
    required this.onChanged,
    this.nextFocusNode,
    this.initialValue,
  });

  final String label;
  final String? initialValue;
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
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.gray,
          ).rixMGoB,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: JoinContainer(
            color: Colors.white,
            child: JoinInputFormField(
              initialValue: initialValue ?? '',
              focusNode: focusNode,
              onChanged: onChanged,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (str) =>
                  FocusScope.of(context).requestFocus(nextFocusNode),
            ),
          ),
        ),
      ],
    );
  }
}
