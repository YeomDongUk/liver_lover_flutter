// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetTodayMedicationSchedules
    extends UseCase<List<MedicationSchedule>, void> {
  const GetTodayMedicationSchedules(this.medicationScheduleRepository);

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, List<MedicationSchedule>>> call(void params) async {
    final startAt = DateTime.now();
    final endAt = DateTime(startAt.year, startAt.month, startAt.day + 1).add(
      const Duration(seconds: -1),
    );

    return medicationScheduleRepository.getMedicationSchedulesBetweenReservedAt(
      startAt: startAt,
      endAt: endAt,
    );
  }
}
