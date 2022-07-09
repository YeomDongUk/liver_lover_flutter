import 'package:dartz/dartz.dart';
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class GetHospitalVisitSchedules
    extends UseCase<List<HospitalVisitSchedule>, bool> {
  const GetHospitalVisitSchedules(this.hospitalVisitScheduleRepository);

  final HospitalVisitScheduleRepository hospitalVisitScheduleRepository;

  @override
  Future<Either<Failure, List<HospitalVisitSchedule>>> call(bool visited) =>
      hospitalVisitScheduleRepository.getHospitalVisitSchedules(
        visited: visited,
      );
}
