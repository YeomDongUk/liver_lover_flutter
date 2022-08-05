// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/class/circulator_result.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class HealthInformationDialog extends StatelessWidget {
  const HealthInformationDialog({
    super.key,
    required this.circulatorResult,
  });

  final CirculatorResult circulatorResult;

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      padding: const EdgeInsets.all(24),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              circulatorResult.text,
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 42),
            Text(
              '${((circulatorResult.value * 10).ceil()) / 10}',
              style: GoogleFonts.lato(
                color: circulatorResult.color,
                fontWeight: FontWeight.w800,
                fontSize: 70,
              ),
            ),
            const SizedBox(height: 21),
            Text(
              circulatorResult.resultText,
              style: TextStyle(
                color: circulatorResult.color,
                fontSize: 13,
              ).rixMGoB,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
