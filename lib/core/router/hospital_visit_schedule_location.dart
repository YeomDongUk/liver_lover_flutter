// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/hospital_visit_schedules/create/create_hospital_visit_schedule_page.dart';
import 'package:yak/presentation/page/hospital_visit_schedules/update/update_hospital_visit_schedule_page.dart';

class HospitalVisitScheduleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      ...HomeLocation().buildPages(context, state),
      if (state.pathPatternSegments.contains('create'))
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('create-hospital-visit-schedule'),
          name: 'createHospitalVisitSchedulePage',
          title: '외래/검진 일정 등록',
          child: CreateHospitalVisitSchedulePage(),
        ),
      if (state.pathPatternSegments.contains('update') &&
          state.pathParameters['id'] != null)
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('update-hospital-visit-schedule'),
          name: 'updateHospitalVisitSchedulePage',
          title: '외래/검진 일정 수정',
          child: UpdateHospitalVisitSchedulePage(
            id: state.pathParameters['id']!,
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.hospitalVisitScheduleCreate,
        '${Routes.hospitalVisitScheduleUpdate}/:id',
      ];
}
