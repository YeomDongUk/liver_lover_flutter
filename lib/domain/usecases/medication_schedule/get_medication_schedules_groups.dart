// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationSchedulesGroups
    extends UseCase<Stream<Future<List<MedicationSchedulesGroup>>>, DateTime> {
  const GetMedicationSchedulesGroups({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;
  @override
  Future<Either<Failure, Stream<Future<List<MedicationSchedulesGroup>>>>> call(
    DateTime date,
  ) async =>
      medicationScheduleRepository.getMedicationSchedulesGroupsStream(
        date: date,
      );
}
