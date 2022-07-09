import 'package:yak/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class DeleteHospitalVisitSchedule extends UseCase<int, String> {
  const DeleteHospitalVisitSchedule(this.hospitalVisitScheduleRepository);

  final HospitalVisitScheduleRepository hospitalVisitScheduleRepository;
  @override
  Future<Either<Failure, int>> call(String params) =>
      hospitalVisitScheduleRepository.deleteHospitalVisitSchedule(id: params);
}
