// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/pill/pill.dart';

abstract class PillRepository {
  Future<Either<Failure, Pill>> getPill(String id);
  Future<Either<Failure, List<Pill>>> getPills(String name);
  Future<Either<Failure, void>> createPill(PillsCompanion companion);
  Future<Either<Failure, List<Pill>>> createPills(
    List<PillsCompanion> companion,
  );
}
