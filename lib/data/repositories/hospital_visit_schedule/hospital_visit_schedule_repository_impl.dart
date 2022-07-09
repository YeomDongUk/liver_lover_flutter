import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
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
        companion: companion,
      );

      return Right(
        HospitalVisitSchedule.fromJson(hospitalVisitScheduleModel.toJson()),
      );
    } catch (e) {
      return Left(CreateFailure());
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

      return deletedCount == 1 ? Right(deletedCount) : Left(QueryFailure());
    } catch (e) {
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<HospitalVisitSchedule>>>
      getHospitalVisitSchedules({
    required bool visited,
  }) async {
    try {
      final hospitalVisitScheduleModels =
          await hospitalVisitScheduleLocalDataSource.getHospitalVisitSchedules(
        userId: _userId,
        visited: visited,
      );
      return Right(
        hospitalVisitScheduleModels
            .map((e) => HospitalVisitSchedule.fromJson(e.toJson()))
            .toList(),
      );
    } catch (e) {
      return Left(QueryFailure());
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
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, HospitalVisitSchedule>> getHospitalVisitSchedule(
    String id,
  ) async {
    try {
      final hospitalVisitScheduleModel =
          await hospitalVisitScheduleLocalDataSource.getHospitalVisitSchedule(
        id: id,
        userId: _userId,
      );
      return Right(
        HospitalVisitSchedule.fromJson(hospitalVisitScheduleModel.toJson()),
      );
    } catch (e) {
      return Left(QueryFailure());
    }
  }
}
