import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class UpdatePrescription extends UseCase<void, PrescriptionUpdateInput> {
  const UpdatePrescription({required this.prescriptionRepository});

  final PrescriptionRepository prescriptionRepository;

  @override
  Future<Either<Failure, void>> call(PrescriptionUpdateInput updateInput) =>
      prescriptionRepository.updatePrescription(updateInput: updateInput);
}
