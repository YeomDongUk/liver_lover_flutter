// Package imports:
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/hospital_visit_schedule/hospital_visit_schedule_local_data_source.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class HospitalVisitScheduleRepositoryImpl
    implements HospitalVisitScheduleRepository {
  HospitalVisitScheduleRepositoryImpl(
    this.hospitalVisitScheduleLocalDataSource,
    this.userId,
  );

  final HospitalVisitScheduleLocalDataSource
      hospitalVisitScheduleLocalDataSource;

  final UserId userId;
  String get _userId => userId.value;

  @override
  Future<Either<Failure, HospitalVisitSchedule>> createHospitalVisitSchedule(
    HospitalVisitSchedulesCompanion companion,
  ) async {
    try {
      final hospitalVisitScheduleModel =
          await hospitalVisitScheduleLocalDataSource
              .createHospitalVisitSchedule(
        userId: _userId,
        companion: companion.copyWith(userId: Value(_userId)),
      );

      return Right(
        HospitalVisitSchedule.fromJson(hospitalVisitScheduleModel.toJson()),
      );
    } catch (e) {
      return const Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteHospitalVisitSchedule({
    required String id,
  }) async {
    try {
      final deletedCount = await hospitalVisitScheduleLocalDataSource
          .deleteHospitalVisitSchedule(
        id: id,
        userId: _userId,
      );

      return deletedCount == 1
          ? Right(deletedCount)
          : const Left(QueryFailure());
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Either<Failure, Stream<List<HospitalVisitSchedule>>>
      getHospitalVisitSchedulesStream() {
    try {
      final hospitalVisitSchedulesStream =
          hospitalVisitScheduleLocalDataSource.getHospitalVisitSchedulesStream(
        userId: _userId,
      );

      return Right(
        hospitalVisitSchedulesStream.map(
          (hospitalVisitScheduleModels) => hospitalVisitScheduleModels
              .map((e) => HospitalVisitSchedule.fromJson(e.toJson()))
              .toList(),
        ),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, HospitalVisitSchedule>> updateHospitalVisitSchedule({
    required String id,
    required HospitalVisitSchedulesCompanion companion,
  }) async {
    try {
      final hospitalVisitScheduleModel =
          await hospitalVisitScheduleLocalDataSource
              .updateHospitalVisitSchedule(
        id: id,
        userId: _userId,
        companion: companion,
      );

      return Right(
        HospitalVisitSchedule.fromJson(hospitalVisitScheduleModel.toJson()),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, HospitalVisitSchedule>>
      toggleHospitalVisitSchedulePush({
    required String id,
    required HospitalVisitSchedulesCompanion companion,
  }) async {
    try {
      final hospitalVisitScheduleModel =
          await hospitalVisitScheduleLocalDataSource
              .toggleHospitalVisitSchedulePush(
        id: id,
        userId: _userId,
        companion: companion,
      );

      return Right(
        HospitalVisitSchedule.fromJson(hospitalVisitScheduleModel.toJson()),
      );
    } catch (e) {
      return const Left(QueryFailure());
    }
  }
}
