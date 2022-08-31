// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/data/models/prescription/prescription_notification_update_input.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class TogglePrescriptionNotification
    extends UseCase<void, PrescriptionNotificationUpdateInput> {
  const TogglePrescriptionNotification({
    required this.prescriptionRepository,
  });

  final PrescriptionRepository prescriptionRepository;
  @override
  Future<Either<Failure, void>> call(
    PrescriptionNotificationUpdateInput input,
  ) async {
    await prescriptionRepository.togglePrescriptionNotification(
      prescriptionNotificationUpdateInput: input,
    );
    return const Right(null);
  }
}
