// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';

class CreatePills extends UseCase<List<Pill>, List<PillsCompanion>> {
  CreatePills(this.pillRepository);

  final PillRepository pillRepository;
  @override
  Future<Either<Failure, List<Pill>>> call(List<PillsCompanion> params) =>
      pillRepository.createPills(params);
}
