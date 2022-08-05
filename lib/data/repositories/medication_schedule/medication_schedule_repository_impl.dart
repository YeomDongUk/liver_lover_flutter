// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class MedicationScheduleRepositoryImpl implements MedicationScheduleRepository {
  MedicationScheduleRepositoryImpl(
    this.medicationScheduleLocalDataSource,
    this.userId,
  );

  final MedicationScheduleLocalDataSource medicationScheduleLocalDataSource;
  final UserId userId;

  String get _userId => userId.value;

  @override
  Future<Either<Failure, MedicationSchedule>> createMedicationSchedule(
    MedicationSchedulesCompanion companion,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteMedicationSchedule(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MedicationSchedule>> updateMedicationSchedule(
    MedicationSchedulesCompanion companion,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesBetweenReservedAt({
    required DateTime startAt,
    DateTime? endAt,
    bool? onlyBeforeMedication,
  }) async {
    try {
      final medicationScheduleModels = await medicationScheduleLocalDataSource
          .getMedicationSchedulesBetweenReservedAt(
        userId: _userId,
        startAt: startAt,
      );

      return Right(
        medicationScheduleModels
            .map((e) => MedicationSchedule.fromJson(e.toJson()))
            .toList(),
      );
    } catch (e) {
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesByPrescriptionId({
    required String prescriptionId,
  }) {
    // TODO: implement getMedicationSchedulesByPrescriptionId
    throw UnimplementedError();
  }
}
