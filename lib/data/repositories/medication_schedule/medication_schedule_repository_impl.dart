// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_create_input.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_update_input.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedules_group.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';

class MedicationScheduleRepositoryImpl implements MedicationScheduleRepository {
  MedicationScheduleRepositoryImpl(
    this.medicationScheduleLocalDataSource,
    this.userId,
  );

  final MedicationScheduleLocalDataSource medicationScheduleLocalDataSource;
  final UserId userId;

  @override
  Future<Either<Failure, MedicationSchedule>> createMedicationSchedule(
    MedicationScheduleCreateInput companion,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteMedicationSchedule(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MedicationSchedule>> updateMedicationSchedule({
    required MedicationSchedule medicationSchedule,
  }) async {
    try {
      final model = medicationScheduleLocalDataSource.updateMedicationSchedule(
        id: medicationSchedule.id,
        medicationScheduleUpdateInput: MedicationScheduleUpdateInput.fromJson(
          medicationSchedule.toJson(),
        ),
      );

      return Right(MedicationSchedule.fromJson(model!.toJson()));
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<MedicationSchedule>>>
      getMedicationSchedulesByPrescriptionId({
    required String prescriptionId,
  }) {
    throw UnimplementedError();
  }

  @override
  Either<Failure, Stream<Future<List<MedicationSchedulesGroup>>>>
      getTodayMedicationSchedulesStream() => Right(
            medicationScheduleLocalDataSource
                .getMedicationSchedulesGroupsStream(
              userId: userId.value,
              date: DateTime.now(),
            ),
          );

  @override
  Either<Failure, Stream<Future<List<MedicationSchedulesGroup>>>>
      getMedicationSchedulesGroupsStream({
    required DateTime date,
  }) =>
          Right(
            medicationScheduleLocalDataSource
                .getMedicationSchedulesGroupsStream(
              userId: userId.value,
              date: date,
            ),
          );

  @override
  Future<Either<Failure, List<MedicationSchedule>>>
      updateMedicationSchedulesPush({
    required List<int> medicationScheduleIds,
    required bool push,
  }) async {
    final medicationSchedules =
        await medicationScheduleLocalDataSource.updateMedicationSchedulesPush(
      push: push,
      userId: userId.value,
      ids: medicationScheduleIds,
    );

    return Right(
      medicationSchedules
          .map((e) => MedicationSchedule.fromJson(e.toJson()))
          .toList(),
    );
  }

  @override
  Either<Failure, void> medicateAll({
    required DateTime reservedAt,
  }) =>
      Right(
        medicationScheduleLocalDataSource.medicationAll(
          userId: userId.value,
          reservedAt: reservedAt,
        ),
      );

  @override
  Either<Failure, void> medicate({required int scheduleId}) => Right(
        medicationScheduleLocalDataSource.medicate(
          userId: userId.value,
          scheduleId: scheduleId,
        ),
      );
}
