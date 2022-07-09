import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yak/core/static/text_style.dart';

class JoinInputFormField extends StatelessWidget {
  const JoinInputFormField({
    super.key,
    required this.focusNode,
    required this.initialValue,
    required this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
  });

  final FocusNode focusNode;
  final String initialValue;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: focusNode,
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ).rixMGoB,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          border: InputBorder.none,
        ),
      );
}
