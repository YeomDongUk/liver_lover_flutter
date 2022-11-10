// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule_group.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class GetMedicationScheduleGroupsStream
    extends UseCase<Stream<List<MedicationScheduleGroup>>, DateTime> {
  const GetMedicationScheduleGroupsStream({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;
  @override
  Future<Either<Failure, Stream<List<MedicationScheduleGroup>>>> call(
    DateTime dateTime,
  ) async =>
      medicationScheduleRepository.getMedicationScheduleGroups(
        dateTime: dateTime,
      );
}
