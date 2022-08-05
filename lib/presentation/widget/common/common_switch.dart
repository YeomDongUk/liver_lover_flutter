// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_switch/flutter_switch.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

class CommonSwitch extends StatelessWidget {
  const CommonSwitch({
    super.key,
    required this.value,
    required this.onToggle,
  });
  final bool value;
  final void Function(bool) onToggle;
  @override
  Widget build(BuildContext context) => FlutterSwitch(
        width: 48,
        height: 22,
        toggleSize: 20,
        padding: 2,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: AppColors.blueGrayLight,
        value: value,
        onToggle: onToggle,
      );
}
