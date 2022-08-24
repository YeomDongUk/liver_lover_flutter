// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/repositories/smoking_history/smoking_history_repository.dart';

class GetLastSmokingHistoryStream
    extends UseCase<Stream<SmokingHistory?>, void> {
  const GetLastSmokingHistoryStream({
    required this.smokingHistoryRepository,
  });

  final SmokingHistoryRepository smokingHistoryRepository;
  @override
  Future<Either<Failure, Stream<SmokingHistory?>>> call(void params) async =>
      smokingHistoryRepository.getLastSmokingHistoryStream();
}
