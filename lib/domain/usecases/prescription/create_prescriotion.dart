// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class CreatePrescription extends UseCase<Prescription, PrescriptionsCompanion> {
  CreatePrescription(this.prescriptionRepository);

  final PrescriptionRepository prescriptionRepository;

  @override
  Future<Either<Failure, Prescription>> call(PrescriptionsCompanion params) {
    throw UnimplementedError();
  }
}
