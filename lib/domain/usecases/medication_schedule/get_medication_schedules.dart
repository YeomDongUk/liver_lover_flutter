// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationSchedules
    extends UseCase<Stream<List<MedicationSchedule>>, void> {
  const GetMedicationSchedules({required this.medicationScheduleRepository});

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, Stream<List<MedicationSchedule>>>> call(
          void params) async =>
      medicationScheduleRepository.getMedicationSchedulesStream();
}
