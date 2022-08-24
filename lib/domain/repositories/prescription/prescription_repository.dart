// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_notification_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';

abstract class PrescriptionRepository {
  Future<Either<Failure, Prescription>> getPrescription(
    String id,
  );

  Future<Either<Failure, Prescription>> createPrescription({
    required PrescriptionCreateInput createInput,
  });

  Future<Either<Failure, Prescription>> updatePrescription({
    required PrescriptionCreateInput createInput,
  });

  Future<Either<Failure, int>> deletePrescription(String id);

  Either<Failure, Stream<Future<List<Prescription>>>> getPrescriptions();

  Future<Either<Failure, void>> togglePrescriptionNotification({
    required PrescriptionNotificationUpdateInput
        prescriptionNotificationUpdateInput,
  });
  // Future<Either<Failure, List<PrescriptionOverview>>>
  //     getPrescriptionOverviews();
}
