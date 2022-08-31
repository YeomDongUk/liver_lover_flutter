// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/domain/entities/pill/pill.dart';

class MedicationInformationUpdateInput extends Equatable
    implements IMedicationInformationCreateForm {
  const MedicationInformationUpdateInput({
    required this.id,
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.timeFour,
    required this.push,
    required this.beforePush,
    required this.afterPush,
    required this.takeCount,
    required this.takeCycle,
  });

  final int id;

  @override
  final int? timeOne;

  @override
  final int? timeTwo;

  @override
  final int? timeThree;

  @override
  final int? timeFour;

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
        timeOne,
        timeTwo,
        timeThree,
        timeFour,
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
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.timeFour,
    required this.takeCycle,
    required this.push,
    required this.beforePush,
    required this.afterPush,
  });

  final String pillId;
  final double takeCount;
  final int? timeOne;
  final int? timeTwo;
  final int? timeThree;
  final int? timeFour;
  final int takeCycle;
  final bool push;
  final bool beforePush;
  final bool afterPush;

  @override
  List<Object?> get props => [
        pillId,
        takeCount,
        timeOne,
        timeTwo,
        timeThree,
        timeFour,
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
    this.timeOne,
    this.timeTwo,
    this.timeThree,
    this.timeFour,
    this.takeCycle,
    this.push,
    this.beforePush,
    this.afterPush,
  });

  final Pill pill;
  @override
  final double? takeCount;
  @override
  final int? timeOne;
  @override
  final int? timeTwo;
  @override
  final int? timeThree;
  @override
  final int? timeFour;
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
    Optional<int> timeOne = const Optional<int>(),
    Optional<int> timeTwo = const Optional<int>(),
    Optional<int> timeThree = const Optional<int>(),
    Optional<int> timeFour = const Optional<int>(),
    Optional<int> takeCycle = const Optional<int>(),
    Optional<bool> push = const Optional<bool>(),
    Optional<bool> beforePush = const Optional<bool>(),
    Optional<bool> afterPush = const Optional<bool>(),
  }) =>
      MedicationInformationCreateForm(
        pill: pill,
        takeCount: takeCount.isValid ? takeCount.value : this.takeCount,
        timeOne: timeOne.isValid ? timeOne.value : this.timeOne,
        timeTwo: timeTwo.isValid ? timeTwo.value : this.timeTwo,
        timeThree: timeThree.isValid ? timeThree.value : this.timeThree,
        timeFour: timeFour.isValid ? timeFour.value : this.timeFour,
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
        timeOne: timeOne,
        timeTwo: timeTwo,
        timeThree: timeThree,
        timeFour: timeFour,
        takeCycle: takeCycle!,
        push: push ?? false,
        beforePush: beforePush ?? false,
        afterPush: afterPush ?? false,
      );

  @override
  List<Object?> get props => [
        pill,
        takeCount,
        timeOne,
        timeTwo,
        timeThree,
        timeFour,
        takeCycle,
        push,
        beforePush,
        afterPush,
      ];
}

abstract class IMedicationInformationCreateForm {
  const IMedicationInformationCreateForm(
    this.takeCount,
    this.timeOne,
    this.timeTwo,
    this.timeThree,
    this.timeFour,
    this.takeCycle,
    this.push,
    this.beforePush,
    this.afterPush,
  );

  final int? takeCycle;
  final double? takeCount;
  final int? timeOne;
  final int? timeTwo;
  final int? timeThree;
  final int? timeFour;
  final bool? push;
  final bool? beforePush;
  final bool? afterPush;

  bool get canSubmit;
}
