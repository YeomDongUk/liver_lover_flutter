import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yak/core/class/optional.dart';
import 'package:yak/core/form/common.dart';
import 'package:yak/core/form/medication_schedule/medication_schedules_forms.dart';
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';
import 'package:yak/data/models/prescription/prescription_update_input.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/usecases/prescription/update_prescription.dart';

part 'prescription_update_state.dart';

class PrescriptionUpdateCubit extends Cubit<PrescriptionUpdateState> {
  PrescriptionUpdateCubit({
    required this.prescription,
    required this.updatePrescription,
  }) : super(
          PrescriptionUpdateState(
            status: FormzStatus.valid,
            doctorName: Name.dirty(prescription.doctorName),
            duration: PositiveIntInput.dirty(prescription.duration),
            prescriptedAt: DateInput.dirty(prescription.prescriptedAt),
            medicationStartAt: DateInput.dirty(prescription.medicationStartAt),
            medicationInformationCreateFormInput:
                MedicationInformationCreateFormInput.dirty(
              prescription.medicationInformations!
                  .map(
                    (e) => MedicationInformationCreateForm(
                      pill: e.pill!,
                      afterPush: e.afterPush,
                      beforePush: e.beforePush,
                      takeCount: e.takeCount,
                      takeCycle: e.takeCycle,
                      times: [
                        if (e.timeOne != null) e.timeOne!,
                        if (e.timeTwo != null) e.timeTwo!,
                        if (e.timeThree != null) e.timeThree!,
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        );

  final Prescription prescription;
  final UpdatePrescription updatePrescription;

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
              afterPush:
                  Optional.value(medicationInformationCreateForm.afterPush),
              beforePush:
                  Optional.value(medicationInformationCreateForm.beforePush),
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

    final either = await updatePrescription.call(
      PrescriptionUpdateInput(
        prescriptionId: prescription.id,
        medicationInformationUpdateInputs:
            state.medicationInformationCreateFormInput.value
                .map(
                  (e) => MedicationInformationUpdateInput(
                    pillId: e.pill.id,
                    beforePush: e.beforePush ?? false,
                    afterPush: e.afterPush ?? false,
                    timeOne: (e.times?.length ?? 0) < 1 ? null : e.times![0],
                    timeTwo: (e.times?.length ?? 0) < 2 ? null : e.times![1],
                    timeThree: (e.times?.length ?? 0) < 3 ? null : e.times![2],
                  ),
                )
                .toList(),
      ),
    );

    emit(
      either.fold(
        (l) => state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
        (r) => state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      ),
    );
  }
}
