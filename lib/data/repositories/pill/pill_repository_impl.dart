// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/datasources/remote/pill/pill_remote_data_source.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';

class PillRepositoryImpl implements PillRepository {
  const PillRepositoryImpl(
    this.pillLocalDataSource,
    this.pillRemoteDataSource,
  );

  final PillLocalDataSource pillLocalDataSource;
  final PillRemoteDataSource pillRemoteDataSource;

  @override
  Future<Either<Failure, Pill>> getPill(String id) async {
    try {
      final pillModel = await pillLocalDataSource.getPill(id);
      return Right(Pill.fromJson(pillModel.toJson()));
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pill>>> getPills(String name) async {
    try {
      final apiModels = await pillRemoteDataSource.findPills(name);

      return Right(
        apiModels.map((apiModel) => Pill.fromJson(apiModel.toMap())).toList(),
      );
    } catch (error) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createPill(PillsCompanion companion) async {
    try {
      await pillLocalDataSource.createPill(companion);
      return const Right(null);
    } catch (e) {
      return const Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pill>>> createPills(
    List<PillsCompanion> companions,
  ) async {
    try {
      final pillModels = await pillLocalDataSource.createPills(companions);
      return Right(pillModels.map((e) => Pill.fromJson(e.toJson())).toList());
    } catch (e) {
      return const Left(CreateFailure());
    }
  }
}
