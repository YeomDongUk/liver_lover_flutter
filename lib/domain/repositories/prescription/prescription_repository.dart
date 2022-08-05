// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/entities/prescription/prescription_overview.dart';

abstract class PrescriptionRepository {
  Future<Either<Failure, Prescription>> getPrescription(
    String id,
  );

  Future<Either<Failure, Prescription>> createPrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanion,
    required List<MedicationSchedulesCompanion> medicationSchedulesCompanions,
  });

  Future<Either<Failure, Prescription>> updatePrescription(
    PrescriptionsCompanion companion,
  );

  Future<Either<Failure, int>> deletePrescription(String id);

  Future<Either<Failure, List<PrescriptionOverview>>>
      getPrescriptionOverviews();
}
