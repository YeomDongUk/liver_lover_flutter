part of 'medication_schedule_group_push_update_cubit.dart';

class MedicationScheduleGroupPushUpdateState extends Equatable {
  const MedicationScheduleGroupPushUpdateState({
    this.beforePush = false,
    this.afterPush = false,
    this.formzStatus = FormzStatus.valid,
  });
  final FormzStatus formzStatus;
  final bool beforePush;
  final bool afterPush;

  MedicationScheduleGroupPushUpdateState copyWith({
    FormzStatus? formzStatus,
    bool? beforePush,
    bool? afterPush,
  }) =>
      MedicationScheduleGroupPushUpdateState(
        formzStatus: formzStatus ?? this.formzStatus,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );

  @override
  List<Object> get props => [
        formzStatus,
        beforePush,
        afterPush,
      ];
}
