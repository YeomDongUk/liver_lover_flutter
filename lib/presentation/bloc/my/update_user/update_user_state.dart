part of 'update_user_cubit.dart';

class UpdateUserState extends Equatable {
  const UpdateUserState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.phone = const Phone.pure(),
    this.birthYear = const BirthYear.pure(),
    this.sex = const Sex.pure(),
    this.height = const Height.pure(),
    this.weight = const Weight.pure(),
    this.metabolicDisease = const MetabolicDisease.pure(),
  });

  final FormzStatus status;
  final Name name;
  final Phone phone;
  final BirthYear birthYear;
  final Sex sex;
  final Height height;
  final Weight weight;
  final MetabolicDisease metabolicDisease;

  bool get isValid => status == FormzStatus.valid;

  UpdateUserState copyWith({
    Name? name,
    Phone? phone,
    BirthYear? birthYear,
    Sex? sex,
    Height? height,
    Weight? weight,
    MetabolicDisease? metabolicDisease,
  }) =>
      UpdateUserState(
        status: Formz.validate(
          List<FormzInput>.from(
            <FormzInput>[
              name ?? this.name,
              phone ?? this.phone,
              birthYear ?? this.birthYear,
              sex ?? this.sex,
              height ?? this.height,
              weight ?? this.weight,
              metabolicDisease ?? this.metabolicDisease,
            ],
          ),
        ),
        name: name ?? this.name,
        phone: phone ?? this.phone,
        birthYear: birthYear ?? this.birthYear,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        metabolicDisease: metabolicDisease ?? this.metabolicDisease,
      );
  @override
  List<Object> get props => [
        status,
        name,
        phone,
        birthYear,
        sex,
        height,
        weight,
        metabolicDisease,
      ];
}
