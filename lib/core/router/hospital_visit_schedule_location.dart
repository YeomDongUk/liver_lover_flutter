// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/presentation/page/hospital_visit_schedules/calendar/hospital_visit_schedule_calendar_page.dart';
import 'package:yak/presentation/page/hospital_visit_schedules/create/hospital_visit_schedule_create_page.dart';
import 'package:yak/presentation/page/hospital_visit_schedules/update/hospital_visit_schedule_update_page.dart';

class HospitalVisitScheduleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.pathParameters['id'];
    final mapData = data as Map<String, dynamic>?;
    final hospitalVisitSchedule =
        mapData?['hospitalVisitSchedule'] as HospitalVisitSchedule?;

    return [
      ...HomeLocation().buildPages(context, state),
      if (state.pathPatternSegments.contains('create'))
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('create-hospital-visit-schedule'),
          name: 'HospitalVisitScheduleCreatePage',
          title: '외래/검진 일정 등록',
          child: HospitalVisitScheduleCreatePage(),
        )
      else if (state.pathPatternSegments.contains('update'))
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('update-hospital-visit-schedule'),
          name: 'HospitalVisitScheduleUpdatePage',
          title: '외래/검진 일정 등록',
          child: HospitalVisitScheduleUpdatePage(
            hospitalVisitSchedule: hospitalVisitSchedule!,
          ),
        )
      else if (state.uri.path == Routes.hospitalVisitSchedulesCalendar)
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('hospital-visit-schedule-calendar'),
          name: 'hospitalVisitScheduleCalendarPage',
          title: '',
          child: HospitalVisitScheduleCalendarPage(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.hospitalVisitScheduleCreate,
        Routes.hospitalVisitScheduleUpdate,
        '${Routes.hospitalVisitScheduleUpdate}/:id',
        Routes.hospitalVisitSchedulesCalendar,
      ];
}
