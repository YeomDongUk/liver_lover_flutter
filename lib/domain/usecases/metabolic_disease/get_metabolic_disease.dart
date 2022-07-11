import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/metabolic_disease.dart';
import 'package:yak/domain/repositories/metabolic_disease/metabolic_disease_repository.dart';

class GetMetabolicDisease extends UseCase<MetabolicDisease, void> {
  GetMetabolicDisease({required this.metabolicDiseaseRepository});

  final MetabolicDiseaseRepository metabolicDiseaseRepository;

  @override
  Future<Either<Failure, MetabolicDisease>> call(void params) =>
      metabolicDiseaseRepository.getMetabolicDisease();
}
