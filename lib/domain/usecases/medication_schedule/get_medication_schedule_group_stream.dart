import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationScheduleGroupStream
    extends UseCase<Stream<MedicationScheduleGroup>, DateTime> {
  const GetMedicationScheduleGroupStream({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;
  @override
  Future<Either<Failure, Stream<MedicationScheduleGroup>>> call(
    DateTime dateTime,
  ) async =>
      medicationScheduleRepository.getMedicationScheduleGroup(
        dateTime: dateTime,
      );
}
