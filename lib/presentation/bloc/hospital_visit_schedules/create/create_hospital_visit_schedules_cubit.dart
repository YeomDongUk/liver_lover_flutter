import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/core/form/hospital_visit_schedule/hospital_schedule_forms.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';

part 'create_hospital_visit_schedules_state.dart';

class CreateHospitalVisitSchedulesCubit
    extends Cubit<CreateHospitalVisitSchedulesState> {
  CreateHospitalVisitSchedulesCubit(this.createHospitalVisitSchedule)
      : super(const CreateHospitalVisitSchedulesState());

  final CreateHospitalVisitSchedule createHospitalVisitSchedule;

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

  void updateReservedAt(int reservedAt) {
    emit(
      state.copyWith(
        reservedAt: ReservedAt.dirty('$reservedAt'),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updatePush(bool push) {
    emit(
      state.copyWith(
        push: Push.dirty(push),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateBeforePush(bool beforePush) {
    emit(
      state.copyWith(
        beforePush: BeforePush.dirty(beforePush),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  void updateAfterPush(bool afterPush) {
    emit(
      state.copyWith(
        afterPush: AfterPush.dirty(afterPush),
      ),
    );
    emit(state.copyWith(status: formStatus));
  }

  Future<HospitalVisitSchedule> submit() async {
    try {
      final result = await createHospitalVisitSchedule.call(
        HospitalVisitSchedulesCompanion(
          hospitalName: Value(state.hospitalName.value),
          medicalSubject: Value(state.medicalSubject.value),
          doctorName: Value(state.doctorName.value),
          reservedAt: Value(
            DateTime.fromMillisecondsSinceEpoch(
              int.parse(state.reservedAt.value),
            ),
          ),
        ),
      );
      if (result.isRight()) {
        return result.fold(
          (l) => l,
          (r) => r,
        ) as HospitalVisitSchedule;
      } else {
        result.fold(
          (l) => l,
          (r) => r,
        );
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  FormzStatus get formStatus => Formz.validate(
        List<FormzInput>.from(
          state.props..remove(state.status),
        ),
      );
}
