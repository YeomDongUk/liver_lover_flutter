import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/metabolic_disease/metabolic_disease_repository.dart';

class UpsertMetabolicDisease extends UseCase<void, MetabolicDiseasesCompanion> {
  UpsertMetabolicDisease({required this.metabolicDiseaseRepository});

  final MetabolicDiseaseRepository metabolicDiseaseRepository;
  @override
  Future<Either<Failure, void>> call(MetabolicDiseasesCompanion params) =>
      metabolicDiseaseRepository.upsertMetabolicDisease(
        params,
      );
}
