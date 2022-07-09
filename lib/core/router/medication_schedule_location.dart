import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';

/// 복약 로케이션
class MedicationScheduleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [];
}
