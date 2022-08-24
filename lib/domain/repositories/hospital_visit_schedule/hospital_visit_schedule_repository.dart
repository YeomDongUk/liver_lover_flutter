// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';

abstract class HospitalVisitScheduleRepository {
  Future<Either<Failure, HospitalVisitSchedule>> getHospitalVisitSchedule(
    String id,
  );

  Future<Either<Failure, List<HospitalVisitSchedule>>>
      getHospitalVisitSchedules({
    required bool visited,
  });

  Future<Either<Failure, HospitalVisitSchedule>> createHospitalVisitSchedule(
    HospitalVisitSchedulesCompanion companion,
  );

  Future<Either<Failure, HospitalVisitSchedule>> updateHospitalVisitSchedule({
    required String id,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<Either<Failure, HospitalVisitSchedule>>
      toggleHospitalVisitSchedulePush({
    required String id,
    required HospitalVisitSchedulesCompanion companion,
  });

  Future<Either<Failure, int>> deleteHospitalVisitSchedule({
    required String id,
  });
}
