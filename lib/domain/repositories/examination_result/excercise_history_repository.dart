// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';

abstract class ExaminationResultRepository {
  Future<Either<Failure, List<ExaminationResult>>> getExaminationResults({
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<Either<Failure, ExaminationResult>> upsertExaminationResult({
    required ExaminationResultsCompanion companion,
  });
}
