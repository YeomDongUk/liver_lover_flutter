import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationAdherenecePercent extends UseCase<double, void> {
  const GetMedicationAdherenecePercent({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, double>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
