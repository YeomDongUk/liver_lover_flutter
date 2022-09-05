// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/presentation/page/medication_schedule/calendar/medication_schedule_calendar_page.dart';
import 'package:yak/presentation/page/medication_schedule/medication_schedule_group/medication_schedule_group_detail_page.dart';
import 'package:yak/presentation/page/medication_schedule/medication_schedules_create_page.dart';

/// 복약 로케이션
class MedicationScheduleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final mapData = data as Map<String, dynamic>?;
    final reservedAt = mapData?['reservedAt'] as DateTime?;
    return [
      ...HomeLocation().buildPages(context, state),
      if (state.uri.path == Routes.medicationSchedulesCreate)
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('medication-schedules-create'),
          name: 'MedicationSchedulesCreatePage',
          title: '복약일정 등록',
          child: MedicationSchedulesCreatePage(),
        ),
      if (state.uri.path == '${Routes.medicationSchedules}/groups/detail')
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('medication-schedule-group-detail'),
          name: 'MedicationScheduleGroupDetailPage',
          title: '복약 정보',
          child: MedicationScheduleGroupDetailPage(
            reservedAt: reservedAt!,
          ),
        ),
      if (state.uri.path == Routes.medicationSchedulesCalendar)
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('medication-schedule-calendar'),
          name: 'MedicationScheduleCalendarPage',
          title: '복약 정보',
          child: MedicationScheduleCalendarPage(),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        Routes.medicationSchedulesCreate,
        '${Routes.medicationSchedules}/groups/detail',
        Routes.medicationSchedulesCalendar,
      ];
}
