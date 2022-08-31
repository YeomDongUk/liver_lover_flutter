import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';

abstract class MedicationInformationRepository {
  Either<Failure, Stream<List<MedicationInformation>>>
      getMedicationInformationsStream();
}
