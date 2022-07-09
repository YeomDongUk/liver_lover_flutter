import 'package:dartz/dartz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class CreateHospitalVisitSchedule
    extends UseCase<HospitalVisitSchedule, HospitalVisitSchedulesCompanion> {
  const CreateHospitalVisitSchedule(this.hospitalVisitScheduleRepository);

  final HospitalVisitScheduleRepository hospitalVisitScheduleRepository;

  @override
  Future<Either<Failure, HospitalVisitSchedule>> call(
    HospitalVisitSchedulesCompanion params,
  ) =>
      hospitalVisitScheduleRepository.createHospitalVisitSchedule(params);
}
