// Package imports:
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/core/form/medication_schedule/medication_schedules_forms.dart';
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';
import 'package:yak/data/models/prescription/prescription_create_input.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/usecases/prescription/create_prescriotion.dart';

part 'prescription_create_state.dart';

class PrescriptionCrateCubit extends Cubit<PrescriptionCrateState> {
  PrescriptionCrateCubit({required this.createPrescription})
      : super(const PrescriptionCrateState());

  final CreatePrescription createPrescription;

  void updatePrescriptedAt(DateTime? prescriptedAt) => prescriptedAt == null
      ? null
      : emit(state.copyWith(prescriptedAt: DateInput.dirty(prescriptedAt)));

  void updateDoctorName(String doctorName) =>
      emit(state.copyWith(doctorName: Name.dirty(doctorName)));

  void updateMedicatedAt(DateTime? medicatedAt) => medicatedAt == null
      ? null
      : emit(state.copyWith(medicatedAt: DateInput.dirty(medicatedAt)));

  void updateDuration(int? duration) => emit(
        state.copyWith(
          duration: duration == null
              ? const PositiveIntInput.pure()
              : PositiveIntInput.dirty(duration),
        ),
      );

  void addMedicationInformationCreateFormInput(Pill pill) {
    final dupePill =
        state.medicationInformationCreateFormInput.value.firstWhereOrNull(
      (element) => element.pill.id == pill.id,
    );

    if (dupePill != null) return;

    emit(
      state.copyWith(
        medicationInformationCreateFormInput:
            MedicationInformationCreateFormInput.dirty(
          List<MedicationInformationCreateForm>.from(
            state.medicationInformationCreateFormInput.value,
          )..add(MedicationInformationCreateForm(pill: pill)),
        ),
      ),
    );
  }

  void updateMedicationInformationCreateForm(
    MedicationInformationCreateForm medicationInformationCreateForm,
  ) {
    final index = state.medicationInformationCreateFormInput.value.indexWhere(
      (element) => element.pill.id == medicationInformationCreateForm.pill.id,
    );

    if (index == -1) return;

    return emit(
      state.copyWith(
        medicationInformationCreateFormInput:
            MedicationInformationCreateFormInput.dirty(
          List<MedicationInformationCreateForm>.from(
            state.medicationInformationCreateFormInput.value,
          )..[index] = medicationInformationCreateForm.copyWith(
              afterPush: medicationInformationCreateForm.push == true
                  ? const Optional()
                  : const Optional.value(false),
              beforePush: medicationInformationCreateForm.push == true
                  ? const Optional()
                  : const Optional.value(false),
            ),
        ),
      ),
    );
  }

  void deleteMedicationInformationCreateForm(String pillId) => emit(
        state.copyWith(
          medicationInformationCreateFormInput:
              MedicationInformationCreateFormInput.dirty(
            List<MedicationInformationCreateForm>.from(
              state.medicationInformationCreateFormInput.value,
            )..removeWhere((element) => element.pill.id == pillId),
          ),
        ),
      );

  Future<void> submit() async {
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
      ),
    );

    await createPrescription.call(
      PrescriptionCreateInput(
        prescriptedAt: state.prescriptedAt.value!,
        doctorName: state.doctorName.value,
        medicatedAt: state.medicatedAt.value!,
        duration: state.duration.value!,
        medicationInformationCreateInputs: state
            .medicationInformationCreateFormInput.value
            .map((e) => e.toCreateInput())
            .toList(),
      ),
    );

    emit(
      state.copyWith(
        status: FormzStatus.submissionSuccess,
      ),
    );
  }
}
