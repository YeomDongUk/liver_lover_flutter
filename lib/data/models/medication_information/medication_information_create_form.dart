// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/domain/entities/pill/pill.dart';

class MedicationInformationUpdateInput extends Equatable {
  const MedicationInformationUpdateInput({
    required this.pillId,
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.beforePush,
    required this.afterPush,
  });

  final String pillId;
  final int? timeOne;
  final int? timeTwo;
  final int? timeThree;
  final bool beforePush;
  final bool afterPush;

  // MedicationInformationUpdateInput copyWith({
  //   Optional<double> takeCount = const Optional<double>(),
  //   Optional<List<int>> times = const Optional<List<int>>(),
  //   Optional<int> takeCycle = const Optional<int>(),
  //   Optional<bool> push = const Optional<bool>(),
  //   Optional<bool> beforePush = const Optional<bool>(),
  //   Optional<bool> afterPush = const Optional<bool>(),
  // }) =>
  //     MedicationInformationUpdateInput(
  //       takeCount: takeCount.isValid ? takeCount.value : this.takeCount,
  //       times: times.isValid ? times.value : this.times,
  //       takeCycle: takeCycle.isValid ? takeCycle.value : this.takeCycle,
  //       push: push.isValid ? push.value : this.push,
  //       beforePush: beforePush.isValid ? beforePush.value : this.beforePush,
  //       afterPush: afterPush.isValid ? afterPush.value : this.afterPush,
  //     );

  @override
  List<Object?> get props => [
        pillId,
        timeOne,
        timeTwo,
        timeThree,
        beforePush,
        afterPush,
      ];
}

class MedicationInformationCreateInput extends Equatable {
  const MedicationInformationCreateInput({
    required this.pillId,
    required this.takeCount,
    required this.timeOne,
    required this.timeTwo,
    required this.timeThree,
    required this.takeCycle,
    required this.beforePush,
    required this.afterPush,
  });

  final String pillId;
  final double takeCount;
  final int? timeOne;
  final int? timeTwo;
  final int? timeThree;
  final int takeCycle;
  final bool beforePush;
  final bool afterPush;

  @override
  List<Object?> get props => [
        pillId,
        takeCount,
        timeOne,
        timeTwo,
        timeThree,
        takeCycle,
        beforePush,
        afterPush,
      ];
}

class MedicationInformationCreateForm extends Equatable
    implements IMedicationInformationCreateForm {
  const MedicationInformationCreateForm({
    required this.pill,
    this.takeCount,
    this.times,
    this.takeCycle,
    this.beforePush,
    this.afterPush,
  });

  final Pill pill;
  @override
  final double? takeCount;
  @override
  final List<int>? times;
  @override
  final int? takeCycle;
  @override
  final bool? beforePush;
  @override
  final bool? afterPush;

  MedicationInformationCreateForm copyWith({
    Optional<double> takeCount = const Optional<double>(),
    Optional<List<int>> times = const Optional<List<int>>(),
    Optional<int> takeCycle = const Optional<int>(),
    Optional<bool> beforePush = const Optional<bool>(),
    Optional<bool> afterPush = const Optional<bool>(),
  }) =>
      MedicationInformationCreateForm(
        pill: pill,
        takeCount: takeCount.isValid ? takeCount.value : this.takeCount,
        times: times.isValid ? times.value : this.times,
        takeCycle: takeCycle.isValid ? takeCycle.value : this.takeCycle,
        beforePush: beforePush.isValid ? beforePush.value : this.beforePush,
        afterPush: afterPush.isValid ? afterPush.value : this.afterPush,
      );

  @override
  bool get canSubmit =>
      (times?.isNotEmpty ?? false) && takeCount != null && takeCycle != null;

  MedicationInformationCreateInput toCreateInput() =>
      MedicationInformationCreateInput(
        pillId: pill.id,
        takeCount: takeCount!,
        timeOne: times?.elementAtOrverIndex(0),
        timeTwo: times?.elementAtOrverIndex(1),
        timeThree: times?.elementAtOrverIndex(2),
        takeCycle: takeCycle!,
        beforePush: beforePush ?? false,
        afterPush: afterPush ?? false,
      );

  @override
  List<Object?> get props => [
        pill,
        takeCount,
        times,
        takeCycle,
        beforePush,
        afterPush,
      ];
}

abstract class IMedicationInformationCreateForm {
  const IMedicationInformationCreateForm(
    this.takeCount,
    this.times,
    this.takeCycle,
    this.beforePush,
    this.afterPush,
  );

  final int? takeCycle;
  final double? takeCount;
  final List<int>? times;
  final bool? beforePush;
  final bool? afterPush;

  bool get canSubmit;
}

extension ListExtension<T> on List<T> {
  T? elementAtOrverIndex(int index) =>
      length - 1 < index ? null : elementAt(index);
}
