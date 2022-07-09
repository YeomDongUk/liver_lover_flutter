import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yak/domain/repositories/hospital_visit_schedule/hospital_visit_schedule_repository.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/create/create_hospital_visit_schedules_cubit.dart';

class MockHospitalVisitScheduleRepository extends Mock
    implements HospitalVisitScheduleRepository {}

void main() {
  late CreateHospitalVisitSchedulesCubit createHospitalVisitSchedulesCubit;
  late CreateHospitalVisitSchedule createHospitalVisitSchedule;

  setUp(() {
    /// Given: 블록초기화
    createHospitalVisitSchedule =
        CreateHospitalVisitSchedule(MockHospitalVisitScheduleRepository());
    createHospitalVisitSchedulesCubit =
        CreateHospitalVisitSchedulesCubit(createHospitalVisitSchedule);
  });

  group('데이터 입력 및 전송', () {
    test('예약 시간 입력', () {
      /// When: 비정상적인 예약 시간 입력
      createHospitalVisitSchedulesCubit.updateReservedAt(
        DateTime.now().add(const Duration(days: -1)).millisecondsSinceEpoch,
      );

      /// Then: 상태 미유효
      expect(createHospitalVisitSchedulesCubit.state.reservedAt.valid, false);

      /// When: 정상적인 예약 시간 입력
      createHospitalVisitSchedulesCubit.updateReservedAt(
        DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
      );

      /// Then: 상태 유효
      expect(createHospitalVisitSchedulesCubit.state.reservedAt.valid, true);
    });
    test('병원 이름 입력', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updateHospitalName('');

      /// Then: 상태 미유효
      expect(createHospitalVisitSchedulesCubit.state.hospitalName.valid, false);

      /// When: 정상적인 예약 시간 입력
      createHospitalVisitSchedulesCubit.updateHospitalName(
        '삼성서울병원',
      );

      /// Then: 상태 유효
      expect(createHospitalVisitSchedulesCubit.state.hospitalName.valid, true);
    });
    test('진료 과목 입력', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updateMedicalSubject('');

      /// Then: 상태 미유효
      expect(
        createHospitalVisitSchedulesCubit.state.medicalSubject.valid,
        false,
      );

      /// When: 정상적인 예약 시간 입력
      createHospitalVisitSchedulesCubit.updateMedicalSubject(
        '소화기 내과',
      );

      /// Then: 상태 유효
      expect(
        createHospitalVisitSchedulesCubit.state.medicalSubject.valid,
        true,
      );
    });
    test('담당 의사 입력', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updateDoctorName('');

      /// Then: 상태 미유효
      expect(
        createHospitalVisitSchedulesCubit.state.doctorName.valid,
        false,
      );

      /// When: 정상적인 예약 시간 입력
      createHospitalVisitSchedulesCubit.updateDoctorName(
        '소화기 내과',
      );

      /// Then: 상태 유효
      expect(
        createHospitalVisitSchedulesCubit.state.doctorName.valid,
        true,
      );
    });
    test('알림 설정 변경', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updatePush(true);

      /// Then: 상태 미유효
      expect(
        createHospitalVisitSchedulesCubit.state.push.value,
        true,
      );
    });
    test('하루 전 알림 설정 변경', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updateBeforePush(true);

      /// Then: 상태 미유효
      expect(
        createHospitalVisitSchedulesCubit.state.beforePush.value,
        true,
      );
    });
    test('두 시간 전 알림 설정 변경', () {
      /// When: 병원 이름 미입력
      createHospitalVisitSchedulesCubit.updateAfterPush(true);

      /// Then: 상태 미유효
      expect(
        createHospitalVisitSchedulesCubit.state.afterPush.value,
        true,
      );
    });
  });
}
