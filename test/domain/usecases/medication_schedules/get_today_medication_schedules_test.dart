import 'dart:math';

import 'package:cuid/cuid.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';
import 'package:yak/domain/repositories/medication_schedule/medication_schedule_repository.dart';
import 'package:yak/domain/usecases/medication_schedule/get_today_medication_schedules.dart';

class MockMedicationScheduleRepository extends Mock
    implements MedicationScheduleRepository {}

void main() {
  late GetTodayMedicationSchedules getTodayMedicationSchedules;
  late MockMedicationScheduleRepository mockMedicationScheduleRepository;

  setUp(() {
    mockMedicationScheduleRepository = MockMedicationScheduleRepository();
    getTodayMedicationSchedules = GetTodayMedicationSchedules(
      mockMedicationScheduleRepository,
    );
  });

  test('오늘의 복용 일정을 가져온다.', () async {
    /// Given: 오늘의 복용일정을 4개 가지고 있다.
    when(
      () => mockMedicationScheduleRepository
          .getMedicationSchedulesBetweenReservedAt(
        startAt: any(named: 'startAt'),
        endAt: any(named: 'endAt'),
        onlyBeforeMedication: any(named: 'onlyBeforeMedication'),
      ),
    ).thenAnswer(
      (invocation) async => Right(
        List.generate(
          4,
          (index) => MedicationSchedule(
            id: newCuid(),
            prescriptionId: 'prescriptionId',
            type: MedicationScheduleType.values[index],
            reservedAt: DateTime.now(),
            medicatedAt: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ),
      ),
    );

    /// When: 오늘의 복용일정을 조회한다.

    final result = await getTodayMedicationSchedules.call(null);

    /// Then: 오늘의 복용일정 4개가 조회된다.
    expect(
      result.fold((l) => l, (r) => r),
      const TypeMatcher<List<MedicationSchedule>>(),
    );
    expect(
      (result.fold((l) => l, (r) => r) as List<MedicationSchedule>).length,
      4,
    );
  });
}
