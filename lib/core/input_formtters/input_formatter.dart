// ignore_for_file: unnecessary_raw_strings

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneInputFormatter = MaskTextInputFormatter(
  mask: '010-####-####',
  filter: {
    '0': RegExp(r'[0]'),
    '1': RegExp(r'[1]'),
    '#': RegExp(r'[0-9]'),
  },
);

final birthYearInputFormatter = MaskTextInputFormatter(
  mask: '1!##',
  filter: {
    '1': RegExp(r'[1]'),
    '!': RegExp(r'[0,9]'),
    '#': RegExp(r'[0-9]'),
  },
);

final heightInputFormatter = MaskTextInputFormatter(
  mask: '###',
  filter: {
    '#': RegExp(r'[0-9]'),
  },
);
