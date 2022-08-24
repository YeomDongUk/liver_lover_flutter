// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class CreatePrescription
    extends UseCase<Prescription, PrescriptionCreateInput> {
  CreatePrescription({
    required this.prescriptionRepository,
  });

  final PrescriptionRepository prescriptionRepository;

  @override
  Future<Either<Failure, Prescription>> call(PrescriptionCreateInput param) =>
      prescriptionRepository.createPrescription(createInput: param);
}
