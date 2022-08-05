// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.beamBack(),
      icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
    );
  }
}
