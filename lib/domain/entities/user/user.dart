import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.birthYear,
    required this.sex,
    required this.height,
    required this.weight,
    required this.pinCode,
    required this.point,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        birthYear: json['birthYear'] as int,
        sex: json['sex'] as int,
        height: json['height'] as int,
        weight: json['weight'] as int,
        pinCode: json['pinCode'] as String,
        point: json['point'] as int,
      );

  final String id;
  final String name;
  final String phone;
  final int birthYear;
  final int sex;
  final int height;
  final int weight;
  final String pinCode;
  final int point;

  User copyWith({
    String? name,
    String? phone,
    int? birthYear,
    int? sex,
    int? height,
    int? weight,
    String? pinCode,
    int? point,
  }) =>
      User(
        id: id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        birthYear: birthYear ?? this.birthYear,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        pinCode: pinCode ?? this.pinCode,
        point: point ?? this.point,
      );

  static const empty = User(
    id: '-',
    name: '인증되지 않은 유저',
    phone: '01012345678',
    birthYear: 1900,
    sex: 0,
    height: 0,
    weight: 0,
    pinCode: '000000',
    point: 0,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'phone': phone,
        'birthYear': birthYear,
        'sex': sex,
        'height': height,
        'weight': weight,
        'pinCode': pinCode,
        'point': point,
      };

  @override
  List<Object> get props => [
        id,
        name,
        phone,
        birthYear,
        sex,
        height,
        weight,
        pinCode,
        point,
      ];
}
