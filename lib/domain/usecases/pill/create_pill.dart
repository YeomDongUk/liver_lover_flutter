// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';

class CreatePill extends UseCase<Pill, PillsCompanion> {
  CreatePill(this.pillRepository);

  final PillRepository pillRepository;
  @override
  Future<Either<Failure, Pill>> call(PillsCompanion params) =>
      pillRepository.createPill(params);
}
