// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/home_location.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/presentation/bloc/prescription/prescriptions_cubit.dart';
import 'package:yak/presentation/page/medication_schedule/prescription/prescription_detail_page.dart';
import 'package:yak/presentation/page/prescription/prescription_create_page.dart';
import 'package:yak/presentation/page/prescription/prescription_update_page.dart';

/// 복약 로케이션
class PrescriptionLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.pathParameters['id'];
    final mapData = data as Map<String, dynamic>?;
    final prescriptionsCubit =
        mapData?['prescriptionsCubit'] as PrescriptionsCubit?;
    final prescription = mapData?['prescription'] as Prescription?;

    return [
      ...HomeLocation().buildPages(context, state),
      if (id != null) ...[
        BeamPage(
          type: BeamPageType.cupertino,
          key: const ValueKey('prescription_detail'),
          name: 'prescription_detail_page',
          title: '처방전정보',
          child: PrescriptionDetailPage(
            id: id,
            prescriptionsCubit: prescriptionsCubit!,
          ),
        ),
        if (state.uri.path.contains('update'))
          BeamPage(
            type: BeamPageType.cupertino,
            key: ValueKey('prescription_schedule_update_$id'),
            name: 'prescription_schedule_update_page',
            title: '처방전 등록 페이지',
            child: PrescriptionUpdatePage(
              prescription: prescription!,
            ),
          ),
      ],
      if (state.uri.path == '/prescriptions/create')
        const BeamPage(
          type: BeamPageType.cupertino,
          key: ValueKey('prescription_schedule_create'),
          name: 'prescription_schedule_create_page',
          title: '처방전 등록 페이지',
          child: PrescriptionCreatePage(),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        '/prescriptions',
        '/prescriptions/create',
        '/prescriptions/:id',
        '/prescriptions/:id/update',
      ];
}
