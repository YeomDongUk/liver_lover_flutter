// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class DoMedication extends UseCase<void, String> {
  DoMedication({required this.medicationScheduleRepository});

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, void>> call(String scheduleId) async =>
      medicationScheduleRepository.medicate(
        scheduleId: scheduleId,
      );
}
