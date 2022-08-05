// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:yak/presentation/widget/common/common_shadow_box.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    this.child,
    this.padding,
  });
  final Widget? child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: child == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonShadowBox(
                  padding: padding,
                  child: child,
                ),
                const SizedBox(height: 16),
                Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: Navigator.of(context).pop,
                    customBorder: const CircleBorder(),
                    child: Container(
                      alignment: Alignment.center,
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/svg/close.svg'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}