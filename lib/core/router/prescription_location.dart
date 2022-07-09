import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yak/core/router/home_location.dart';

/// 복약 로케이션
class PrescriptionLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        ...HomeLocation().buildPages(context, state),
        // const BeamPage(
        //   type: BeamPageType.cupertino,
        //   key: ValueKey('prescription_schedules'),
        //   name: 'prescription_schedules_page',
        //   title: '처방전 목록 페이지',
        //   child: PrescriptionsOverviewPage(),
        // ),
        // if (state.uri.path == '/prescription_schedules/create')
        //   const BeamPage(
        //     type: BeamPageType.cupertino,
        //     key: ValueKey('prescription_schedule_create'),
        //     name: 'prescription_schedule_create_page',
        //     title: '처방전 등록 페이지',
        //     child: PrescriptionScheduleCreatePage(),
        //   )
      ];

  @override
  List<Pattern> get pathPatterns => [
        '/prescription',
        '/prescription/create',
        '/prescription/:id',
        '/prescription/:id/update',
      ];
}
