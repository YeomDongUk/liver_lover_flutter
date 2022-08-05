// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/prescription/prescription_overview.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class GetPrescriptionOverviews
    extends UseCase<List<PrescriptionOverview>, void> {
  GetPrescriptionOverviews(this.prescriptionRepository);

  final PrescriptionRepository prescriptionRepository;

  @override
  Future<Either<Failure, List<PrescriptionOverview>>> call(void params) =>
      prescriptionRepository.getPrescriptionOverviews();
}
