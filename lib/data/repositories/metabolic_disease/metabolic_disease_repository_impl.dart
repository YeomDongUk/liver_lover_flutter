import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/metabolic_disease/metabolic_disease_local_data_source.dart';
import 'package:yak/domain/entities/metabolic_disease.dart';
import 'package:yak/domain/repositories/metabolic_disease/metabolic_disease_repository.dart';

class MetabolicDiseaseRepositoryImpl implements MetabolicDiseaseRepository {
  MetabolicDiseaseRepositoryImpl({
    required this.userId,
    required this.metabolicDiseaseLocalDataSource,
  });

  final UserId userId;
  final MetabolicDiseaseLocalDataSource metabolicDiseaseLocalDataSource;

  @override
  Future<Either<Failure, MetabolicDisease>> getMetabolicDisease() async {
    try {
      final metabolicDisease =
          await metabolicDiseaseLocalDataSource.getMetabolicDisease(
        userId: userId.value,
      );

      return Right(MetabolicDisease.fromJson(metabolicDisease.toJson()));
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, void>> upsertMetabolicDisease(
    MetabolicDiseasesCompanion companion,
  ) async {
    try {
      await metabolicDiseaseLocalDataSource.upsertMetabolicDisease(
        userId: userId.value,
        companion: companion,
      );

      return const Right(null);
    } catch (e) {
      print(e);
      return const Left(QueryFailure());
    }
  }
}
