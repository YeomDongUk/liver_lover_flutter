// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class UpdateMedicationScheduleGroupPushParam {
  const UpdateMedicationScheduleGroupPushParam({
    required this.reservedAt,
    required this.afterPush,
    required this.beforePush,
  });

  final DateTime reservedAt;
  final bool afterPush;
  final bool beforePush;
}

class UpdateMedicationScheduleGroupPush
    extends UseCase<void, UpdateMedicationScheduleGroupPushParam> {
  const UpdateMedicationScheduleGroupPush({
    required this.medicationScheduleRepository,
  });

  final MedicationScheduleRepository medicationScheduleRepository;

  @override
  Future<Either<Failure, void>> call(
    UpdateMedicationScheduleGroupPushParam param,
  ) =>
      medicationScheduleRepository.updateMedicationSchedulesPush(
        beforePush: param.beforePush,
        afterPush: param.afterPush,
        reservedAt: param.reservedAt,
      );
}
