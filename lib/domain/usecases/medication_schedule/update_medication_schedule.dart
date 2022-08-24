// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_create_input.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class UpdateMedicationSchedule
    extends UseCase<MedicationSchedule, MedicationScheduleCreateInput> {
  const UpdateMedicationSchedule(this.medicationScheduleRepository);

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, MedicationSchedule>> call(
    MedicationScheduleCreateInput params,
  ) =>
      medicationScheduleRepository.createMedicationSchedule(params);
}
