// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/form/common.dart';

part 'medication_schedules_create_state.dart';

class MedicationScheduleCreateCubit
    extends Cubit<MedicationScheduleCreateState> {
  MedicationScheduleCreateCubit()
      : super(const MedicationScheduleCreateState());
}
