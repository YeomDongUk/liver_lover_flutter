import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yak/core/static/color.dart';

class OpacityCheckButton extends StatelessWidget {
  const OpacityCheckButton({
    super.key,
    this.onTap,
    this.opacity = 0,
  });

  final void Function()? onTap;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(3),
        ),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(
            milliseconds: 100,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SvgPicture.asset(
              'assets/svg/join_check.svg',
            ),
          ),
        ),
      ),
    );
  }
}
