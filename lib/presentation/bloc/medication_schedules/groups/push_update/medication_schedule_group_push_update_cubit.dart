import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:yak/domain/usecases/medication_schedule/update_medication_schedule_push.dart';

part 'medication_schedule_group_push_update_state.dart';

class MedicationScheduleGroupPushUpdateCubit
    extends Cubit<MedicationScheduleGroupPushUpdateState> {
  MedicationScheduleGroupPushUpdateCubit({
    required this.reservedAt,
    required this.updateMedicationScheduleGroupPush,
  }) : super(const MedicationScheduleGroupPushUpdateState());
  final UpdateMedicationScheduleGroupPush updateMedicationScheduleGroupPush;
  final DateTime reservedAt;

  void updatePush(bool push) {
    emit(
      MedicationScheduleGroupPushUpdateState(
        afterPush: push,
        beforePush: push,
      ),
    );
  }

  void updateBeforePush(bool beforePush) {
    emit(
      state.copyWith(beforePush: beforePush),
    );
  }

  void updateAfterPush(bool afterPush) {
    emit(
      state.copyWith(afterPush: afterPush),
    );
  }

  Future<void> submit() async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));

    final either = await updateMedicationScheduleGroupPush.call(
      UpdateMedicationScheduleGroupPushParam(
        afterPush: state.afterPush,
        beforePush: state.beforePush,
        reservedAt: reservedAt,
      ),
    );

    emit(
      either.fold(
        (l) => state.copyWith(formzStatus: FormzStatus.submissionFailure),
        (r) => state.copyWith(formzStatus: FormzStatus.submissionSuccess),
      ),
    );
  }
}
