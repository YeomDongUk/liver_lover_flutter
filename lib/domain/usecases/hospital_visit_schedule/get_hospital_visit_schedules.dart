// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/usecases/usecase.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';

class GetHospitalVisitSchedulesStream
    extends UseCase<Stream<List<HospitalVisitSchedule>>, void> {
  const GetHospitalVisitSchedulesStream(this.hospitalVisitScheduleRepository);

  final HospitalVisitScheduleRepository hospitalVisitScheduleRepository;

  @override
  Future<Either<Failure, Stream<List<HospitalVisitSchedule>>>> call(
    void param,
  ) async =>
      hospitalVisitScheduleRepository.getHospitalVisitSchedulesStream();
}
