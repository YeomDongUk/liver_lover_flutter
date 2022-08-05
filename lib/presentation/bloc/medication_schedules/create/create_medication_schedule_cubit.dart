// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'create_medication_schedule_state.dart';

class CreateMedicationScheduleCubit
    extends Cubit<CreateMedicationScheduleState> {
  CreateMedicationScheduleCubit()
      : super(const CreateMedicationScheduleState());
}
