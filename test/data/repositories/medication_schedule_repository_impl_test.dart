// Package imports:
import 'package:cuid/cuid.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/medication_schedule/medication_schedule_table.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_schedule/medication_schedule_local_data_source.dart';
import 'package:yak/data/repositories/medication_schedule/medication_schedule_repository_impl.dart';
import 'package:yak/domain/entities/medication_schedule/medication_schedule.dart';

class MockUserId extends Mock implements UserId {}

class MockMedicationScheduleLocalDataSource extends Mock
    implements MedicationScheduleLocalDataSource {}

void main() {
  late MedicationScheduleRepositoryImpl medicationScheduleRepositoryImpl;
  late MockUserId mockUserId;
  late MockMedicationScheduleLocalDataSource
      mockMedicationScheduleLocalDataSource;
  setUp(() {
    mockUserId = MockUserId();
    mockMedicationScheduleLocalDataSource =
        MockMedicationScheduleLocalDataSource();
    medicationScheduleRepositoryImpl = MedicationScheduleRepositoryImpl(
      mockMedicationScheduleLocalDataSource,
      mockUserId,
    );
  });

  test('오늘의 복약 일정을 조회한다', () async {
    /// Given: 오늘의 복용일정을 4개 가지고 있다.
    when(() => mockUserId.value).thenReturn('test');
    when(
      () => mockMedicationScheduleLocalDataSource
          .getMedicationSchedulesBetweenReservedAt(
        userId: any(named: 'userId'),
        startAt: any(named: 'startAt'),
        endAt: any(named: 'endAt'),
      ),
    ).thenAnswer(
      (invocation) async => List.generate(
        4,
        (index) => MedicationScheduleModel(
          id: newCuid(),
          prescriptionId: 'prescriptionId',
          type: MedicationScheduleType.values[index],
          reservedAt: DateTime.now()..add(const Duration(days: 1)),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ),
    );

    /// When: 오늘의 섭취전인 복용일정을 조회한다.
    final result = await medicationScheduleRepositoryImpl
        .getMedicationSchedulesBetweenReservedAt(
      startAt: DateTime.now(),
      endAt: DateTime.now(),
      onlyBeforeMedication: false,
    );

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
