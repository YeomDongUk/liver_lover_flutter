// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class DoAllMedication extends UseCase<void, DateTime> {
  DoAllMedication({required this.medicationScheduleRepository});

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, void>> call(DateTime reservedAt) async =>
      medicationScheduleRepository.medicateAll(
        reservedAt: reservedAt,
      );
}
