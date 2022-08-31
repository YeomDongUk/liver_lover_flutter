// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class GetPrescriptions
    extends UseCase<Stream<Future<List<Prescription>>>, void> {
  GetPrescriptions({
    required this.prescriptionRepository,
  });

  final PrescriptionRepository prescriptionRepository;
  @override
  Future<Either<Failure, Stream<Future<List<Prescription>>>>> call(
    void params,
  ) async =>
      prescriptionRepository.getPrescriptions();
}
