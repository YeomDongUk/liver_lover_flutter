part of 'page_b_circulator_cubit.dart';

class PageBCirculatorState extends Equatable {
  const PageBCirculatorState({
    this.age,
    this.sex,
    this.platelet,
    this.albumin,
  });
  final int? age;
  final int? sex;
  final int? platelet;
  final double? albumin;

  PageBCirculatorState copyWith({
    int? age,
    int? sex,
    int? platelet,
    double? albumin,
  }) =>
      PageBCirculatorState(
        age: age ?? this.age,
        sex: sex ?? this.sex,
        platelet: platelet ?? this.platelet,
        albumin: albumin ?? this.albumin,
      );

  bool get canCirculator =>
      age != null && sex != null && platelet != null && albumin != null;

  @override
  List<Object?> get props => [
        age,
        sex,
        platelet,
        albumin,
      ];
}
