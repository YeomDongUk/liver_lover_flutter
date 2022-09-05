// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';

abstract class PrescriptionRepository {
  Future<Either<Failure, Prescription>> getPrescription(
    String id,
  );

  Future<Either<Failure, Prescription>> createPrescription({
    required PrescriptionCreateInput createInput,
  });

  Future<Either<Failure, void>> updatePrescription({
    required PrescriptionUpdateInput updateInput,
  });

  Future<Either<Failure, int>> deletePrescription(String id);

  Either<Failure, Stream<List<Prescription>>> getPrescriptions();
}
