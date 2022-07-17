part of 'fibrosis_circulator_cubit.dart';

class FibrosisCirculatorState extends Equatable {
  const FibrosisCirculatorState({
    this.age,
    this.ast,
    this.alt,
    this.platelet,
  });
  final int? age;
  final int? ast;
  final int? alt;
  final int? platelet;

  FibrosisCirculatorState copyWith({
    int? age,
    int? ast,
    int? alt,
    int? platelet,
  }) =>
      FibrosisCirculatorState(
        age: age ?? this.age,
        ast: ast ?? this.ast,
        alt: alt ?? this.alt,
        platelet: platelet ?? this.platelet,
      );

  bool get canCirculator =>
      age != null && ast != null && alt != null && platelet != null;
  @override
  List<Object?> get props => [
        age,
        ast,
        alt,
        platelet,
      ];
}
