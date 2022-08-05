// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';

class UpsertExaminationResult
    extends UseCase<ExaminationResult, ExaminationResultsCompanion> {
  const UpsertExaminationResult({
    required this.examinationResultRepository,
  });

  final ExaminationResultRepository examinationResultRepository;

  @override
  Future<Either<Failure, ExaminationResult>> call(
    ExaminationResultsCompanion params,
  ) =>
      examinationResultRepository.upsertExaminationResult(companion: params);
}
