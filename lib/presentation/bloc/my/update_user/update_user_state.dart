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
  });

  final FormzStatus status;
  final Name name;
  final Phone phone;
  final BirthYear birthYear;
  final Sex sex;
  final Height height;
  final Weight weight;

  bool get isValid => status == FormzStatus.valid;

  UpdateUserState copyWith({
    Name? name,
    Phone? phone,
    BirthYear? birthYear,
    Sex? sex,
    Height? height,
    Weight? weight,
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
            ],
          ),
        ),
        name: name ?? this.name,
        phone: phone ?? this.phone,
        birthYear: birthYear ?? this.birthYear,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
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
      ];
}
