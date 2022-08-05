// ignore_for_file: unnecessary_raw_strings

// Package imports:
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter getPhoneInputFormatter({String? initialText}) =>
    MaskTextInputFormatter(
      initialText: initialText,
      mask: '010-####-####',
      filter: {
        '0': RegExp(r'[0]'),
        '1': RegExp(r'[1]'),
        '#': RegExp(r'[0-9]'),
      },
    );

MaskTextInputFormatter getBirthYearInputFormatter({String? initialText}) =>
    MaskTextInputFormatter(
      initialText: initialText,
      mask: '1!##',
      filter: {
        '1': RegExp(r'[1]'),
        '!': RegExp(r'[0,9]'),
        '#': RegExp(r'[0-9]'),
      },
    );

MaskTextInputFormatter getHeightInputFormatter({String? initialText}) =>
    MaskTextInputFormatter(
      initialText: initialText,
      mask: '###',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
