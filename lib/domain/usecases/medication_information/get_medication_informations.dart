// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';

class GetMedicationInformations
    extends UseCase<Stream<List<MedicationInformation>>, void> {
  @override
  Future<Either<Failure, Stream<List<MedicationInformation>>>> call(
      void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
