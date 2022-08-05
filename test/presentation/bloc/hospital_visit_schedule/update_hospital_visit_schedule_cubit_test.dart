// Package imports:
import 'package:cuid/cuid.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/update/update_hospital_visit_schedules_cubit.dart';

class MockUpdateHospitalVisitSchedule extends Mock
    implements UpdateHospitalVisitSchedule {}

void main() {
  late UpdateHospitalVisitSchedulesCubit updateHospitalVisitSchedulesCubit;
  late MockUpdateHospitalVisitSchedule mockUpdateHospitalVisitSchedule;

  setUp(() {
    /// Given: 블록초기화
    mockUpdateHospitalVisitSchedule = MockUpdateHospitalVisitSchedule();
    updateHospitalVisitSchedulesCubit = UpdateHospitalVisitSchedulesCubit(
      updateHospitalVisitSchedule: mockUpdateHospitalVisitSchedule,
      hospitalVisitSchedule: HospitalVisitSchedule(
        id: newCuid(),
        medicalSubject: '박혜민',
        hospitalName: '대한민국',
        doctorName: '염동욱',
        doctorOffice: '테스트실',
        visitedAt: null,
        reservedAt: DateTime.now(),
        push: true,
        beforePush: true,
        type: HospitalVisitScheduleType.regular,
        afterPush: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    registerFallbackValue(const HospitalVisitSchedulesCompanion());
  });

  group('데이터 입력 및 전송', () {
    test('예약 시간 입력', () {
      /// When: 비정상적인 예약 시간 입력
      updateHospitalVisitSchedulesCubit.updateReservedAt(
        DateTime.now().add(const Duration(days: -1)).millisecondsSinceEpoch,
      );

      /// Then: 상태 미유효
      expect(updateHospitalVisitSchedulesCubit.state.reservedAt.valid, false);

      /// When: 정상적인 예약 시간 입력
      updateHospitalVisitSchedulesCubit.updateReservedAt(
        DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
      );

      /// Then: 상태 유효
      expect(updateHospitalVisitSchedulesCubit.state.reservedAt.valid, true);
    });
    test('병원 이름 입력', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updateHospitalName('');

      /// Then: 상태 미유효
      expect(updateHospitalVisitSchedulesCubit.state.hospitalName.valid, false);

      /// When: 정상적인 예약 시간 입력
      updateHospitalVisitSchedulesCubit.updateHospitalName(
        '삼성서울병원',
      );

      /// Then: 상태 유효
      expect(updateHospitalVisitSchedulesCubit.state.hospitalName.valid, true);
    });
    test('진료 과목 입력', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updateMedicalSubject('');

      /// Then: 상태 미유효
      expect(
        updateHospitalVisitSchedulesCubit.state.medicalSubject.valid,
        false,
      );

      /// When: 정상적인 예약 시간 입력
      updateHospitalVisitSchedulesCubit.updateMedicalSubject(
        '소화기 내과',
      );

      /// Then: 상태 유효
      expect(
        updateHospitalVisitSchedulesCubit.state.medicalSubject.valid,
        true,
      );
    });
    test('담당 의사 입력', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updateDoctorName('');

      /// Then: 상태 미유효
      expect(
        updateHospitalVisitSchedulesCubit.state.doctorName.valid,
        false,
      );

      /// When: 정상적인 예약 시간 입력
      updateHospitalVisitSchedulesCubit.updateDoctorName(
        '박혜민',
      );

      /// Then: 상태 유효
      expect(
        updateHospitalVisitSchedulesCubit.state.doctorName.valid,
        true,
      );
    });
    test('알림 설정 변경', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updatePush(true);

      /// Then: 상태 미유효
      expect(
        updateHospitalVisitSchedulesCubit.state.push.value,
        true,
      );
    });
    test('하루 전 알림 설정 변경', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updateBeforePush(true);

      /// Then: 상태 미유효
      expect(
        updateHospitalVisitSchedulesCubit.state.beforePush.value,
        true,
      );
    });
    test('두 시간 전 알림 설정 변경', () {
      /// When: 병원 이름 미입력
      updateHospitalVisitSchedulesCubit.updateAfterPush(true);

      /// Then: 상태 미유효
      expect(
        updateHospitalVisitSchedulesCubit.state.afterPush.value,
        true,
      );
    });

    test('전송', () async {
      when(() => mockUpdateHospitalVisitSchedule.call(any())).thenAnswer(
        (invocation) async => Right(
          HospitalVisitSchedule(
            id: newCuid(),
            medicalSubject: '소화기 내과',
            hospitalName: '삼성서울병원',
            doctorName: '박혜민',
            doctorOffice: '테스트실',
            visitedAt: null,
            type: HospitalVisitScheduleType.regular,
            reservedAt: DateTime.now().add(const Duration(days: 1)),
            push: true,
            beforePush: true,
            afterPush: true,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ),
      );

      final result = await updateHospitalVisitSchedulesCubit.submit();

      expect(result.medicalSubject, '소화기 내과');
      expect(result.hospitalName, '삼성서울병원');
      expect(result.doctorName, '박혜민');
      expect(result.visitedAt, null);
      expect(
        result.reservedAt
            .isAfter(DateTime.now().add(const Duration(hours: 23))),
        true,
      );
      expect(result.push, true);
      expect(result.beforePush, true);
      expect(result.afterPush, true);
    });
  });
}
