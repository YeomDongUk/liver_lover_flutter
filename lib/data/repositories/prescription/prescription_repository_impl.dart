// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/prescription/prescription_local_data_source.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/repositories/prescription/prescription_repository.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  const PrescriptionRepositoryImpl({
    required this.prescriptionLocalDataSource,
    required this.userId,
  });

  final PrescriptionLocalDataSource prescriptionLocalDataSource;
  final UserId userId;

  String get _userId => userId.value;

  @override
  Future<Either<Failure, Prescription>> createPrescription({
    required PrescriptionCreateInput createInput,
  }) async {
    // try {
    final prescriptionModel =
        await prescriptionLocalDataSource.createPrescription(
      userId: _userId,
      createInput: createInput,
    );
    return Right(Prescription.fromJson(prescriptionModel.toJson()));
    // } catch (e) {
    //   Logger().e(e);
    //   return const Left(QueryFailure());
    // }
  }

  @override
  Future<Either<Failure, int>> deletePrescription(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Prescription>> getPrescription(String id) {
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, List<PrescriptionOverview>>>
  //     getPrescriptionOverviews() async {
  //   try {
  //     final prescriptionOverviewModels =
  //         await prescriptionLocalDataSource.getPrescriptionOverviews(_userId);

  //     final prescriptionOverviews = prescriptionOverviewModels
  //         .map(
  //           (e) => PrescriptionOverview(
  //             id: e.id,
  //             doctorName: e.doctorName,
  //             prescriptedAt: e.prescriptedAt,
  //             push: e.push,
  //             beforePush: e.beforePush,
  //             afterPush: e.afterPush,
  //             medicationInformations: e.medicationInformations
  //                 .map((e) => MedicationInformation.fromJson(e.toJson()))
  //                 .toList(),
  //             createdAt: e.createdAt,
  //             updatedAt: e.updatedAt,
  //           ),
  //         )
  //         .toList();
  //     return Right(prescriptionOverviews);
  //   } catch (e) {
  //     return const Left(QueryFailure());
  //   }
  // }

  @override
  Future<Either<Failure, void>> updatePrescription({
    required PrescriptionUpdateInput updateInput,
  }) async {
    try {
      await prescriptionLocalDataSource.updatePrescription(
        userId: userId.value,
        updateInput: updateInput,
      );
      return const Right(null);
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Either<Failure, Stream<List<Prescription>>> getPrescriptions() => Right(
        prescriptionLocalDataSource.getPrescriptions(
          userId: userId.value,
        ),
      );
}
