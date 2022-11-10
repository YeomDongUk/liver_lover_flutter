// Package imports:
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/core/form/hospital_visit_schedule/hospital_schedule_forms.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';

part 'hospital_visit_schedule_update_state.dart';

class HospitalVisitScheduleUpdateCubit
    extends Cubit<HospitalVisitScheduleUpdateState> {
  HospitalVisitScheduleUpdateCubit({
    required this.hospitalVisitSchedule,
    required this.updateHospitalVisitSchedule,
  }) : super(
          HospitalVisitScheduleUpdateState.fromSchedule(
            schedule: hospitalVisitSchedule,
          ),
        );

  final HospitalVisitSchedule hospitalVisitSchedule;
  final UpdateHospitalVisitSchedule updateHospitalVisitSchedule;

  void udpateHospitalVisitScheduleType(
    HospitalVisitScheduleType hospitalVisitScheduleType,
  ) {
    if (state.hospitalVisitType.value == hospitalVisitScheduleType) return;

    emit(
      state.copyWith(
        hospitalVisitType: HospitalVisitType.dirty(hospitalVisitScheduleType),
        hospitalName: const HospitalName.pure(),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateHospitalName(String hospitalName) {
    emit(
      state.copyWith(
        hospitalName: HospitalName.dirty(hospitalName),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateMedicalSubject(String medicalSubject) {
    emit(
      state.copyWith(
        medicalSubject: MedicalSubject.dirty(medicalSubject),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateDoctorName(String doctorName) {
    emit(
      state.copyWith(
        doctorName: DoctorName.dirty(doctorName),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateReservedAt(DateTime reservedAt) {
    emit(
      state.copyWith(
        reservedAt: AfterNowDateInput.dirty(reservedAt),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updatePush(bool push) {
    emit(
      state.copyWith(
        beforePush: BeforePush.dirty(push),
        afterPush: AfterPush.dirty(push),
      ),
    );

    emit(
      state.copyWith(
        status: formStatus,
      ),
    );
  }

  void updateBeforePush(bool beforePush) {
    emit(
      state.copyWith(
        beforePush: BeforePush.dirty(beforePush),
      ),
    );

    emit(
      state.copyWith(
        status: formStatus,
      ),
    );
  }

  void updateAfterPush(bool afterPush) {
    emit(
      state.copyWith(
        afterPush: AfterPush.dirty(afterPush),
      ),
    );

    emit(
      state.copyWith(
        status: formStatus,
      ),
    );
  }

  Future<HospitalVisitSchedule?> submit() async {
    final result = await updateHospitalVisitSchedule.call(
      HospitalVisitSchedulesCompanion.insert(
        id: Value(hospitalVisitSchedule.id),
        userId: '',
        type: state.hospitalVisitType.value!,
        hospitalName: state.hospitalName.value,
        medicalSubject: Value(state.medicalSubject.value),
        doctorName: Value(state.doctorName.value),
        reservedAt: state.reservedAt.value!,
        afterPush: Value(state.afterPush.value),
        beforePush: Value(state.beforePush.value),
      ),
    );

    return result.fold(
      (l) => null,
      (r) => r,
    );
  }

  FormzStatus get formStatus => Formz.validate(
        List<FormzInput>.from(
          state.props..remove(state.status),
        ),
      );
}
