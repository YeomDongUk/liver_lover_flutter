import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';

abstract class MedicationScheduleRepository {
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesByPrescriptionId({
    required String prescriptionId,
  });

  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesBetweenReservedAt({
    required DateTime startAt,
    DateTime? endAt,
    bool? onlyBeforeMedication,
  });

  Future<Either<Failure, MedicationSchedule>> createMedicationSchedule(
    MedicationSchedulesCompanion companion,
  );
  Future<Either<Failure, MedicationSchedule>> updateMedicationSchedule(
    MedicationSchedulesCompanion companion,
  );
  Future<Either<Failure, bool>> deleteMedicationSchedule(String id);
}
