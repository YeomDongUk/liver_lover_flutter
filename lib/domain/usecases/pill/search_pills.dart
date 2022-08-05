// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/repositories/pill/pill_repository.dart';

class SearchPills extends UseCase<List<Pill>, String> {
  const SearchPills(this.pillRepository);

  final PillRepository pillRepository;
  @override
  Future<Either<Failure, List<Pill>>> call(String params) =>
      pillRepository.getPills(params);
}
