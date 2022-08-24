// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class ToggleHospitalVisitSchedulePush
    extends UseCase<HospitalVisitSchedule, HospitalVisitSchedulesCompanion> {
  const ToggleHospitalVisitSchedulePush(this.hospitalVisitScheduleRepository);

  final HospitalVisitScheduleRepository hospitalVisitScheduleRepository;

  @override
  Future<Either<Failure, HospitalVisitSchedule>> call(
    HospitalVisitSchedulesCompanion params,
  ) =>
      hospitalVisitScheduleRepository.toggleHospitalVisitSchedulePush(
        id: params.id.value,
        companion: params,
      );
}
