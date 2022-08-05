// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/class/between.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/examination_result/examination_result.dart';
import 'package:yak/domain/repositories/examination_result/excercise_history_repository.dart';

class GetExaminationResults
    extends UseCase<List<ExaminationResult>, BetweenDateTime> {
  const GetExaminationResults({
    required this.examinationResultRepository,
  });

  final ExaminationResultRepository examinationResultRepository;

  @override
  Future<Either<Failure, List<ExaminationResult>>> call(
    BetweenDateTime params,
  ) =>
      examinationResultRepository.getExaminationResults(
        startAt: params.start,
        endAt: params.end,
      );
}
