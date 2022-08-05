// Package imports:
import 'package:cuid/cuid.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/hospital_visit_schedule/hospital_visit_schedule_local_data_source.dart';
import 'package:yak/data/repositories/hospital_visit_schedule/hospital_visit_schedule_repository_impl.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';

class MockHospitalVisitScheduleLocalDataSource extends Mock
    implements HospitalVisitScheduleLocalDataSource {}

void main() {
  late HospitalVisitScheduleRepositoryImpl hospitalVisitScheduleRepositoryImpl;
  late MockHospitalVisitScheduleLocalDataSource
      mockHospitalVisitScheduleLocalDataSource;
  setUp(() {
    mockHospitalVisitScheduleLocalDataSource =
        MockHospitalVisitScheduleLocalDataSource();
    hospitalVisitScheduleRepositoryImpl = HospitalVisitScheduleRepositoryImpl(
      mockHospitalVisitScheduleLocalDataSource,
      UserIdImpl()..value = 'test',
    );
  });

  setUpAll(() {
    registerFallbackValue(const HospitalVisitSchedulesCompanion());
  });

  test('생성', () async {
    when(
      () =>
          mockHospitalVisitScheduleLocalDataSource.createHospitalVisitSchedule(
        userId: any(named: 'userId'),
        companion: any(
          named: 'companion',
        ),
      ),
    ).thenAnswer(
      (invocation) async => HospitalVisitScheduleModel(
        id: newCuid(),
        userId: 'test',
        doctorOffice: '테스트 실',
        hospitalName: '삼성 서울 병원',
        medicalSubject: '소화기 내과',
        doctorName: '염동욱',
        type: HospitalVisitScheduleType.regular,
        reservedAt: DateTime.now(),
        push: true,
        beforePush: true,
        afterPush: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    final hospitalVisitSchedule = await hospitalVisitScheduleRepositoryImpl
        .createHospitalVisitSchedule(const HospitalVisitSchedulesCompanion());

    expect(
      hospitalVisitSchedule.fold((l) => l, (r) => r),
      const TypeMatcher<HospitalVisitSchedule>(),
    );
  });

  test('수정', () async {
    when(
      () =>
          mockHospitalVisitScheduleLocalDataSource.updateHospitalVisitSchedule(
        id: any(named: 'id'),
        companion: any(named: 'companion'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer(
      (invocation) async => HospitalVisitScheduleModel(
        id: newCuid(),
        userId: 'test',
        type: HospitalVisitScheduleType.regular,
        doctorOffice: '테스트 실',
        hospitalName: '삼성 서울 병원',
        medicalSubject: '소화기 내과',
        doctorName: '염동욱',
        reservedAt: DateTime.now(),
        push: true,
        beforePush: true,
        afterPush: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    final hospitalVisitSchedule =
        await hospitalVisitScheduleRepositoryImpl.updateHospitalVisitSchedule(
      id: '0',
      companion: const HospitalVisitSchedulesCompanion(),
    );

    expect(
      hospitalVisitSchedule.fold((l) => l, (r) => r),
      const TypeMatcher<HospitalVisitSchedule>(),
    );
  });

  test('조회', () async {
    when(
      () => mockHospitalVisitScheduleLocalDataSource.getHospitalVisitSchedules(
        userId: 'test',
        visited: false,
      ),
    ).thenAnswer(
      (invocation) async => List.generate(
        10,
        (index) => HospitalVisitScheduleModel(
          id: newCuid(),
          userId: 'test',
          doctorOffice: '테스트 실',
          hospitalName: '삼성 서울 병원',
          type: HospitalVisitScheduleType.regular,
          medicalSubject: '소화기 내과',
          doctorName: '염동욱',
          reservedAt: DateTime.now()..add(Duration(days: -5 + index)),
          push: true,
          beforePush: true,
          afterPush: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ),
    );

    final hospitalVisitSchedules =
        await hospitalVisitScheduleRepositoryImpl.getHospitalVisitSchedules(
      visited: false,
    );

    expect(
      hospitalVisitSchedules.fold((l) => l, (r) => r),
      const TypeMatcher<List<HospitalVisitSchedule>>(),
    );
  });

  test('삭제', () async {
    when(
      () =>
          mockHospitalVisitScheduleLocalDataSource.deleteHospitalVisitSchedule(
        id: any(named: 'id'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((invocation) async => 1);

    final hospitalVisitSchedule = await hospitalVisitScheduleRepositoryImpl
        .deleteHospitalVisitSchedule(id: '0');

    expect(
      hospitalVisitSchedule.fold((l) => l, (r) => r),
      1,
    );
  });
}
