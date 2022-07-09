import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class UpdateMedicationSchedule
    extends UseCase<MedicationSchedule, MedicationSchedulesCompanion> {
  const UpdateMedicationSchedule(this.medicationScheduleRepository);

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, MedicationSchedule>> call(
    MedicationSchedulesCompanion params,
  ) =>
      medicationScheduleRepository.createMedicationSchedule(params);
}
