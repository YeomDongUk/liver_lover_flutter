import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class DeleteMedicationSchedule extends UseCase<bool, String> {
  const DeleteMedicationSchedule(this.medicationScheduleRepository);

  final MedicationScheduleRepository medicationScheduleRepository;
  @override
  Future<Either<Failure, bool>> call(String params) =>
      medicationScheduleRepository.deleteMedicationSchedule(params);
}
