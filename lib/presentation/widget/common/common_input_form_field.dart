// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:yak/core/static/text_style.dart';

class CommonInputFormField extends StatelessWidget {
  const CommonInputFormField({
    super.key,
    this.focusNode,
    this.onChanged,
    this.initialValue = '',
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.textStyle,
    this.textAlign = TextAlign.start,
  });

  final FocusNode? focusNode;
  final String initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: focusNode,
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatters,
        style: textStyle ??
            const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ).rixMGoB,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: InputBorder.none,
        ),
        textAlign: textAlign,
      );
}
