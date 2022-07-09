part of 'join_cubit.dart';

class JoinState extends Equatable {
  const JoinState({
    this.joinForm = JoinForm.inputing,
    this.name = const Name.pure(),
    this.phone = const Phone.pure(),
    this.birthYear = const BirthYear.pure(),
    this.sex = const Sex.pure(),
    this.height = const Height.pure(),
    this.weight = const Weight.pure(),
    this.pinCode = const PinCode.pure(),
    this.verifingPinCode = const PinCode.pure(),
    this.metabolicDisease = const MetabolicDisease.pure(),
  });

  final JoinForm joinForm;
  final Name name;
  final Phone phone;
  final BirthYear birthYear;
  final Sex sex;
  final Height height;
  final Weight weight;
  final PinCode pinCode;
  final PinCode verifingPinCode;
  final MetabolicDisease metabolicDisease;

  JoinState copyWith({
    FormzStatus? status,
    JoinForm? joinForm,
    Name? name,
    Phone? phone,
    BirthYear? birthYear,
    Sex? sex,
    Height? height,
    Weight? weight,
    PinCode? pinCode,
    PinCode? verifingPinCode,
    MetabolicDisease? metabolicDisease,
  }) =>
      JoinState(
        joinForm: joinForm ?? this.joinForm,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        birthYear: birthYear ?? this.birthYear,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        pinCode: pinCode ?? this.pinCode,
        verifingPinCode: verifingPinCode ?? this.verifingPinCode,
        metabolicDisease: metabolicDisease ?? this.metabolicDisease,
      );

  @override
  List<Object> get props => [
        joinForm,
        name,
        phone,
        birthYear,
        sex,
        height,
        weight,
        pinCode,
        verifingPinCode,
        metabolicDisease,
      ];
}
