// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/form/common.dart';
import 'package:yak/core/form/medication_schedule/medication_schedules_forms.dart';

part 'prescription_crate_state.dart';

class PrescriptionCrateCubit extends Cubit<PrescriptionCrateState> {
  PrescriptionCrateCubit()
      : super(
          PrescriptionCrateState(
            prescriptedAt: PrescriptedAt.pure(),
            medicatedAt: MedicatedAt.pure(),
          ),
        );
}
