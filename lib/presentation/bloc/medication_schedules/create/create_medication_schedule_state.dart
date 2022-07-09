part of 'create_medication_schedule_cubit.dart';

class CreateMedicationScheduleState extends Equatable {
  const CreateMedicationScheduleState({
    this.status = FormzStatus.pure,
  });

  final FormzStatus status;

  @override
  List<Object> get props => [status];
}
