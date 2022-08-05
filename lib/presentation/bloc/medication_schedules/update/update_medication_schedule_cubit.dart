// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_medication_schedule_state.dart';

class UpdateMedicationScheduleCubit
    extends Cubit<UpdateMedicationScheduleState> {
  UpdateMedicationScheduleCubit() : super(UpdateMedicationScheduleInitial());
}
