// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class UpdateMedicationScheduleGroupPushParam {
  const UpdateMedicationScheduleGroupPushParam({
    required this.ids,
    required this.push,
  });

  final List<String> ids;
  final bool push;
}

class UpdateMedicationScheduleGroupPush
    extends UseCase<void, UpdateMedicationScheduleGroupPushParam> {
  const UpdateMedicationScheduleGroupPush({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, void>> call(
    UpdateMedicationScheduleGroupPushParam pram,
  ) =>
      medicationScheduleRepository.updateMedicationSchedulesPush(
        push: pram.push,
        medicationScheduleIds: pram.ids,
      );
}
