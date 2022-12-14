// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/metabolic_disease.dart';

abstract class MetabolicDiseaseRepository {
  Future<Either<Failure, MetabolicDisease>> getMetabolicDisease();
  Future<Either<Failure, void>> upsertMetabolicDisease(
    MetabolicDiseasesCompanion companion,
  );
}
