import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class DoMedication extends UseCase<void, int> {
  DoMedication({required this.medicationScheduleRepository});

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, void>> call(int scheduleId) async =>
      medicationScheduleRepository.medicate(
        scheduleId: scheduleId,
      );
}
