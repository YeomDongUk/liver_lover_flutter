// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_create_input.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';

abstract class MedicationScheduleRepository {
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesByPrescriptionId({
    required String prescriptionId,
  });

  Future<Either<Failure, MedicationSchedule>> createMedicationSchedule(
    MedicationScheduleCreateInput createInput,
  );

  Future<Either<Failure, MedicationSchedule>> updateMedicationSchedule({
    required MedicationSchedule medicationSchedule,
  });

  Future<Either<Failure, bool>> deleteMedicationSchedule(String id);

  Future<Either<Failure, void>> updateMedicationSchedulesPush({
    required bool push,
    required List<String> medicationScheduleIds,
  });

  Either<Failure, void> medicateAll({
    required DateTime reservedAt,
  });

  Either<Failure, void> medicate({
    required String scheduleId,
  });

  Either<Failure, Stream<List<MedicationSchedule>>>
      getMedicationSchedulesStream();
}
