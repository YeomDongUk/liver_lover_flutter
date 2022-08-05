// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/entities/prescription/prescription_overview.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  const PrescriptionRepositoryImpl(
    this.prescriptionLocalDataSource,
    this.userId,
  );

  final PrescriptionLocalDataSource prescriptionLocalDataSource;
  final UserId userId;

  String get _userId => userId.value;

  @override
  Future<Either<Failure, Prescription>> createPrescription({
    required PrescriptionsCompanion prescriptionsCompanion,
    required List<MedicationInformationsCompanion>
        medicationInformationsCompanion,
    required List<MedicationSchedulesCompanion> medicationSchedulesCompanions,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deletePrescription(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Prescription>> getPrescription(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PrescriptionOverview>>>
      getPrescriptionOverviews() async {
    try {
      final prescriptionOverviewModels =
          await prescriptionLocalDataSource.getPrescriptionOverviews(_userId);

      final prescriptionOverviews = prescriptionOverviewModels
          .map(
            (e) => PrescriptionOverview(
              id: e.id,
              doctorName: e.doctorName,
              prescribedAt: e.prescribedAt,
              push: e.push,
              beforePush: e.beforePush,
              afterPush: e.afterPush,
              medicationInformations: e.medicationInformations
                  .map((e) => MedicationInformation.fromJson(e.toJson()))
                  .toList(),
              createdAt: e.createdAt,
              updatedAt: e.updatedAt,
            ),
          )
          .toList();
      return Right(prescriptionOverviews);
    } catch (e) {
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, Prescription>> updatePrescription(
    PrescriptionsCompanion companion,
  ) {
    throw UnimplementedError();
  }
}
