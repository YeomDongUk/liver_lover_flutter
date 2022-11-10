// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_daily_group.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationScheduleDailyGroupsStream
    extends UseCase<Stream<List<MedicationScheduleDailyGroup>>, DateTime> {
  const GetMedicationScheduleDailyGroupsStream({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, Stream<List<MedicationScheduleDailyGroup>>>> call(
    DateTime dateTime,
  ) async =>
      medicationScheduleRepository.getMedicationScheduleDailyGroups(
        dateTime: dateTime,
      );
}
