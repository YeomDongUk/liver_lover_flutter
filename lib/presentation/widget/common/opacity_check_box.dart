import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yak/core/static/color.dart';

class OpacityCheckBox extends StatefulWidget {
  const OpacityCheckBox({
    super.key,
    this.onChanged,
    this.value,
  });
  final void Function(bool)? onChanged;
  final bool? value;

  @override
  State<OpacityCheckBox> createState() => _OpacityCheckBoxState();
}

class _OpacityCheckBoxState extends State<OpacityCheckBox> {
  late bool value = widget.value ?? false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant OpacityCheckBox oldWidget) {
    if (value != oldWidget.value) {
      print(value);
      setState(() => value = widget.value ?? oldWidget.value ?? false);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => value = !value);
        widget.onChanged?.call(value);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGray,
          ),
        ),
        child: AnimatedOpacity(
          opacity: value ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: SvgPicture.asset('assets/svg/join_check.svg'),
        ),
      ),
    );
  }
}
