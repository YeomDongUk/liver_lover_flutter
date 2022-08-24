// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/domain/entities/pill/pill.dart';

class MedicationInformationUpdateInput extends Equatable
    implements IMedicationInformationCreateForm {
  const MedicationInformationUpdateInput({
    required this.id,
    required this.moringHour,
    required this.afternoonHour,
    required this.eveningHour,
    required this.nightHour,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.takeCount,
    required this.takeCycle,
  });

  final int id;

  @override
  final int? moringHour;

  @override
  final int? afternoonHour;

  @override
  final int? eveningHour;

  @override
  final int? nightHour;

  @override
  final bool push;

  @override
  final bool beforePush;

  @override
  final bool afterPush;

  @override
  final double takeCount;

  @override
  final int takeCycle;

  @override
  List<Object?> get props => [
        id,
        moringHour,
        afternoonHour,
        eveningHour,
        nightHour,
        push,
        beforePush,
        afterPush,
        takeCount,
        takeCycle,
      ];

  @override
  // TODO: implement canSubmit
  bool get canSubmit => throw UnimplementedError();
}

class MedicationInformationCreateInput extends Equatable {
  const MedicationInformationCreateInput({
    required this.pillId,
    required this.takeCount,
    required this.moringHour,
    required this.afternoonHour,
    required this.eveningHour,
    required this.nightHour,
    required this.takeCycle,
    required this.push,
    required this.beforePush,
    required this.afterPush,
  });

  final String pillId;
  final double takeCount;
  final int? moringHour;
  final int? afternoonHour;
  final int? eveningHour;
  final int? nightHour;
  final int takeCycle;
  final bool push;
  final bool beforePush;
  final bool afterPush;

  @override
  List<Object?> get props => [
        pillId,
        takeCount,
        moringHour,
        afternoonHour,
        eveningHour,
        nightHour,
        takeCycle,
        push,
        beforePush,
        afterPush,
      ];
}

class MedicationInformationCreateForm extends Equatable
    implements IMedicationInformationCreateForm {
  const MedicationInformationCreateForm({
    required this.pill,
    this.takeCount,
    this.moringHour,
    this.afternoonHour,
    this.eveningHour,
    this.nightHour,
    this.takeCycle,
    this.push,
    this.beforePush,
    this.afterPush,
  });

  final Pill pill;
  @override
  final double? takeCount;
  @override
  final int? moringHour;
  @override
  final int? afternoonHour;
  @override
  final int? eveningHour;
  @override
  final int? nightHour;
  @override
  final int? takeCycle;
  @override
  final bool? push;
  @override
  final bool? beforePush;
  @override
  final bool? afterPush;

  MedicationInformationCreateForm copyWith({
    Optional<double> takeCount = const Optional<double>(),
    Optional<int> moringHour = const Optional<int>(),
    Optional<int> afternoonHour = const Optional<int>(),
    Optional<int> eveningHour = const Optional<int>(),
    Optional<int> nightHour = const Optional<int>(),
    Optional<int> takeCycle = const Optional<int>(),
    Optional<bool> push = const Optional<bool>(),
    Optional<bool> beforePush = const Optional<bool>(),
    Optional<bool> afterPush = const Optional<bool>(),
  }) =>
      MedicationInformationCreateForm(
        pill: pill,
        takeCount: takeCount.isValid ? takeCount.value : this.takeCount,
        moringHour: moringHour.isValid ? moringHour.value : this.moringHour,
        afternoonHour:
            afternoonHour.isValid ? afternoonHour.value : this.afternoonHour,
        eveningHour: eveningHour.isValid ? eveningHour.value : this.eveningHour,
        nightHour: nightHour.isValid ? nightHour.value : this.nightHour,
        takeCycle: takeCycle.isValid ? takeCycle.value : this.takeCycle,
        push: push.isValid ? push.value : this.push,
        beforePush: beforePush.isValid ? beforePush.value : this.beforePush,
        afterPush: afterPush.isValid ? afterPush.value : this.afterPush,
      );

  @override
  bool get canSubmit => takeCount != null && takeCycle != null;

  MedicationInformationCreateInput toCreateInput() =>
      MedicationInformationCreateInput(
        pillId: pill.id,
        takeCount: takeCount!,
        moringHour: moringHour,
        afternoonHour: afternoonHour,
        eveningHour: eveningHour,
        nightHour: nightHour,
        takeCycle: takeCycle!,
        push: push ?? false,
        beforePush: beforePush ?? false,
        afterPush: afterPush ?? false,
      );

  @override
  List<Object?> get props => [
        pill,
        takeCount,
        moringHour,
        afternoonHour,
        eveningHour,
        nightHour,
        takeCycle,
        push,
        beforePush,
        afterPush,
      ];
}

abstract class IMedicationInformationCreateForm {
  const IMedicationInformationCreateForm(
    this.takeCount,
    this.moringHour,
    this.afternoonHour,
    this.eveningHour,
    this.nightHour,
    this.takeCycle,
    this.push,
    this.beforePush,
    this.afterPush,
  );

  final int? takeCycle;
  final double? takeCount;
  final int? moringHour;
  final int? afternoonHour;
  final int? eveningHour;
  final int? nightHour;
  final bool? push;
  final bool? beforePush;
  final bool? afterPush;

  bool get canSubmit;
}
