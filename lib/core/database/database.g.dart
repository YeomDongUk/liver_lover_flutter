// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserModel extends DataClass implements Insertable<UserModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String name;
  final String phone;
  final int birthYear;
  final int sex;
  final int height;
  final int weight;
  final String pinCode;
  const UserModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.phone,
      required this.birthYear,
      required this.sex,
      required this.height,
      required this.weight,
      required this.pinCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['birth_year'] = Variable<int>(birthYear);
    map['sex'] = Variable<int>(sex);
    map['height'] = Variable<int>(height);
    map['weight'] = Variable<int>(weight);
    map['pin_code'] = Variable<String>(pinCode);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      phone: Value(phone),
      birthYear: Value(birthYear),
      sex: Value(sex),
      height: Value(height),
      weight: Value(weight),
      pinCode: Value(pinCode),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      birthYear: serializer.fromJson<int>(json['birthYear']),
      sex: serializer.fromJson<int>(json['sex']),
      height: serializer.fromJson<int>(json['height']),
      weight: serializer.fromJson<int>(json['weight']),
      pinCode: serializer.fromJson<String>(json['pinCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'birthYear': serializer.toJson<int>(birthYear),
      'sex': serializer.toJson<int>(sex),
      'height': serializer.toJson<int>(height),
      'weight': serializer.toJson<int>(weight),
      'pinCode': serializer.toJson<String>(pinCode),
    };
  }

  UserModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? name,
          String? phone,
          int? birthYear,
          int? sex,
          int? height,
          int? weight,
          String? pinCode}) =>
      UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        birthYear: birthYear ?? this.birthYear,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        pinCode: pinCode ?? this.pinCode,
      );
  @override
  String toString() {
    return (StringBuffer('UserModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('birthYear: $birthYear, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('pinCode: $pinCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, name, phone,
      birthYear, sex, height, weight, pinCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.birthYear == this.birthYear &&
          other.sex == this.sex &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.pinCode == this.pinCode);
}

class UsersCompanion extends UpdateCompanion<UserModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<String> phone;
  final Value<int> birthYear;
  final Value<int> sex;
  final Value<int> height;
  final Value<int> weight;
  final Value<String> pinCode;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.sex = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.pinCode = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String phone,
    required int birthYear,
    required int sex,
    required int height,
    required int weight,
    required String pinCode,
  })  : name = Value(name),
        phone = Value(phone),
        birthYear = Value(birthYear),
        sex = Value(sex),
        height = Value(height),
        weight = Value(weight),
        pinCode = Value(pinCode);
  static Insertable<UserModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<int>? birthYear,
    Expression<int>? sex,
    Expression<int>? height,
    Expression<int>? weight,
    Expression<String>? pinCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (birthYear != null) 'birth_year': birthYear,
      if (sex != null) 'sex': sex,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (pinCode != null) 'pin_code': pinCode,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? name,
      Value<String>? phone,
      Value<int>? birthYear,
      Value<int>? sex,
      Value<int>? height,
      Value<int>? weight,
      Value<String>? pinCode}) {
    return UsersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      birthYear: birthYear ?? this.birthYear,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      pinCode: pinCode ?? this.pinCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    if (sex.present) {
      map['sex'] = Variable<int>(sex.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (pinCode.present) {
      map['pin_code'] = Variable<String>(pinCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('birthYear: $birthYear, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('pinCode: $pinCode')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      check: () => name.length.isBiggerThan(const Constant(0)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      check: () => phone.length.equalsExp(const Constant(11)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _birthYearMeta = const VerificationMeta('birthYear');
  @override
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
      'birth_year', aliasedName, false,
      check: () => birthYear.isBiggerThan(const Constant(1900)),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  final VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<int> sex = GeneratedColumn<int>(
      'sex', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL CHECK (sex IN (0, 1))');
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _pinCodeMeta = const VerificationMeta('pinCode');
  @override
  late final GeneratedColumn<String> pinCode = GeneratedColumn<String>(
      'pin_code', aliasedName, false,
      check: () => pinCode.length.equalsExp(const Constant(6)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        name,
        phone,
        birthYear,
        sex,
        height,
        weight,
        pinCode
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('birth_year')) {
      context.handle(_birthYearMeta,
          birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta));
    } else if (isInserting) {
      context.missing(_birthYearMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('pin_code')) {
      context.handle(_pinCodeMeta,
          pinCode.isAcceptableOrUnknown(data['pin_code']!, _pinCodeMeta));
    } else if (isInserting) {
      context.missing(_pinCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {pinCode},
      ];
  @override
  UserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      birthYear: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}birth_year'])!,
      sex: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sex'])!,
      height: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      weight: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
      pinCode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}pin_code'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class PillModel extends DataClass implements Insertable<PillModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String entpName;
  final String name;
  final String? material;
  final Uint8List? image;
  final String? effect;
  final String? useage;
  const PillModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.entpName,
      required this.name,
      this.material,
      this.image,
      this.effect,
      this.useage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['entp_name'] = Variable<String>(entpName);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || material != null) {
      map['material'] = Variable<String>(material);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    if (!nullToAbsent || effect != null) {
      map['effect'] = Variable<String>(effect);
    }
    if (!nullToAbsent || useage != null) {
      map['useage'] = Variable<String>(useage);
    }
    return map;
  }

  PillsCompanion toCompanion(bool nullToAbsent) {
    return PillsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      entpName: Value(entpName),
      name: Value(name),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      effect:
          effect == null && nullToAbsent ? const Value.absent() : Value(effect),
      useage:
          useage == null && nullToAbsent ? const Value.absent() : Value(useage),
    );
  }

  factory PillModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PillModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      entpName: serializer.fromJson<String>(json['entpName']),
      name: serializer.fromJson<String>(json['name']),
      material: serializer.fromJson<String?>(json['material']),
      image: serializer.fromJson<Uint8List?>(json['image']),
      effect: serializer.fromJson<String?>(json['effect']),
      useage: serializer.fromJson<String?>(json['useage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'entpName': serializer.toJson<String>(entpName),
      'name': serializer.toJson<String>(name),
      'material': serializer.toJson<String?>(material),
      'image': serializer.toJson<Uint8List?>(image),
      'effect': serializer.toJson<String?>(effect),
      'useage': serializer.toJson<String?>(useage),
    };
  }

  PillModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? entpName,
          String? name,
          Value<String?> material = const Value.absent(),
          Value<Uint8List?> image = const Value.absent(),
          Value<String?> effect = const Value.absent(),
          Value<String?> useage = const Value.absent()}) =>
      PillModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        entpName: entpName ?? this.entpName,
        name: name ?? this.name,
        material: material.present ? material.value : this.material,
        image: image.present ? image.value : this.image,
        effect: effect.present ? effect.value : this.effect,
        useage: useage.present ? useage.value : this.useage,
      );
  @override
  String toString() {
    return (StringBuffer('PillModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('entpName: $entpName, ')
          ..write('name: $name, ')
          ..write('material: $material, ')
          ..write('image: $image, ')
          ..write('effect: $effect, ')
          ..write('useage: $useage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, entpName, name,
      material, image, effect, useage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PillModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.entpName == this.entpName &&
          other.name == this.name &&
          other.material == this.material &&
          other.image == this.image &&
          other.effect == this.effect &&
          other.useage == this.useage);
}

class PillsCompanion extends UpdateCompanion<PillModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> entpName;
  final Value<String> name;
  final Value<String?> material;
  final Value<Uint8List?> image;
  final Value<String?> effect;
  final Value<String?> useage;
  const PillsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.entpName = const Value.absent(),
    this.name = const Value.absent(),
    this.material = const Value.absent(),
    this.image = const Value.absent(),
    this.effect = const Value.absent(),
    this.useage = const Value.absent(),
  });
  PillsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String entpName,
    required String name,
    this.material = const Value.absent(),
    this.image = const Value.absent(),
    this.effect = const Value.absent(),
    this.useage = const Value.absent(),
  })  : entpName = Value(entpName),
        name = Value(name);
  static Insertable<PillModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? entpName,
    Expression<String>? name,
    Expression<String>? material,
    Expression<Uint8List>? image,
    Expression<String>? effect,
    Expression<String>? useage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (entpName != null) 'entp_name': entpName,
      if (name != null) 'name': name,
      if (material != null) 'material': material,
      if (image != null) 'image': image,
      if (effect != null) 'effect': effect,
      if (useage != null) 'useage': useage,
    });
  }

  PillsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? entpName,
      Value<String>? name,
      Value<String?>? material,
      Value<Uint8List?>? image,
      Value<String?>? effect,
      Value<String?>? useage}) {
    return PillsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      entpName: entpName ?? this.entpName,
      name: name ?? this.name,
      material: material ?? this.material,
      image: image ?? this.image,
      effect: effect ?? this.effect,
      useage: useage ?? this.useage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (entpName.present) {
      map['entp_name'] = Variable<String>(entpName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (effect.present) {
      map['effect'] = Variable<String>(effect.value);
    }
    if (useage.present) {
      map['useage'] = Variable<String>(useage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PillsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('entpName: $entpName, ')
          ..write('name: $name, ')
          ..write('material: $material, ')
          ..write('image: $image, ')
          ..write('effect: $effect, ')
          ..write('useage: $useage')
          ..write(')'))
        .toString();
  }
}

class $PillsTable extends Pills with TableInfo<$PillsTable, PillModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PillsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _entpNameMeta = const VerificationMeta('entpName');
  @override
  late final GeneratedColumn<String> entpName = GeneratedColumn<String>(
      'entp_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _materialMeta = const VerificationMeta('material');
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
      'material', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  final VerificationMeta _effectMeta = const VerificationMeta('effect');
  @override
  late final GeneratedColumn<String> effect = GeneratedColumn<String>(
      'effect', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _useageMeta = const VerificationMeta('useage');
  @override
  late final GeneratedColumn<String> useage = GeneratedColumn<String>(
      'useage', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        entpName,
        name,
        material,
        image,
        effect,
        useage
      ];
  @override
  String get aliasedName => _alias ?? 'pills';
  @override
  String get actualTableName => 'pills';
  @override
  VerificationContext validateIntegrity(Insertable<PillModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('entp_name')) {
      context.handle(_entpNameMeta,
          entpName.isAcceptableOrUnknown(data['entp_name']!, _entpNameMeta));
    } else if (isInserting) {
      context.missing(_entpNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('material')) {
      context.handle(_materialMeta,
          material.isAcceptableOrUnknown(data['material']!, _materialMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('effect')) {
      context.handle(_effectMeta,
          effect.isAcceptableOrUnknown(data['effect']!, _effectMeta));
    }
    if (data.containsKey('useage')) {
      context.handle(_useageMeta,
          useage.isAcceptableOrUnknown(data['useage']!, _useageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PillModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PillModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      entpName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}entp_name'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      material: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}material']),
      image: attachedDatabase.options.types
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
      effect: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}effect']),
      useage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}useage']),
    );
  }

  @override
  $PillsTable createAlias(String alias) {
    return $PillsTable(attachedDatabase, alias);
  }
}

class HospitalVisitScheduleModel extends DataClass
    implements Insertable<HospitalVisitScheduleModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  /// 진료 타입
  final HospitalVisitScheduleType type;

  /// 병원 이름
  final String hospitalName;

  /// 진료 과목
  final String medicalSubject;

  /// 의사 이름
  final String doctorName;

  /// 방문 예약일
  final DateTime reservedAt;

  /// 방문일
  final DateTime? visitedAt;

  /// 알림
  final bool push;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;
  const HospitalVisitScheduleModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.type,
      required this.hospitalName,
      required this.medicalSubject,
      required this.doctorName,
      required this.reservedAt,
      this.visitedAt,
      required this.push,
      required this.beforePush,
      required this.afterPush});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      final converter = $HospitalVisitSchedulesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type));
    }
    map['hospital_name'] = Variable<String>(hospitalName);
    map['medical_subject'] = Variable<String>(medicalSubject);
    map['doctor_name'] = Variable<String>(doctorName);
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    if (!nullToAbsent || visitedAt != null) {
      map['visited_at'] = Variable<DateTime>(visitedAt);
    }
    map['push'] = Variable<bool>(push);
    map['before_push'] = Variable<bool>(beforePush);
    map['after_push'] = Variable<bool>(afterPush);
    return map;
  }

  HospitalVisitSchedulesCompanion toCompanion(bool nullToAbsent) {
    return HospitalVisitSchedulesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      type: Value(type),
      hospitalName: Value(hospitalName),
      medicalSubject: Value(medicalSubject),
      doctorName: Value(doctorName),
      reservedAt: Value(reservedAt),
      visitedAt: visitedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(visitedAt),
      push: Value(push),
      beforePush: Value(beforePush),
      afterPush: Value(afterPush),
    );
  }

  factory HospitalVisitScheduleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalVisitScheduleModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      type: serializer.fromJson<HospitalVisitScheduleType>(json['type']),
      hospitalName: serializer.fromJson<String>(json['hospitalName']),
      medicalSubject: serializer.fromJson<String>(json['medicalSubject']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      reservedAt: serializer.fromJson<DateTime>(json['reservedAt']),
      visitedAt: serializer.fromJson<DateTime?>(json['visitedAt']),
      push: serializer.fromJson<bool>(json['push']),
      beforePush: serializer.fromJson<bool>(json['beforePush']),
      afterPush: serializer.fromJson<bool>(json['afterPush']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'type': serializer.toJson<HospitalVisitScheduleType>(type),
      'hospitalName': serializer.toJson<String>(hospitalName),
      'medicalSubject': serializer.toJson<String>(medicalSubject),
      'doctorName': serializer.toJson<String>(doctorName),
      'reservedAt': serializer.toJson<DateTime>(reservedAt),
      'visitedAt': serializer.toJson<DateTime?>(visitedAt),
      'push': serializer.toJson<bool>(push),
      'beforePush': serializer.toJson<bool>(beforePush),
      'afterPush': serializer.toJson<bool>(afterPush),
    };
  }

  HospitalVisitScheduleModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          HospitalVisitScheduleType? type,
          String? hospitalName,
          String? medicalSubject,
          String? doctorName,
          DateTime? reservedAt,
          Value<DateTime?> visitedAt = const Value.absent(),
          bool? push,
          bool? beforePush,
          bool? afterPush}) =>
      HospitalVisitScheduleModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        hospitalName: hospitalName ?? this.hospitalName,
        medicalSubject: medicalSubject ?? this.medicalSubject,
        doctorName: doctorName ?? this.doctorName,
        reservedAt: reservedAt ?? this.reservedAt,
        visitedAt: visitedAt.present ? visitedAt.value : this.visitedAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );
  @override
  String toString() {
    return (StringBuffer('HospitalVisitScheduleModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('medicalSubject: $medicalSubject, ')
          ..write('doctorName: $doctorName, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('visitedAt: $visitedAt, ')
          ..write('push: $push, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      id,
      createdAt,
      updatedAt,
      type,
      hospitalName,
      medicalSubject,
      doctorName,
      reservedAt,
      visitedAt,
      push,
      beforePush,
      afterPush);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalVisitScheduleModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.type == this.type &&
          other.hospitalName == this.hospitalName &&
          other.medicalSubject == this.medicalSubject &&
          other.doctorName == this.doctorName &&
          other.reservedAt == this.reservedAt &&
          other.visitedAt == this.visitedAt &&
          other.push == this.push &&
          other.beforePush == this.beforePush &&
          other.afterPush == this.afterPush);
}

class HospitalVisitSchedulesCompanion
    extends UpdateCompanion<HospitalVisitScheduleModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<HospitalVisitScheduleType> type;
  final Value<String> hospitalName;
  final Value<String> medicalSubject;
  final Value<String> doctorName;
  final Value<DateTime> reservedAt;
  final Value<DateTime?> visitedAt;
  final Value<bool> push;
  final Value<bool> beforePush;
  final Value<bool> afterPush;
  const HospitalVisitSchedulesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.type = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.medicalSubject = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.reservedAt = const Value.absent(),
    this.visitedAt = const Value.absent(),
    this.push = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  });
  HospitalVisitSchedulesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required HospitalVisitScheduleType type,
    required String hospitalName,
    this.medicalSubject = const Value.absent(),
    this.doctorName = const Value.absent(),
    required DateTime reservedAt,
    this.visitedAt = const Value.absent(),
    this.push = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  })  : userId = Value(userId),
        type = Value(type),
        hospitalName = Value(hospitalName),
        reservedAt = Value(reservedAt);
  static Insertable<HospitalVisitScheduleModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? type,
    Expression<String>? hospitalName,
    Expression<String>? medicalSubject,
    Expression<String>? doctorName,
    Expression<DateTime>? reservedAt,
    Expression<DateTime>? visitedAt,
    Expression<bool>? push,
    Expression<bool>? beforePush,
    Expression<bool>? afterPush,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (type != null) 'type': type,
      if (hospitalName != null) 'hospital_name': hospitalName,
      if (medicalSubject != null) 'medical_subject': medicalSubject,
      if (doctorName != null) 'doctor_name': doctorName,
      if (reservedAt != null) 'reserved_at': reservedAt,
      if (visitedAt != null) 'visited_at': visitedAt,
      if (push != null) 'push': push,
      if (beforePush != null) 'before_push': beforePush,
      if (afterPush != null) 'after_push': afterPush,
    });
  }

  HospitalVisitSchedulesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<HospitalVisitScheduleType>? type,
      Value<String>? hospitalName,
      Value<String>? medicalSubject,
      Value<String>? doctorName,
      Value<DateTime>? reservedAt,
      Value<DateTime?>? visitedAt,
      Value<bool>? push,
      Value<bool>? beforePush,
      Value<bool>? afterPush}) {
    return HospitalVisitSchedulesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      type: type ?? this.type,
      hospitalName: hospitalName ?? this.hospitalName,
      medicalSubject: medicalSubject ?? this.medicalSubject,
      doctorName: doctorName ?? this.doctorName,
      reservedAt: reservedAt ?? this.reservedAt,
      visitedAt: visitedAt ?? this.visitedAt,
      push: push ?? this.push,
      beforePush: beforePush ?? this.beforePush,
      afterPush: afterPush ?? this.afterPush,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (type.present) {
      final converter = $HospitalVisitSchedulesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (hospitalName.present) {
      map['hospital_name'] = Variable<String>(hospitalName.value);
    }
    if (medicalSubject.present) {
      map['medical_subject'] = Variable<String>(medicalSubject.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (reservedAt.present) {
      map['reserved_at'] = Variable<DateTime>(reservedAt.value);
    }
    if (visitedAt.present) {
      map['visited_at'] = Variable<DateTime>(visitedAt.value);
    }
    if (push.present) {
      map['push'] = Variable<bool>(push.value);
    }
    if (beforePush.present) {
      map['before_push'] = Variable<bool>(beforePush.value);
    }
    if (afterPush.present) {
      map['after_push'] = Variable<bool>(afterPush.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalVisitSchedulesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('type: $type, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('medicalSubject: $medicalSubject, ')
          ..write('doctorName: $doctorName, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('visitedAt: $visitedAt, ')
          ..write('push: $push, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }
}

class $HospitalVisitSchedulesTable extends HospitalVisitSchedules
    with TableInfo<$HospitalVisitSchedulesTable, HospitalVisitScheduleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalVisitSchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<HospitalVisitScheduleType, int>
      type = GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<HospitalVisitScheduleType>(
              $HospitalVisitSchedulesTable.$converter0);
  final VerificationMeta _hospitalNameMeta =
      const VerificationMeta('hospitalName');
  @override
  late final GeneratedColumn<String> hospitalName = GeneratedColumn<String>(
      'hospital_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _medicalSubjectMeta =
      const VerificationMeta('medicalSubject');
  @override
  late final GeneratedColumn<String> medicalSubject = GeneratedColumn<String>(
      'medical_subject', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime> reservedAt = GeneratedColumn<DateTime>(
      'reserved_at', aliasedName, false,
      check: () => reservedAt.isBiggerThan(currentDate),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true);
  final VerificationMeta _visitedAtMeta = const VerificationMeta('visitedAt');
  @override
  late final GeneratedColumn<DateTime> visitedAt = GeneratedColumn<DateTime>(
      'visited_at', aliasedName, true,
      check: () => visitedAt.isBiggerThan(currentDate),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false);
  final VerificationMeta _pushMeta = const VerificationMeta('push');
  @override
  late final GeneratedColumn<bool> push = GeneratedColumn<bool>(
      'push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _beforePushMeta = const VerificationMeta('beforePush');
  @override
  late final GeneratedColumn<bool> beforePush = GeneratedColumn<bool>(
      'before_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (before_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _afterPushMeta = const VerificationMeta('afterPush');
  @override
  late final GeneratedColumn<bool> afterPush = GeneratedColumn<bool>(
      'after_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (after_push IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        id,
        createdAt,
        updatedAt,
        type,
        hospitalName,
        medicalSubject,
        doctorName,
        reservedAt,
        visitedAt,
        push,
        beforePush,
        afterPush
      ];
  @override
  String get aliasedName => _alias ?? 'hospital_visit_schedules';
  @override
  String get actualTableName => 'hospital_visit_schedules';
  @override
  VerificationContext validateIntegrity(
      Insertable<HospitalVisitScheduleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('hospital_name')) {
      context.handle(
          _hospitalNameMeta,
          hospitalName.isAcceptableOrUnknown(
              data['hospital_name']!, _hospitalNameMeta));
    } else if (isInserting) {
      context.missing(_hospitalNameMeta);
    }
    if (data.containsKey('medical_subject')) {
      context.handle(
          _medicalSubjectMeta,
          medicalSubject.isAcceptableOrUnknown(
              data['medical_subject']!, _medicalSubjectMeta));
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    }
    if (data.containsKey('reserved_at')) {
      context.handle(
          _reservedAtMeta,
          reservedAt.isAcceptableOrUnknown(
              data['reserved_at']!, _reservedAtMeta));
    } else if (isInserting) {
      context.missing(_reservedAtMeta);
    }
    if (data.containsKey('visited_at')) {
      context.handle(_visitedAtMeta,
          visitedAt.isAcceptableOrUnknown(data['visited_at']!, _visitedAtMeta));
    }
    if (data.containsKey('push')) {
      context.handle(
          _pushMeta, push.isAcceptableOrUnknown(data['push']!, _pushMeta));
    }
    if (data.containsKey('before_push')) {
      context.handle(
          _beforePushMeta,
          beforePush.isAcceptableOrUnknown(
              data['before_push']!, _beforePushMeta));
    }
    if (data.containsKey('after_push')) {
      context.handle(_afterPushMeta,
          afterPush.isAcceptableOrUnknown(data['after_push']!, _afterPushMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, reservedAt},
      ];
  @override
  HospitalVisitScheduleModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalVisitScheduleModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      type: $HospitalVisitSchedulesTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      hospitalName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hospital_name'])!,
      medicalSubject: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}medical_subject'])!,
      doctorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      reservedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reserved_at'])!,
      visitedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visited_at']),
      push: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}push'])!,
      beforePush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}before_push'])!,
      afterPush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}after_push'])!,
    );
  }

  @override
  $HospitalVisitSchedulesTable createAlias(String alias) {
    return $HospitalVisitSchedulesTable(attachedDatabase, alias);
  }

  static TypeConverter<HospitalVisitScheduleType, int> $converter0 =
      const EnumIndexConverter<HospitalVisitScheduleType>(
          HospitalVisitScheduleType.values);
}

class LiverLevelHistoryModel extends DataClass
    implements Insertable<LiverLevelHistoryModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final DateTime date;
  final LiverLevelType type;
  final int value;
  const LiverLevelHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.date,
      required this.type,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['date'] = Variable<DateTime>(date);
    {
      final converter = $LiverLevelHistoriesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type));
    }
    map['value'] = Variable<int>(value);
    return map;
  }

  LiverLevelHistoriesCompanion toCompanion(bool nullToAbsent) {
    return LiverLevelHistoriesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      date: Value(date),
      type: Value(type),
      value: Value(value),
    );
  }

  factory LiverLevelHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LiverLevelHistoryModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<LiverLevelType>(json['type']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<LiverLevelType>(type),
      'value': serializer.toJson<int>(value),
    };
  }

  LiverLevelHistoryModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? date,
          LiverLevelType? type,
          int? value}) =>
      LiverLevelHistoryModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        date: date ?? this.date,
        type: type ?? this.type,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('LiverLevelHistoryModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, id, createdAt, updatedAt, date, type, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LiverLevelHistoryModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.date == this.date &&
          other.type == this.type &&
          other.value == this.value);
}

class LiverLevelHistoriesCompanion
    extends UpdateCompanion<LiverLevelHistoryModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> date;
  final Value<LiverLevelType> type;
  final Value<int> value;
  const LiverLevelHistoriesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
  });
  LiverLevelHistoriesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime date,
    required LiverLevelType type,
    required int value,
  })  : userId = Value(userId),
        date = Value(date),
        type = Value(type),
        value = Value(value);
  static Insertable<LiverLevelHistoryModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? date,
    Expression<int>? type,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    });
  }

  LiverLevelHistoriesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime>? date,
      Value<LiverLevelType>? type,
      Value<int>? value}) {
    return LiverLevelHistoriesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      final converter = $LiverLevelHistoriesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LiverLevelHistoriesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $LiverLevelHistoriesTable extends LiverLevelHistories
    with TableInfo<$LiverLevelHistoriesTable, LiverLevelHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LiverLevelHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<LiverLevelType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LiverLevelType>($LiverLevelHistoriesTable.$converter0);
  final VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, date, type, value];
  @override
  String get aliasedName => _alias ?? 'liver_level_histories';
  @override
  String get actualTableName => 'liver_level_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<LiverLevelHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, date, type},
      ];
  @override
  LiverLevelHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LiverLevelHistoryModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: $LiverLevelHistoriesTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      value: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $LiverLevelHistoriesTable createAlias(String alias) {
    return $LiverLevelHistoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<LiverLevelType, int> $converter0 =
      const EnumIndexConverter<LiverLevelType>(LiverLevelType.values);
}

class PointHistoryModel extends DataClass
    implements Insertable<PointHistoryModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final PointHistoryEvent event;
  final int point;
  final String forginId;
  const PointHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.event,
      required this.point,
      required this.forginId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      final converter = $PointHistoriesTable.$converter0;
      map['event'] = Variable<int>(converter.toSql(event));
    }
    map['point'] = Variable<int>(point);
    map['forgin_id'] = Variable<String>(forginId);
    return map;
  }

  PointHistoriesCompanion toCompanion(bool nullToAbsent) {
    return PointHistoriesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      event: Value(event),
      point: Value(point),
      forginId: Value(forginId),
    );
  }

  factory PointHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointHistoryModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      event: serializer.fromJson<PointHistoryEvent>(json['event']),
      point: serializer.fromJson<int>(json['point']),
      forginId: serializer.fromJson<String>(json['forginId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'event': serializer.toJson<PointHistoryEvent>(event),
      'point': serializer.toJson<int>(point),
      'forginId': serializer.toJson<String>(forginId),
    };
  }

  PointHistoryModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          PointHistoryEvent? event,
          int? point,
          String? forginId}) =>
      PointHistoryModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        event: event ?? this.event,
        point: point ?? this.point,
        forginId: forginId ?? this.forginId,
      );
  @override
  String toString() {
    return (StringBuffer('PointHistoryModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('event: $event, ')
          ..write('point: $point, ')
          ..write('forginId: $forginId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, id, createdAt, updatedAt, event, point, forginId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointHistoryModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.event == this.event &&
          other.point == this.point &&
          other.forginId == this.forginId);
}

class PointHistoriesCompanion extends UpdateCompanion<PointHistoryModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<PointHistoryEvent> event;
  final Value<int> point;
  final Value<String> forginId;
  const PointHistoriesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.event = const Value.absent(),
    this.point = const Value.absent(),
    this.forginId = const Value.absent(),
  });
  PointHistoriesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required PointHistoryEvent event,
    required int point,
    required String forginId,
  })  : userId = Value(userId),
        event = Value(event),
        point = Value(point),
        forginId = Value(forginId);
  static Insertable<PointHistoryModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? event,
    Expression<int>? point,
    Expression<String>? forginId,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (event != null) 'event': event,
      if (point != null) 'point': point,
      if (forginId != null) 'forgin_id': forginId,
    });
  }

  PointHistoriesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<PointHistoryEvent>? event,
      Value<int>? point,
      Value<String>? forginId}) {
    return PointHistoriesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      event: event ?? this.event,
      point: point ?? this.point,
      forginId: forginId ?? this.forginId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (event.present) {
      final converter = $PointHistoriesTable.$converter0;
      map['event'] = Variable<int>(converter.toSql(event.value));
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    if (forginId.present) {
      map['forgin_id'] = Variable<String>(forginId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointHistoriesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('event: $event, ')
          ..write('point: $point, ')
          ..write('forginId: $forginId')
          ..write(')'))
        .toString();
  }
}

class $PointHistoriesTable extends PointHistories
    with TableInfo<$PointHistoriesTable, PointHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumnWithTypeConverter<PointHistoryEvent, int> event =
      GeneratedColumn<int>('event', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PointHistoryEvent>($PointHistoriesTable.$converter0);
  final VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
      'point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _forginIdMeta = const VerificationMeta('forginId');
  @override
  late final GeneratedColumn<String> forginId = GeneratedColumn<String>(
      'forgin_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, event, point, forginId];
  @override
  String get aliasedName => _alias ?? 'point_histories';
  @override
  String get actualTableName => 'point_histories';
  @override
  VerificationContext validateIntegrity(Insertable<PointHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_eventMeta, const VerificationResult.success());
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    if (data.containsKey('forgin_id')) {
      context.handle(_forginIdMeta,
          forginId.isAcceptableOrUnknown(data['forgin_id']!, _forginIdMeta));
    } else if (isInserting) {
      context.missing(_forginIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, event, forginId},
      ];
  @override
  PointHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointHistoryModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      event: $PointHistoriesTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}event'])!),
      point: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}point'])!,
      forginId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}forgin_id'])!,
    );
  }

  @override
  $PointHistoriesTable createAlias(String alias) {
    return $PointHistoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<PointHistoryEvent, int> $converter0 =
      const EnumIndexConverter<PointHistoryEvent>(PointHistoryEvent.values);
}

class SF12SurveyHistoryModel extends DataClass
    implements Insertable<SF12SurveyHistoryModel> {
  final String hospitalVisitScheduleId;
  final bool done;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  const SF12SurveyHistoryModel(
      {required this.hospitalVisitScheduleId,
      required this.done,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hospital_visit_schedule_id'] =
        Variable<String>(hospitalVisitScheduleId);
    map['done'] = Variable<bool>(done);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SF12SurveyHistoriesCompanion toCompanion(bool nullToAbsent) {
    return SF12SurveyHistoriesCompanion(
      hospitalVisitScheduleId: Value(hospitalVisitScheduleId),
      done: Value(done),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SF12SurveyHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SF12SurveyHistoryModel(
      hospitalVisitScheduleId:
          serializer.fromJson<String>(json['hospitalVisitScheduleId']),
      done: serializer.fromJson<bool>(json['done']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hospitalVisitScheduleId':
          serializer.toJson<String>(hospitalVisitScheduleId),
      'done': serializer.toJson<bool>(done),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SF12SurveyHistoryModel copyWith(
          {String? hospitalVisitScheduleId,
          bool? done,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SF12SurveyHistoryModel(
        hospitalVisitScheduleId:
            hospitalVisitScheduleId ?? this.hospitalVisitScheduleId,
        done: done ?? this.done,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SF12SurveyHistoryModel(')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId, ')
          ..write('done: $done, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(hospitalVisitScheduleId, done, id, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SF12SurveyHistoryModel &&
          other.hospitalVisitScheduleId == this.hospitalVisitScheduleId &&
          other.done == this.done &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SF12SurveyHistoriesCompanion
    extends UpdateCompanion<SF12SurveyHistoryModel> {
  final Value<String> hospitalVisitScheduleId;
  final Value<bool> done;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SF12SurveyHistoriesCompanion({
    this.hospitalVisitScheduleId = const Value.absent(),
    this.done = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SF12SurveyHistoriesCompanion.insert({
    required String hospitalVisitScheduleId,
    this.done = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : hospitalVisitScheduleId = Value(hospitalVisitScheduleId);
  static Insertable<SF12SurveyHistoryModel> custom({
    Expression<String>? hospitalVisitScheduleId,
    Expression<bool>? done,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (hospitalVisitScheduleId != null)
        'hospital_visit_schedule_id': hospitalVisitScheduleId,
      if (done != null) 'done': done,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SF12SurveyHistoriesCompanion copyWith(
      {Value<String>? hospitalVisitScheduleId,
      Value<bool>? done,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SF12SurveyHistoriesCompanion(
      hospitalVisitScheduleId:
          hospitalVisitScheduleId ?? this.hospitalVisitScheduleId,
      done: done ?? this.done,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hospitalVisitScheduleId.present) {
      map['hospital_visit_schedule_id'] =
          Variable<String>(hospitalVisitScheduleId.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SF12SurveyHistoriesCompanion(')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId, ')
          ..write('done: $done, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SF12SurveyHistoriesTable extends SF12SurveyHistories
    with TableInfo<$SF12SurveyHistoriesTable, SF12SurveyHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SF12SurveyHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _hospitalVisitScheduleIdMeta =
      const VerificationMeta('hospitalVisitScheduleId');
  @override
  late final GeneratedColumn<String> hospitalVisitScheduleId =
      GeneratedColumn<String>('hospital_visit_schedule_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES hospital_visit_schedules (id)');
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [hospitalVisitScheduleId, done, id, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 's_f12_survey_histories';
  @override
  String get actualTableName => 's_f12_survey_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<SF12SurveyHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hospital_visit_schedule_id')) {
      context.handle(
          _hospitalVisitScheduleIdMeta,
          hospitalVisitScheduleId.isAcceptableOrUnknown(
              data['hospital_visit_schedule_id']!,
              _hospitalVisitScheduleIdMeta));
    } else if (isInserting) {
      context.missing(_hospitalVisitScheduleIdMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {hospitalVisitScheduleId},
      ];
  @override
  SF12SurveyHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SF12SurveyHistoryModel(
      hospitalVisitScheduleId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}hospital_visit_schedule_id'])!,
      done: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SF12SurveyHistoriesTable createAlias(String alias) {
    return $SF12SurveyHistoriesTable(attachedDatabase, alias);
  }
}

class MedicationAdherenceSurveyHistoryModel extends DataClass
    implements Insertable<MedicationAdherenceSurveyHistoryModel> {
  final String hospitalVisitScheduleId;
  final bool done;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  const MedicationAdherenceSurveyHistoryModel(
      {required this.hospitalVisitScheduleId,
      required this.done,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hospital_visit_schedule_id'] =
        Variable<String>(hospitalVisitScheduleId);
    map['done'] = Variable<bool>(done);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicationAdherenceSurveyHistoriesCompanion toCompanion(bool nullToAbsent) {
    return MedicationAdherenceSurveyHistoriesCompanion(
      hospitalVisitScheduleId: Value(hospitalVisitScheduleId),
      done: Value(done),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MedicationAdherenceSurveyHistoryModel.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationAdherenceSurveyHistoryModel(
      hospitalVisitScheduleId:
          serializer.fromJson<String>(json['hospitalVisitScheduleId']),
      done: serializer.fromJson<bool>(json['done']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hospitalVisitScheduleId':
          serializer.toJson<String>(hospitalVisitScheduleId),
      'done': serializer.toJson<bool>(done),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MedicationAdherenceSurveyHistoryModel copyWith(
          {String? hospitalVisitScheduleId,
          bool? done,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MedicationAdherenceSurveyHistoryModel(
        hospitalVisitScheduleId:
            hospitalVisitScheduleId ?? this.hospitalVisitScheduleId,
        done: done ?? this.done,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationAdherenceSurveyHistoryModel(')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId, ')
          ..write('done: $done, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(hospitalVisitScheduleId, done, id, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationAdherenceSurveyHistoryModel &&
          other.hospitalVisitScheduleId == this.hospitalVisitScheduleId &&
          other.done == this.done &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicationAdherenceSurveyHistoriesCompanion
    extends UpdateCompanion<MedicationAdherenceSurveyHistoryModel> {
  final Value<String> hospitalVisitScheduleId;
  final Value<bool> done;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MedicationAdherenceSurveyHistoriesCompanion({
    this.hospitalVisitScheduleId = const Value.absent(),
    this.done = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MedicationAdherenceSurveyHistoriesCompanion.insert({
    required String hospitalVisitScheduleId,
    this.done = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : hospitalVisitScheduleId = Value(hospitalVisitScheduleId);
  static Insertable<MedicationAdherenceSurveyHistoryModel> custom({
    Expression<String>? hospitalVisitScheduleId,
    Expression<bool>? done,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (hospitalVisitScheduleId != null)
        'hospital_visit_schedule_id': hospitalVisitScheduleId,
      if (done != null) 'done': done,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MedicationAdherenceSurveyHistoriesCompanion copyWith(
      {Value<String>? hospitalVisitScheduleId,
      Value<bool>? done,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return MedicationAdherenceSurveyHistoriesCompanion(
      hospitalVisitScheduleId:
          hospitalVisitScheduleId ?? this.hospitalVisitScheduleId,
      done: done ?? this.done,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hospitalVisitScheduleId.present) {
      map['hospital_visit_schedule_id'] =
          Variable<String>(hospitalVisitScheduleId.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationAdherenceSurveyHistoriesCompanion(')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId, ')
          ..write('done: $done, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MedicationAdherenceSurveyHistoriesTable
    extends MedicationAdherenceSurveyHistories
    with
        TableInfo<$MedicationAdherenceSurveyHistoriesTable,
            MedicationAdherenceSurveyHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationAdherenceSurveyHistoriesTable(this.attachedDatabase,
      [this._alias]);
  final VerificationMeta _hospitalVisitScheduleIdMeta =
      const VerificationMeta('hospitalVisitScheduleId');
  @override
  late final GeneratedColumn<String> hospitalVisitScheduleId =
      GeneratedColumn<String>('hospital_visit_schedule_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES hospital_visit_schedules (id)');
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [hospitalVisitScheduleId, done, id, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'medication_adherence_survey_histories';
  @override
  String get actualTableName => 'medication_adherence_survey_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationAdherenceSurveyHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hospital_visit_schedule_id')) {
      context.handle(
          _hospitalVisitScheduleIdMeta,
          hospitalVisitScheduleId.isAcceptableOrUnknown(
              data['hospital_visit_schedule_id']!,
              _hospitalVisitScheduleIdMeta));
    } else if (isInserting) {
      context.missing(_hospitalVisitScheduleIdMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {hospitalVisitScheduleId},
      ];
  @override
  MedicationAdherenceSurveyHistoryModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationAdherenceSurveyHistoryModel(
      hospitalVisitScheduleId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}hospital_visit_schedule_id'])!,
      done: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MedicationAdherenceSurveyHistoriesTable createAlias(String alias) {
    return $MedicationAdherenceSurveyHistoriesTable(attachedDatabase, alias);
  }
}

class SF12SurveyAnswerModel extends DataClass
    implements Insertable<SF12SurveyAnswerModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String sf12SurveyHistoryId;
  final int questionId;
  final String answers;
  const SF12SurveyAnswerModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.sf12SurveyHistoryId,
      required this.questionId,
      required this.answers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sf12_survey_history_id'] = Variable<String>(sf12SurveyHistoryId);
    map['question_id'] = Variable<int>(questionId);
    map['answers'] = Variable<String>(answers);
    return map;
  }

  SF12SurveyAnswersCompanion toCompanion(bool nullToAbsent) {
    return SF12SurveyAnswersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      sf12SurveyHistoryId: Value(sf12SurveyHistoryId),
      questionId: Value(questionId),
      answers: Value(answers),
    );
  }

  factory SF12SurveyAnswerModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SF12SurveyAnswerModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      sf12SurveyHistoryId:
          serializer.fromJson<String>(json['sf12SurveyHistoryId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      answers: serializer.fromJson<String>(json['answers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'sf12SurveyHistoryId': serializer.toJson<String>(sf12SurveyHistoryId),
      'questionId': serializer.toJson<int>(questionId),
      'answers': serializer.toJson<String>(answers),
    };
  }

  SF12SurveyAnswerModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? sf12SurveyHistoryId,
          int? questionId,
          String? answers}) =>
      SF12SurveyAnswerModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        sf12SurveyHistoryId: sf12SurveyHistoryId ?? this.sf12SurveyHistoryId,
        questionId: questionId ?? this.questionId,
        answers: answers ?? this.answers,
      );
  @override
  String toString() {
    return (StringBuffer('SF12SurveyAnswerModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sf12SurveyHistoryId: $sf12SurveyHistoryId, ')
          ..write('questionId: $questionId, ')
          ..write('answers: $answers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, sf12SurveyHistoryId, questionId, answers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SF12SurveyAnswerModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.sf12SurveyHistoryId == this.sf12SurveyHistoryId &&
          other.questionId == this.questionId &&
          other.answers == this.answers);
}

class SF12SurveyAnswersCompanion
    extends UpdateCompanion<SF12SurveyAnswerModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> sf12SurveyHistoryId;
  final Value<int> questionId;
  final Value<String> answers;
  const SF12SurveyAnswersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sf12SurveyHistoryId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.answers = const Value.absent(),
  });
  SF12SurveyAnswersCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String sf12SurveyHistoryId,
    required int questionId,
    required String answers,
  })  : sf12SurveyHistoryId = Value(sf12SurveyHistoryId),
        questionId = Value(questionId),
        answers = Value(answers);
  static Insertable<SF12SurveyAnswerModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? sf12SurveyHistoryId,
    Expression<int>? questionId,
    Expression<String>? answers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sf12SurveyHistoryId != null)
        'sf12_survey_history_id': sf12SurveyHistoryId,
      if (questionId != null) 'question_id': questionId,
      if (answers != null) 'answers': answers,
    });
  }

  SF12SurveyAnswersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? sf12SurveyHistoryId,
      Value<int>? questionId,
      Value<String>? answers}) {
    return SF12SurveyAnswersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sf12SurveyHistoryId: sf12SurveyHistoryId ?? this.sf12SurveyHistoryId,
      questionId: questionId ?? this.questionId,
      answers: answers ?? this.answers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (sf12SurveyHistoryId.present) {
      map['sf12_survey_history_id'] =
          Variable<String>(sf12SurveyHistoryId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(answers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SF12SurveyAnswersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('sf12SurveyHistoryId: $sf12SurveyHistoryId, ')
          ..write('questionId: $questionId, ')
          ..write('answers: $answers')
          ..write(')'))
        .toString();
  }
}

class $SF12SurveyAnswersTable extends SF12SurveyAnswers
    with TableInfo<$SF12SurveyAnswersTable, SF12SurveyAnswerModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SF12SurveyAnswersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _sf12SurveyHistoryIdMeta =
      const VerificationMeta('sf12SurveyHistoryId');
  @override
  late final GeneratedColumn<String> sf12SurveyHistoryId =
      GeneratedColumn<String>('sf12_survey_history_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES s_f12_survey_histories (id)');
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _answersMeta = const VerificationMeta('answers');
  @override
  late final GeneratedColumn<String> answers = GeneratedColumn<String>(
      'answers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, sf12SurveyHistoryId, questionId, answers];
  @override
  String get aliasedName => _alias ?? 's_f12_survey_answers';
  @override
  String get actualTableName => 's_f12_survey_answers';
  @override
  VerificationContext validateIntegrity(
      Insertable<SF12SurveyAnswerModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('sf12_survey_history_id')) {
      context.handle(
          _sf12SurveyHistoryIdMeta,
          sf12SurveyHistoryId.isAcceptableOrUnknown(
              data['sf12_survey_history_id']!, _sf12SurveyHistoryIdMeta));
    } else if (isInserting) {
      context.missing(_sf12SurveyHistoryIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('answers')) {
      context.handle(_answersMeta,
          answers.isAcceptableOrUnknown(data['answers']!, _answersMeta));
    } else if (isInserting) {
      context.missing(_answersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {sf12SurveyHistoryId, questionId},
      ];
  @override
  SF12SurveyAnswerModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SF12SurveyAnswerModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      sf12SurveyHistoryId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}sf12_survey_history_id'])!,
      questionId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      answers: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answers'])!,
    );
  }

  @override
  $SF12SurveyAnswersTable createAlias(String alias) {
    return $SF12SurveyAnswersTable(attachedDatabase, alias);
  }
}

class MetabolicDiseaseModel extends DataClass
    implements Insertable<MetabolicDiseaseModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  /// A형 간염 여부
  final bool? hav;

  /// A형 간염 항체 보유 확인일
  final DateTime? antiHavConfirmedAt;

  /// A형 간염 예방 접종 완료 확인일
  final DateTime? vaccinConfirmedAt;

  /// B형 간염 여부
  final bool? hbv;

  /// B형 간염확인일
  final DateTime? hbvConfirmedAt;

  /// 간경병증 여부
  final bool? cirrhosis;

  /// C형 간염 여부
  final bool? hcv;
  const MetabolicDiseaseModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.hav,
      this.antiHavConfirmedAt,
      this.vaccinConfirmedAt,
      this.hbv,
      this.hbvConfirmedAt,
      this.cirrhosis,
      this.hcv});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || hav != null) {
      map['hav'] = Variable<bool>(hav);
    }
    if (!nullToAbsent || antiHavConfirmedAt != null) {
      map['anti_hav_confirmed_at'] = Variable<DateTime>(antiHavConfirmedAt);
    }
    if (!nullToAbsent || vaccinConfirmedAt != null) {
      map['vaccin_confirmed_at'] = Variable<DateTime>(vaccinConfirmedAt);
    }
    if (!nullToAbsent || hbv != null) {
      map['hbv'] = Variable<bool>(hbv);
    }
    if (!nullToAbsent || hbvConfirmedAt != null) {
      map['hbv_confirmed_at'] = Variable<DateTime>(hbvConfirmedAt);
    }
    if (!nullToAbsent || cirrhosis != null) {
      map['cirrhosis'] = Variable<bool>(cirrhosis);
    }
    if (!nullToAbsent || hcv != null) {
      map['hcv'] = Variable<bool>(hcv);
    }
    return map;
  }

  MetabolicDiseasesCompanion toCompanion(bool nullToAbsent) {
    return MetabolicDiseasesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      hav: hav == null && nullToAbsent ? const Value.absent() : Value(hav),
      antiHavConfirmedAt: antiHavConfirmedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(antiHavConfirmedAt),
      vaccinConfirmedAt: vaccinConfirmedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(vaccinConfirmedAt),
      hbv: hbv == null && nullToAbsent ? const Value.absent() : Value(hbv),
      hbvConfirmedAt: hbvConfirmedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(hbvConfirmedAt),
      cirrhosis: cirrhosis == null && nullToAbsent
          ? const Value.absent()
          : Value(cirrhosis),
      hcv: hcv == null && nullToAbsent ? const Value.absent() : Value(hcv),
    );
  }

  factory MetabolicDiseaseModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MetabolicDiseaseModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      hav: serializer.fromJson<bool?>(json['hav']),
      antiHavConfirmedAt:
          serializer.fromJson<DateTime?>(json['antiHavConfirmedAt']),
      vaccinConfirmedAt:
          serializer.fromJson<DateTime?>(json['vaccinConfirmedAt']),
      hbv: serializer.fromJson<bool?>(json['hbv']),
      hbvConfirmedAt: serializer.fromJson<DateTime?>(json['hbvConfirmedAt']),
      cirrhosis: serializer.fromJson<bool?>(json['cirrhosis']),
      hcv: serializer.fromJson<bool?>(json['hcv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'hav': serializer.toJson<bool?>(hav),
      'antiHavConfirmedAt': serializer.toJson<DateTime?>(antiHavConfirmedAt),
      'vaccinConfirmedAt': serializer.toJson<DateTime?>(vaccinConfirmedAt),
      'hbv': serializer.toJson<bool?>(hbv),
      'hbvConfirmedAt': serializer.toJson<DateTime?>(hbvConfirmedAt),
      'cirrhosis': serializer.toJson<bool?>(cirrhosis),
      'hcv': serializer.toJson<bool?>(hcv),
    };
  }

  MetabolicDiseaseModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<bool?> hav = const Value.absent(),
          Value<DateTime?> antiHavConfirmedAt = const Value.absent(),
          Value<DateTime?> vaccinConfirmedAt = const Value.absent(),
          Value<bool?> hbv = const Value.absent(),
          Value<DateTime?> hbvConfirmedAt = const Value.absent(),
          Value<bool?> cirrhosis = const Value.absent(),
          Value<bool?> hcv = const Value.absent()}) =>
      MetabolicDiseaseModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        hav: hav.present ? hav.value : this.hav,
        antiHavConfirmedAt: antiHavConfirmedAt.present
            ? antiHavConfirmedAt.value
            : this.antiHavConfirmedAt,
        vaccinConfirmedAt: vaccinConfirmedAt.present
            ? vaccinConfirmedAt.value
            : this.vaccinConfirmedAt,
        hbv: hbv.present ? hbv.value : this.hbv,
        hbvConfirmedAt:
            hbvConfirmedAt.present ? hbvConfirmedAt.value : this.hbvConfirmedAt,
        cirrhosis: cirrhosis.present ? cirrhosis.value : this.cirrhosis,
        hcv: hcv.present ? hcv.value : this.hcv,
      );
  @override
  String toString() {
    return (StringBuffer('MetabolicDiseaseModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('hav: $hav, ')
          ..write('antiHavConfirmedAt: $antiHavConfirmedAt, ')
          ..write('vaccinConfirmedAt: $vaccinConfirmedAt, ')
          ..write('hbv: $hbv, ')
          ..write('hbvConfirmedAt: $hbvConfirmedAt, ')
          ..write('cirrhosis: $cirrhosis, ')
          ..write('hcv: $hcv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      id,
      createdAt,
      updatedAt,
      hav,
      antiHavConfirmedAt,
      vaccinConfirmedAt,
      hbv,
      hbvConfirmedAt,
      cirrhosis,
      hcv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MetabolicDiseaseModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.hav == this.hav &&
          other.antiHavConfirmedAt == this.antiHavConfirmedAt &&
          other.vaccinConfirmedAt == this.vaccinConfirmedAt &&
          other.hbv == this.hbv &&
          other.hbvConfirmedAt == this.hbvConfirmedAt &&
          other.cirrhosis == this.cirrhosis &&
          other.hcv == this.hcv);
}

class MetabolicDiseasesCompanion
    extends UpdateCompanion<MetabolicDiseaseModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool?> hav;
  final Value<DateTime?> antiHavConfirmedAt;
  final Value<DateTime?> vaccinConfirmedAt;
  final Value<bool?> hbv;
  final Value<DateTime?> hbvConfirmedAt;
  final Value<bool?> cirrhosis;
  final Value<bool?> hcv;
  const MetabolicDiseasesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.hav = const Value.absent(),
    this.antiHavConfirmedAt = const Value.absent(),
    this.vaccinConfirmedAt = const Value.absent(),
    this.hbv = const Value.absent(),
    this.hbvConfirmedAt = const Value.absent(),
    this.cirrhosis = const Value.absent(),
    this.hcv = const Value.absent(),
  });
  MetabolicDiseasesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.hav = const Value.absent(),
    this.antiHavConfirmedAt = const Value.absent(),
    this.vaccinConfirmedAt = const Value.absent(),
    this.hbv = const Value.absent(),
    this.hbvConfirmedAt = const Value.absent(),
    this.cirrhosis = const Value.absent(),
    this.hcv = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<MetabolicDiseaseModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? hav,
    Expression<DateTime>? antiHavConfirmedAt,
    Expression<DateTime>? vaccinConfirmedAt,
    Expression<bool>? hbv,
    Expression<DateTime>? hbvConfirmedAt,
    Expression<bool>? cirrhosis,
    Expression<bool>? hcv,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (hav != null) 'hav': hav,
      if (antiHavConfirmedAt != null)
        'anti_hav_confirmed_at': antiHavConfirmedAt,
      if (vaccinConfirmedAt != null) 'vaccin_confirmed_at': vaccinConfirmedAt,
      if (hbv != null) 'hbv': hbv,
      if (hbvConfirmedAt != null) 'hbv_confirmed_at': hbvConfirmedAt,
      if (cirrhosis != null) 'cirrhosis': cirrhosis,
      if (hcv != null) 'hcv': hcv,
    });
  }

  MetabolicDiseasesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool?>? hav,
      Value<DateTime?>? antiHavConfirmedAt,
      Value<DateTime?>? vaccinConfirmedAt,
      Value<bool?>? hbv,
      Value<DateTime?>? hbvConfirmedAt,
      Value<bool?>? cirrhosis,
      Value<bool?>? hcv}) {
    return MetabolicDiseasesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      hav: hav ?? this.hav,
      antiHavConfirmedAt: antiHavConfirmedAt ?? this.antiHavConfirmedAt,
      vaccinConfirmedAt: vaccinConfirmedAt ?? this.vaccinConfirmedAt,
      hbv: hbv ?? this.hbv,
      hbvConfirmedAt: hbvConfirmedAt ?? this.hbvConfirmedAt,
      cirrhosis: cirrhosis ?? this.cirrhosis,
      hcv: hcv ?? this.hcv,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (hav.present) {
      map['hav'] = Variable<bool>(hav.value);
    }
    if (antiHavConfirmedAt.present) {
      map['anti_hav_confirmed_at'] =
          Variable<DateTime>(antiHavConfirmedAt.value);
    }
    if (vaccinConfirmedAt.present) {
      map['vaccin_confirmed_at'] = Variable<DateTime>(vaccinConfirmedAt.value);
    }
    if (hbv.present) {
      map['hbv'] = Variable<bool>(hbv.value);
    }
    if (hbvConfirmedAt.present) {
      map['hbv_confirmed_at'] = Variable<DateTime>(hbvConfirmedAt.value);
    }
    if (cirrhosis.present) {
      map['cirrhosis'] = Variable<bool>(cirrhosis.value);
    }
    if (hcv.present) {
      map['hcv'] = Variable<bool>(hcv.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetabolicDiseasesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('hav: $hav, ')
          ..write('antiHavConfirmedAt: $antiHavConfirmedAt, ')
          ..write('vaccinConfirmedAt: $vaccinConfirmedAt, ')
          ..write('hbv: $hbv, ')
          ..write('hbvConfirmedAt: $hbvConfirmedAt, ')
          ..write('cirrhosis: $cirrhosis, ')
          ..write('hcv: $hcv')
          ..write(')'))
        .toString();
  }
}

class $MetabolicDiseasesTable extends MetabolicDiseases
    with TableInfo<$MetabolicDiseasesTable, MetabolicDiseaseModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetabolicDiseasesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _havMeta = const VerificationMeta('hav');
  @override
  late final GeneratedColumn<bool> hav = GeneratedColumn<bool>(
      'hav', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (hav IN (0, 1))');
  final VerificationMeta _antiHavConfirmedAtMeta =
      const VerificationMeta('antiHavConfirmedAt');
  @override
  late final GeneratedColumn<DateTime> antiHavConfirmedAt =
      GeneratedColumn<DateTime>('anti_hav_confirmed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _vaccinConfirmedAtMeta =
      const VerificationMeta('vaccinConfirmedAt');
  @override
  late final GeneratedColumn<DateTime> vaccinConfirmedAt =
      GeneratedColumn<DateTime>('vaccin_confirmed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _hbvMeta = const VerificationMeta('hbv');
  @override
  late final GeneratedColumn<bool> hbv = GeneratedColumn<bool>(
      'hbv', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (hbv IN (0, 1))');
  final VerificationMeta _hbvConfirmedAtMeta =
      const VerificationMeta('hbvConfirmedAt');
  @override
  late final GeneratedColumn<DateTime> hbvConfirmedAt =
      GeneratedColumn<DateTime>('hbv_confirmed_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _cirrhosisMeta = const VerificationMeta('cirrhosis');
  @override
  late final GeneratedColumn<bool> cirrhosis = GeneratedColumn<bool>(
      'cirrhosis', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (cirrhosis IN (0, 1))');
  final VerificationMeta _hcvMeta = const VerificationMeta('hcv');
  @override
  late final GeneratedColumn<bool> hcv = GeneratedColumn<bool>(
      'hcv', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (hcv IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        id,
        createdAt,
        updatedAt,
        hav,
        antiHavConfirmedAt,
        vaccinConfirmedAt,
        hbv,
        hbvConfirmedAt,
        cirrhosis,
        hcv
      ];
  @override
  String get aliasedName => _alias ?? 'metabolic_diseases';
  @override
  String get actualTableName => 'metabolic_diseases';
  @override
  VerificationContext validateIntegrity(
      Insertable<MetabolicDiseaseModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('hav')) {
      context.handle(
          _havMeta, hav.isAcceptableOrUnknown(data['hav']!, _havMeta));
    }
    if (data.containsKey('anti_hav_confirmed_at')) {
      context.handle(
          _antiHavConfirmedAtMeta,
          antiHavConfirmedAt.isAcceptableOrUnknown(
              data['anti_hav_confirmed_at']!, _antiHavConfirmedAtMeta));
    }
    if (data.containsKey('vaccin_confirmed_at')) {
      context.handle(
          _vaccinConfirmedAtMeta,
          vaccinConfirmedAt.isAcceptableOrUnknown(
              data['vaccin_confirmed_at']!, _vaccinConfirmedAtMeta));
    }
    if (data.containsKey('hbv')) {
      context.handle(
          _hbvMeta, hbv.isAcceptableOrUnknown(data['hbv']!, _hbvMeta));
    }
    if (data.containsKey('hbv_confirmed_at')) {
      context.handle(
          _hbvConfirmedAtMeta,
          hbvConfirmedAt.isAcceptableOrUnknown(
              data['hbv_confirmed_at']!, _hbvConfirmedAtMeta));
    }
    if (data.containsKey('cirrhosis')) {
      context.handle(_cirrhosisMeta,
          cirrhosis.isAcceptableOrUnknown(data['cirrhosis']!, _cirrhosisMeta));
    }
    if (data.containsKey('hcv')) {
      context.handle(
          _hcvMeta, hcv.isAcceptableOrUnknown(data['hcv']!, _hcvMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId},
      ];
  @override
  MetabolicDiseaseModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetabolicDiseaseModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      hav: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}hav']),
      antiHavConfirmedAt: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}anti_hav_confirmed_at']),
      vaccinConfirmedAt: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}vaccin_confirmed_at']),
      hbv: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}hbv']),
      hbvConfirmedAt: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}hbv_confirmed_at']),
      cirrhosis: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}cirrhosis']),
      hcv: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}hcv']),
    );
  }

  @override
  $MetabolicDiseasesTable createAlias(String alias) {
    return $MetabolicDiseasesTable(attachedDatabase, alias);
  }
}

class ExaminationResultModel extends DataClass
    implements Insertable<ExaminationResultModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  /// 검사일
  final DateTime date;

  /// 혈소판
  final String? platelet;

  /// 간효소
  final String? ast;

  /// 간효소
  final String? alt;

  /// 간효소
  final String? ggt;

  /// 빌리루빈
  final String? bilirubin;

  /// 알부민
  final String? albumin;

  /// 알파태아단백질
  final String? afp;

  /// hbvDna
  final String? hbvDna;

  /// hcvRna
  final String? hcvRna;

  /// 양성종양(혈관종, 낭종 등)
  final String? benignTumor;

  /// 양성종양(혈관종, 낭종 등)
  final String? dangerousNodule;
  const ExaminationResultModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.date,
      this.platelet,
      this.ast,
      this.alt,
      this.ggt,
      this.bilirubin,
      this.albumin,
      this.afp,
      this.hbvDna,
      this.hcvRna,
      this.benignTumor,
      this.dangerousNodule});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || platelet != null) {
      map['platelet'] = Variable<String>(platelet);
    }
    if (!nullToAbsent || ast != null) {
      map['ast'] = Variable<String>(ast);
    }
    if (!nullToAbsent || alt != null) {
      map['alt'] = Variable<String>(alt);
    }
    if (!nullToAbsent || ggt != null) {
      map['ggt'] = Variable<String>(ggt);
    }
    if (!nullToAbsent || bilirubin != null) {
      map['bilirubin'] = Variable<String>(bilirubin);
    }
    if (!nullToAbsent || albumin != null) {
      map['albumin'] = Variable<String>(albumin);
    }
    if (!nullToAbsent || afp != null) {
      map['afp'] = Variable<String>(afp);
    }
    if (!nullToAbsent || hbvDna != null) {
      map['hbv_dna'] = Variable<String>(hbvDna);
    }
    if (!nullToAbsent || hcvRna != null) {
      map['hcv_rna'] = Variable<String>(hcvRna);
    }
    if (!nullToAbsent || benignTumor != null) {
      map['benign_tumor'] = Variable<String>(benignTumor);
    }
    if (!nullToAbsent || dangerousNodule != null) {
      map['dangerous_nodule'] = Variable<String>(dangerousNodule);
    }
    return map;
  }

  ExaminationResultsCompanion toCompanion(bool nullToAbsent) {
    return ExaminationResultsCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      date: Value(date),
      platelet: platelet == null && nullToAbsent
          ? const Value.absent()
          : Value(platelet),
      ast: ast == null && nullToAbsent ? const Value.absent() : Value(ast),
      alt: alt == null && nullToAbsent ? const Value.absent() : Value(alt),
      ggt: ggt == null && nullToAbsent ? const Value.absent() : Value(ggt),
      bilirubin: bilirubin == null && nullToAbsent
          ? const Value.absent()
          : Value(bilirubin),
      albumin: albumin == null && nullToAbsent
          ? const Value.absent()
          : Value(albumin),
      afp: afp == null && nullToAbsent ? const Value.absent() : Value(afp),
      hbvDna:
          hbvDna == null && nullToAbsent ? const Value.absent() : Value(hbvDna),
      hcvRna:
          hcvRna == null && nullToAbsent ? const Value.absent() : Value(hcvRna),
      benignTumor: benignTumor == null && nullToAbsent
          ? const Value.absent()
          : Value(benignTumor),
      dangerousNodule: dangerousNodule == null && nullToAbsent
          ? const Value.absent()
          : Value(dangerousNodule),
    );
  }

  factory ExaminationResultModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExaminationResultModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      date: serializer.fromJson<DateTime>(json['date']),
      platelet: serializer.fromJson<String?>(json['platelet']),
      ast: serializer.fromJson<String?>(json['ast']),
      alt: serializer.fromJson<String?>(json['alt']),
      ggt: serializer.fromJson<String?>(json['ggt']),
      bilirubin: serializer.fromJson<String?>(json['bilirubin']),
      albumin: serializer.fromJson<String?>(json['albumin']),
      afp: serializer.fromJson<String?>(json['afp']),
      hbvDna: serializer.fromJson<String?>(json['hbvDna']),
      hcvRna: serializer.fromJson<String?>(json['hcvRna']),
      benignTumor: serializer.fromJson<String?>(json['benignTumor']),
      dangerousNodule: serializer.fromJson<String?>(json['dangerousNodule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'date': serializer.toJson<DateTime>(date),
      'platelet': serializer.toJson<String?>(platelet),
      'ast': serializer.toJson<String?>(ast),
      'alt': serializer.toJson<String?>(alt),
      'ggt': serializer.toJson<String?>(ggt),
      'bilirubin': serializer.toJson<String?>(bilirubin),
      'albumin': serializer.toJson<String?>(albumin),
      'afp': serializer.toJson<String?>(afp),
      'hbvDna': serializer.toJson<String?>(hbvDna),
      'hcvRna': serializer.toJson<String?>(hcvRna),
      'benignTumor': serializer.toJson<String?>(benignTumor),
      'dangerousNodule': serializer.toJson<String?>(dangerousNodule),
    };
  }

  ExaminationResultModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? date,
          Value<String?> platelet = const Value.absent(),
          Value<String?> ast = const Value.absent(),
          Value<String?> alt = const Value.absent(),
          Value<String?> ggt = const Value.absent(),
          Value<String?> bilirubin = const Value.absent(),
          Value<String?> albumin = const Value.absent(),
          Value<String?> afp = const Value.absent(),
          Value<String?> hbvDna = const Value.absent(),
          Value<String?> hcvRna = const Value.absent(),
          Value<String?> benignTumor = const Value.absent(),
          Value<String?> dangerousNodule = const Value.absent()}) =>
      ExaminationResultModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        date: date ?? this.date,
        platelet: platelet.present ? platelet.value : this.platelet,
        ast: ast.present ? ast.value : this.ast,
        alt: alt.present ? alt.value : this.alt,
        ggt: ggt.present ? ggt.value : this.ggt,
        bilirubin: bilirubin.present ? bilirubin.value : this.bilirubin,
        albumin: albumin.present ? albumin.value : this.albumin,
        afp: afp.present ? afp.value : this.afp,
        hbvDna: hbvDna.present ? hbvDna.value : this.hbvDna,
        hcvRna: hcvRna.present ? hcvRna.value : this.hcvRna,
        benignTumor: benignTumor.present ? benignTumor.value : this.benignTumor,
        dangerousNodule: dangerousNodule.present
            ? dangerousNodule.value
            : this.dangerousNodule,
      );
  @override
  String toString() {
    return (StringBuffer('ExaminationResultModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('platelet: $platelet, ')
          ..write('ast: $ast, ')
          ..write('alt: $alt, ')
          ..write('ggt: $ggt, ')
          ..write('bilirubin: $bilirubin, ')
          ..write('albumin: $albumin, ')
          ..write('afp: $afp, ')
          ..write('hbvDna: $hbvDna, ')
          ..write('hcvRna: $hcvRna, ')
          ..write('benignTumor: $benignTumor, ')
          ..write('dangerousNodule: $dangerousNodule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      id,
      createdAt,
      updatedAt,
      date,
      platelet,
      ast,
      alt,
      ggt,
      bilirubin,
      albumin,
      afp,
      hbvDna,
      hcvRna,
      benignTumor,
      dangerousNodule);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExaminationResultModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.date == this.date &&
          other.platelet == this.platelet &&
          other.ast == this.ast &&
          other.alt == this.alt &&
          other.ggt == this.ggt &&
          other.bilirubin == this.bilirubin &&
          other.albumin == this.albumin &&
          other.afp == this.afp &&
          other.hbvDna == this.hbvDna &&
          other.hcvRna == this.hcvRna &&
          other.benignTumor == this.benignTumor &&
          other.dangerousNodule == this.dangerousNodule);
}

class ExaminationResultsCompanion
    extends UpdateCompanion<ExaminationResultModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> date;
  final Value<String?> platelet;
  final Value<String?> ast;
  final Value<String?> alt;
  final Value<String?> ggt;
  final Value<String?> bilirubin;
  final Value<String?> albumin;
  final Value<String?> afp;
  final Value<String?> hbvDna;
  final Value<String?> hcvRna;
  final Value<String?> benignTumor;
  final Value<String?> dangerousNodule;
  const ExaminationResultsCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.platelet = const Value.absent(),
    this.ast = const Value.absent(),
    this.alt = const Value.absent(),
    this.ggt = const Value.absent(),
    this.bilirubin = const Value.absent(),
    this.albumin = const Value.absent(),
    this.afp = const Value.absent(),
    this.hbvDna = const Value.absent(),
    this.hcvRna = const Value.absent(),
    this.benignTumor = const Value.absent(),
    this.dangerousNodule = const Value.absent(),
  });
  ExaminationResultsCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime date,
    this.platelet = const Value.absent(),
    this.ast = const Value.absent(),
    this.alt = const Value.absent(),
    this.ggt = const Value.absent(),
    this.bilirubin = const Value.absent(),
    this.albumin = const Value.absent(),
    this.afp = const Value.absent(),
    this.hbvDna = const Value.absent(),
    this.hcvRna = const Value.absent(),
    this.benignTumor = const Value.absent(),
    this.dangerousNodule = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date);
  static Insertable<ExaminationResultModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? date,
    Expression<String>? platelet,
    Expression<String>? ast,
    Expression<String>? alt,
    Expression<String>? ggt,
    Expression<String>? bilirubin,
    Expression<String>? albumin,
    Expression<String>? afp,
    Expression<String>? hbvDna,
    Expression<String>? hcvRna,
    Expression<String>? benignTumor,
    Expression<String>? dangerousNodule,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (platelet != null) 'platelet': platelet,
      if (ast != null) 'ast': ast,
      if (alt != null) 'alt': alt,
      if (ggt != null) 'ggt': ggt,
      if (bilirubin != null) 'bilirubin': bilirubin,
      if (albumin != null) 'albumin': albumin,
      if (afp != null) 'afp': afp,
      if (hbvDna != null) 'hbv_dna': hbvDna,
      if (hcvRna != null) 'hcv_rna': hcvRna,
      if (benignTumor != null) 'benign_tumor': benignTumor,
      if (dangerousNodule != null) 'dangerous_nodule': dangerousNodule,
    });
  }

  ExaminationResultsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime>? date,
      Value<String?>? platelet,
      Value<String?>? ast,
      Value<String?>? alt,
      Value<String?>? ggt,
      Value<String?>? bilirubin,
      Value<String?>? albumin,
      Value<String?>? afp,
      Value<String?>? hbvDna,
      Value<String?>? hcvRna,
      Value<String?>? benignTumor,
      Value<String?>? dangerousNodule}) {
    return ExaminationResultsCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      platelet: platelet ?? this.platelet,
      ast: ast ?? this.ast,
      alt: alt ?? this.alt,
      ggt: ggt ?? this.ggt,
      bilirubin: bilirubin ?? this.bilirubin,
      albumin: albumin ?? this.albumin,
      afp: afp ?? this.afp,
      hbvDna: hbvDna ?? this.hbvDna,
      hcvRna: hcvRna ?? this.hcvRna,
      benignTumor: benignTumor ?? this.benignTumor,
      dangerousNodule: dangerousNodule ?? this.dangerousNodule,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (platelet.present) {
      map['platelet'] = Variable<String>(platelet.value);
    }
    if (ast.present) {
      map['ast'] = Variable<String>(ast.value);
    }
    if (alt.present) {
      map['alt'] = Variable<String>(alt.value);
    }
    if (ggt.present) {
      map['ggt'] = Variable<String>(ggt.value);
    }
    if (bilirubin.present) {
      map['bilirubin'] = Variable<String>(bilirubin.value);
    }
    if (albumin.present) {
      map['albumin'] = Variable<String>(albumin.value);
    }
    if (afp.present) {
      map['afp'] = Variable<String>(afp.value);
    }
    if (hbvDna.present) {
      map['hbv_dna'] = Variable<String>(hbvDna.value);
    }
    if (hcvRna.present) {
      map['hcv_rna'] = Variable<String>(hcvRna.value);
    }
    if (benignTumor.present) {
      map['benign_tumor'] = Variable<String>(benignTumor.value);
    }
    if (dangerousNodule.present) {
      map['dangerous_nodule'] = Variable<String>(dangerousNodule.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExaminationResultsCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('platelet: $platelet, ')
          ..write('ast: $ast, ')
          ..write('alt: $alt, ')
          ..write('ggt: $ggt, ')
          ..write('bilirubin: $bilirubin, ')
          ..write('albumin: $albumin, ')
          ..write('afp: $afp, ')
          ..write('hbvDna: $hbvDna, ')
          ..write('hcvRna: $hcvRna, ')
          ..write('benignTumor: $benignTumor, ')
          ..write('dangerousNodule: $dangerousNodule')
          ..write(')'))
        .toString();
  }
}

class $ExaminationResultsTable extends ExaminationResults
    with TableInfo<$ExaminationResultsTable, ExaminationResultModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExaminationResultsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _plateletMeta = const VerificationMeta('platelet');
  @override
  late final GeneratedColumn<String> platelet = GeneratedColumn<String>(
      'platelet', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _astMeta = const VerificationMeta('ast');
  @override
  late final GeneratedColumn<String> ast = GeneratedColumn<String>(
      'ast', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _altMeta = const VerificationMeta('alt');
  @override
  late final GeneratedColumn<String> alt = GeneratedColumn<String>(
      'alt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _ggtMeta = const VerificationMeta('ggt');
  @override
  late final GeneratedColumn<String> ggt = GeneratedColumn<String>(
      'ggt', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _bilirubinMeta = const VerificationMeta('bilirubin');
  @override
  late final GeneratedColumn<String> bilirubin = GeneratedColumn<String>(
      'bilirubin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _albuminMeta = const VerificationMeta('albumin');
  @override
  late final GeneratedColumn<String> albumin = GeneratedColumn<String>(
      'albumin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _afpMeta = const VerificationMeta('afp');
  @override
  late final GeneratedColumn<String> afp = GeneratedColumn<String>(
      'afp', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _hbvDnaMeta = const VerificationMeta('hbvDna');
  @override
  late final GeneratedColumn<String> hbvDna = GeneratedColumn<String>(
      'hbv_dna', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _hcvRnaMeta = const VerificationMeta('hcvRna');
  @override
  late final GeneratedColumn<String> hcvRna = GeneratedColumn<String>(
      'hcv_rna', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _benignTumorMeta =
      const VerificationMeta('benignTumor');
  @override
  late final GeneratedColumn<String> benignTumor = GeneratedColumn<String>(
      'benign_tumor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _dangerousNoduleMeta =
      const VerificationMeta('dangerousNodule');
  @override
  late final GeneratedColumn<String> dangerousNodule = GeneratedColumn<String>(
      'dangerous_nodule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        id,
        createdAt,
        updatedAt,
        date,
        platelet,
        ast,
        alt,
        ggt,
        bilirubin,
        albumin,
        afp,
        hbvDna,
        hcvRna,
        benignTumor,
        dangerousNodule
      ];
  @override
  String get aliasedName => _alias ?? 'examination_results';
  @override
  String get actualTableName => 'examination_results';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExaminationResultModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('platelet')) {
      context.handle(_plateletMeta,
          platelet.isAcceptableOrUnknown(data['platelet']!, _plateletMeta));
    }
    if (data.containsKey('ast')) {
      context.handle(
          _astMeta, ast.isAcceptableOrUnknown(data['ast']!, _astMeta));
    }
    if (data.containsKey('alt')) {
      context.handle(
          _altMeta, alt.isAcceptableOrUnknown(data['alt']!, _altMeta));
    }
    if (data.containsKey('ggt')) {
      context.handle(
          _ggtMeta, ggt.isAcceptableOrUnknown(data['ggt']!, _ggtMeta));
    }
    if (data.containsKey('bilirubin')) {
      context.handle(_bilirubinMeta,
          bilirubin.isAcceptableOrUnknown(data['bilirubin']!, _bilirubinMeta));
    }
    if (data.containsKey('albumin')) {
      context.handle(_albuminMeta,
          albumin.isAcceptableOrUnknown(data['albumin']!, _albuminMeta));
    }
    if (data.containsKey('afp')) {
      context.handle(
          _afpMeta, afp.isAcceptableOrUnknown(data['afp']!, _afpMeta));
    }
    if (data.containsKey('hbv_dna')) {
      context.handle(_hbvDnaMeta,
          hbvDna.isAcceptableOrUnknown(data['hbv_dna']!, _hbvDnaMeta));
    }
    if (data.containsKey('hcv_rna')) {
      context.handle(_hcvRnaMeta,
          hcvRna.isAcceptableOrUnknown(data['hcv_rna']!, _hcvRnaMeta));
    }
    if (data.containsKey('benign_tumor')) {
      context.handle(
          _benignTumorMeta,
          benignTumor.isAcceptableOrUnknown(
              data['benign_tumor']!, _benignTumorMeta));
    }
    if (data.containsKey('dangerous_nodule')) {
      context.handle(
          _dangerousNoduleMeta,
          dangerousNodule.isAcceptableOrUnknown(
              data['dangerous_nodule']!, _dangerousNoduleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, date},
      ];
  @override
  ExaminationResultModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExaminationResultModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      platelet: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}platelet']),
      ast: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}ast']),
      alt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}alt']),
      ggt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}ggt']),
      bilirubin: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}bilirubin']),
      albumin: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}albumin']),
      afp: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}afp']),
      hbvDna: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hbv_dna']),
      hcvRna: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hcv_rna']),
      benignTumor: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}benign_tumor']),
      dangerousNodule: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}dangerous_nodule']),
    );
  }

  @override
  $ExaminationResultsTable createAlias(String alias) {
    return $ExaminationResultsTable(attachedDatabase, alias);
  }
}

class HealthQuestionModel extends DataClass
    implements Insertable<HealthQuestionModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String qusetion;
  final String? doctorName;
  final String? answer;
  const HealthQuestionModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.qusetion,
      this.doctorName,
      this.answer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['qusetion'] = Variable<String>(qusetion);
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String>(doctorName);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String>(answer);
    }
    return map;
  }

  HealthQuestionsCompanion toCompanion(bool nullToAbsent) {
    return HealthQuestionsCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      qusetion: Value(qusetion),
      doctorName: doctorName == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorName),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
    );
  }

  factory HealthQuestionModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthQuestionModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      qusetion: serializer.fromJson<String>(json['qusetion']),
      doctorName: serializer.fromJson<String?>(json['doctorName']),
      answer: serializer.fromJson<String?>(json['answer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'qusetion': serializer.toJson<String>(qusetion),
      'doctorName': serializer.toJson<String?>(doctorName),
      'answer': serializer.toJson<String?>(answer),
    };
  }

  HealthQuestionModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? qusetion,
          Value<String?> doctorName = const Value.absent(),
          Value<String?> answer = const Value.absent()}) =>
      HealthQuestionModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        qusetion: qusetion ?? this.qusetion,
        doctorName: doctorName.present ? doctorName.value : this.doctorName,
        answer: answer.present ? answer.value : this.answer,
      );
  @override
  String toString() {
    return (StringBuffer('HealthQuestionModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('qusetion: $qusetion, ')
          ..write('doctorName: $doctorName, ')
          ..write('answer: $answer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId, id, createdAt, updatedAt, qusetion, doctorName, answer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthQuestionModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.qusetion == this.qusetion &&
          other.doctorName == this.doctorName &&
          other.answer == this.answer);
}

class HealthQuestionsCompanion extends UpdateCompanion<HealthQuestionModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> qusetion;
  final Value<String?> doctorName;
  final Value<String?> answer;
  const HealthQuestionsCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.qusetion = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.answer = const Value.absent(),
  });
  HealthQuestionsCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String qusetion,
    this.doctorName = const Value.absent(),
    this.answer = const Value.absent(),
  })  : userId = Value(userId),
        qusetion = Value(qusetion);
  static Insertable<HealthQuestionModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? qusetion,
    Expression<String>? doctorName,
    Expression<String>? answer,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (qusetion != null) 'qusetion': qusetion,
      if (doctorName != null) 'doctor_name': doctorName,
      if (answer != null) 'answer': answer,
    });
  }

  HealthQuestionsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? qusetion,
      Value<String?>? doctorName,
      Value<String?>? answer}) {
    return HealthQuestionsCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      qusetion: qusetion ?? this.qusetion,
      doctorName: doctorName ?? this.doctorName,
      answer: answer ?? this.answer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (qusetion.present) {
      map['qusetion'] = Variable<String>(qusetion.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthQuestionsCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('qusetion: $qusetion, ')
          ..write('doctorName: $doctorName, ')
          ..write('answer: $answer')
          ..write(')'))
        .toString();
  }
}

class $HealthQuestionsTable extends HealthQuestions
    with TableInfo<$HealthQuestionsTable, HealthQuestionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthQuestionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _qusetionMeta = const VerificationMeta('qusetion');
  @override
  late final GeneratedColumn<String> qusetion = GeneratedColumn<String>(
      'qusetion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, qusetion, doctorName, answer];
  @override
  String get aliasedName => _alias ?? 'health_questions';
  @override
  String get actualTableName => 'health_questions';
  @override
  VerificationContext validateIntegrity(
      Insertable<HealthQuestionModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('qusetion')) {
      context.handle(_qusetionMeta,
          qusetion.isAcceptableOrUnknown(data['qusetion']!, _qusetionMeta));
    } else if (isInserting) {
      context.missing(_qusetionMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthQuestionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthQuestionModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      qusetion: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}qusetion'])!,
      doctorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name']),
      answer: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answer']),
    );
  }

  @override
  $HealthQuestionsTable createAlias(String alias) {
    return $HealthQuestionsTable(attachedDatabase, alias);
  }
}

class DrinkingHistoryModel extends DataClass
    implements Insertable<DrinkingHistoryModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final int amount;
  final DateTime date;
  const DrinkingHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.amount,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  DrinkingHistoriesCompanion toCompanion(bool nullToAbsent) {
    return DrinkingHistoriesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory DrinkingHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrinkingHistoryModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  DrinkingHistoryModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? amount,
          DateTime? date}) =>
      DrinkingHistoryModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('DrinkingHistoryModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, id, createdAt, updatedAt, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrinkingHistoryModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.amount == this.amount &&
          other.date == this.date);
}

class DrinkingHistoriesCompanion extends UpdateCompanion<DrinkingHistoryModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> amount;
  final Value<DateTime> date;
  const DrinkingHistoriesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  DrinkingHistoriesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required int amount,
    required DateTime date,
  })  : userId = Value(userId),
        amount = Value(amount),
        date = Value(date);
  static Insertable<DrinkingHistoryModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  DrinkingHistoriesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? amount,
      Value<DateTime>? date}) {
    return DrinkingHistoriesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrinkingHistoriesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $DrinkingHistoriesTable extends DrinkingHistories
    with TableInfo<$DrinkingHistoriesTable, DrinkingHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrinkingHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, amount, date];
  @override
  String get aliasedName => _alias ?? 'drinking_histories';
  @override
  String get actualTableName => 'drinking_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<DrinkingHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, date},
      ];
  @override
  DrinkingHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrinkingHistoryModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $DrinkingHistoriesTable createAlias(String alias) {
    return $DrinkingHistoriesTable(attachedDatabase, alias);
  }
}

class SmokingHistoryModel extends DataClass
    implements Insertable<SmokingHistoryModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final int amount;
  final DateTime date;
  const SmokingHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.amount,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  SmokingHistoriesCompanion toCompanion(bool nullToAbsent) {
    return SmokingHistoriesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory SmokingHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmokingHistoryModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  SmokingHistoryModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? amount,
          DateTime? date}) =>
      SmokingHistoryModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('SmokingHistoryModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, id, createdAt, updatedAt, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmokingHistoryModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.amount == this.amount &&
          other.date == this.date);
}

class SmokingHistoriesCompanion extends UpdateCompanion<SmokingHistoryModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> amount;
  final Value<DateTime> date;
  const SmokingHistoriesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  SmokingHistoriesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required int amount,
    required DateTime date,
  })  : userId = Value(userId),
        amount = Value(amount),
        date = Value(date);
  static Insertable<SmokingHistoryModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  SmokingHistoriesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? amount,
      Value<DateTime>? date}) {
    return SmokingHistoriesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmokingHistoriesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $SmokingHistoriesTable extends SmokingHistories
    with TableInfo<$SmokingHistoriesTable, SmokingHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmokingHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, amount, date];
  @override
  String get aliasedName => _alias ?? 'smoking_histories';
  @override
  String get actualTableName => 'smoking_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<SmokingHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, date},
      ];
  @override
  SmokingHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmokingHistoryModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $SmokingHistoriesTable createAlias(String alias) {
    return $SmokingHistoriesTable(attachedDatabase, alias);
  }
}

class ExcerciseHistoryModel extends DataClass
    implements Insertable<ExcerciseHistoryModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final DateTime date;

  /// 운동 시간 (분)
  final int minuite;

  ///  체중(g)
  final int weight;
  const ExcerciseHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.date,
      required this.minuite,
      required this.weight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['date'] = Variable<DateTime>(date);
    map['minuite'] = Variable<int>(minuite);
    map['weight'] = Variable<int>(weight);
    return map;
  }

  ExcerciseHistoriesCompanion toCompanion(bool nullToAbsent) {
    return ExcerciseHistoriesCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      date: Value(date),
      minuite: Value(minuite),
      weight: Value(weight),
    );
  }

  factory ExcerciseHistoryModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExcerciseHistoryModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      date: serializer.fromJson<DateTime>(json['date']),
      minuite: serializer.fromJson<int>(json['minuite']),
      weight: serializer.fromJson<int>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'date': serializer.toJson<DateTime>(date),
      'minuite': serializer.toJson<int>(minuite),
      'weight': serializer.toJson<int>(weight),
    };
  }

  ExcerciseHistoryModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? date,
          int? minuite,
          int? weight}) =>
      ExcerciseHistoryModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        date: date ?? this.date,
        minuite: minuite ?? this.minuite,
        weight: weight ?? this.weight,
      );
  @override
  String toString() {
    return (StringBuffer('ExcerciseHistoryModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('minuite: $minuite, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, id, createdAt, updatedAt, date, minuite, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExcerciseHistoryModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.date == this.date &&
          other.minuite == this.minuite &&
          other.weight == this.weight);
}

class ExcerciseHistoriesCompanion
    extends UpdateCompanion<ExcerciseHistoryModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> date;
  final Value<int> minuite;
  final Value<int> weight;
  const ExcerciseHistoriesCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.minuite = const Value.absent(),
    this.weight = const Value.absent(),
  });
  ExcerciseHistoriesCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime date,
    required int minuite,
    required int weight,
  })  : userId = Value(userId),
        date = Value(date),
        minuite = Value(minuite),
        weight = Value(weight);
  static Insertable<ExcerciseHistoryModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? date,
    Expression<int>? minuite,
    Expression<int>? weight,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (minuite != null) 'minuite': minuite,
      if (weight != null) 'weight': weight,
    });
  }

  ExcerciseHistoriesCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime>? date,
      Value<int>? minuite,
      Value<int>? weight}) {
    return ExcerciseHistoriesCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      minuite: minuite ?? this.minuite,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (minuite.present) {
      map['minuite'] = Variable<int>(minuite.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExcerciseHistoriesCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('minuite: $minuite, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $ExcerciseHistoriesTable extends ExcerciseHistories
    with TableInfo<$ExcerciseHistoriesTable, ExcerciseHistoryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExcerciseHistoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _minuiteMeta = const VerificationMeta('minuite');
  @override
  late final GeneratedColumn<int> minuite = GeneratedColumn<int>(
      'minuite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, date, minuite, weight];
  @override
  String get aliasedName => _alias ?? 'excercise_histories';
  @override
  String get actualTableName => 'excercise_histories';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExcerciseHistoryModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('minuite')) {
      context.handle(_minuiteMeta,
          minuite.isAcceptableOrUnknown(data['minuite']!, _minuiteMeta));
    } else if (isInserting) {
      context.missing(_minuiteMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, date},
      ];
  @override
  ExcerciseHistoryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExcerciseHistoryModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      minuite: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}minuite'])!,
      weight: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
    );
  }

  @override
  $ExcerciseHistoriesTable createAlias(String alias) {
    return $ExcerciseHistoriesTable(attachedDatabase, alias);
  }
}

class HospitalModel extends DataClass implements Insertable<HospitalModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String name;
  final String logo;
  const HospitalModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.logo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    map['logo'] = Variable<String>(logo);
    return map;
  }

  HospitalsCompanion toCompanion(bool nullToAbsent) {
    return HospitalsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      logo: Value(logo),
    );
  }

  factory HospitalModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HospitalModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      logo: serializer.fromJson<String>(json['logo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'logo': serializer.toJson<String>(logo),
    };
  }

  HospitalModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? name,
          String? logo}) =>
      HospitalModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        logo: logo ?? this.logo,
      );
  @override
  String toString() {
    return (StringBuffer('HospitalModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('logo: $logo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, name, logo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HospitalModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.logo == this.logo);
}

class HospitalsCompanion extends UpdateCompanion<HospitalModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<String> logo;
  const HospitalsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.logo = const Value.absent(),
  });
  HospitalsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String logo,
  })  : name = Value(name),
        logo = Value(logo);
  static Insertable<HospitalModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? logo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (logo != null) 'logo': logo,
    });
  }

  HospitalsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? name,
      Value<String>? logo}) {
    return HospitalsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('logo: $logo')
          ..write(')'))
        .toString();
  }
}

class $HospitalsTable extends Hospitals
    with TableInfo<$HospitalsTable, HospitalModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HospitalsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
      'logo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, name, logo];
  @override
  String get aliasedName => _alias ?? 'hospitals';
  @override
  String get actualTableName => 'hospitals';
  @override
  VerificationContext validateIntegrity(Insertable<HospitalModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    } else if (isInserting) {
      context.missing(_logoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
        {logo},
      ];
  @override
  HospitalModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HospitalModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      logo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}logo'])!,
    );
  }

  @override
  $HospitalsTable createAlias(String alias) {
    return $HospitalsTable(attachedDatabase, alias);
  }
}

class MedicationAdherenceSurveyAnswerModel extends DataClass
    implements Insertable<MedicationAdherenceSurveyAnswerModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String medicationAdherenceSurveyHistoryId;
  final int questionId;
  final String answers;
  const MedicationAdherenceSurveyAnswerModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.medicationAdherenceSurveyHistoryId,
      required this.questionId,
      required this.answers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['medication_adherence_survey_history_id'] =
        Variable<String>(medicationAdherenceSurveyHistoryId);
    map['question_id'] = Variable<int>(questionId);
    map['answers'] = Variable<String>(answers);
    return map;
  }

  MedicationAdherenceSurveyAnswersCompanion toCompanion(bool nullToAbsent) {
    return MedicationAdherenceSurveyAnswersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      medicationAdherenceSurveyHistoryId:
          Value(medicationAdherenceSurveyHistoryId),
      questionId: Value(questionId),
      answers: Value(answers),
    );
  }

  factory MedicationAdherenceSurveyAnswerModel.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationAdherenceSurveyAnswerModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      medicationAdherenceSurveyHistoryId: serializer
          .fromJson<String>(json['medicationAdherenceSurveyHistoryId']),
      questionId: serializer.fromJson<int>(json['questionId']),
      answers: serializer.fromJson<String>(json['answers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'medicationAdherenceSurveyHistoryId':
          serializer.toJson<String>(medicationAdherenceSurveyHistoryId),
      'questionId': serializer.toJson<int>(questionId),
      'answers': serializer.toJson<String>(answers),
    };
  }

  MedicationAdherenceSurveyAnswerModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? medicationAdherenceSurveyHistoryId,
          int? questionId,
          String? answers}) =>
      MedicationAdherenceSurveyAnswerModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        medicationAdherenceSurveyHistoryId:
            medicationAdherenceSurveyHistoryId ??
                this.medicationAdherenceSurveyHistoryId,
        questionId: questionId ?? this.questionId,
        answers: answers ?? this.answers,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationAdherenceSurveyAnswerModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write(
              'medicationAdherenceSurveyHistoryId: $medicationAdherenceSurveyHistoryId, ')
          ..write('questionId: $questionId, ')
          ..write('answers: $answers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt,
      medicationAdherenceSurveyHistoryId, questionId, answers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationAdherenceSurveyAnswerModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.medicationAdherenceSurveyHistoryId ==
              this.medicationAdherenceSurveyHistoryId &&
          other.questionId == this.questionId &&
          other.answers == this.answers);
}

class MedicationAdherenceSurveyAnswersCompanion
    extends UpdateCompanion<MedicationAdherenceSurveyAnswerModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> medicationAdherenceSurveyHistoryId;
  final Value<int> questionId;
  final Value<String> answers;
  const MedicationAdherenceSurveyAnswersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.medicationAdherenceSurveyHistoryId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.answers = const Value.absent(),
  });
  MedicationAdherenceSurveyAnswersCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String medicationAdherenceSurveyHistoryId,
    required int questionId,
    required String answers,
  })  : medicationAdherenceSurveyHistoryId =
            Value(medicationAdherenceSurveyHistoryId),
        questionId = Value(questionId),
        answers = Value(answers);
  static Insertable<MedicationAdherenceSurveyAnswerModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? medicationAdherenceSurveyHistoryId,
    Expression<int>? questionId,
    Expression<String>? answers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (medicationAdherenceSurveyHistoryId != null)
        'medication_adherence_survey_history_id':
            medicationAdherenceSurveyHistoryId,
      if (questionId != null) 'question_id': questionId,
      if (answers != null) 'answers': answers,
    });
  }

  MedicationAdherenceSurveyAnswersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? medicationAdherenceSurveyHistoryId,
      Value<int>? questionId,
      Value<String>? answers}) {
    return MedicationAdherenceSurveyAnswersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      medicationAdherenceSurveyHistoryId: medicationAdherenceSurveyHistoryId ??
          this.medicationAdherenceSurveyHistoryId,
      questionId: questionId ?? this.questionId,
      answers: answers ?? this.answers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (medicationAdherenceSurveyHistoryId.present) {
      map['medication_adherence_survey_history_id'] =
          Variable<String>(medicationAdherenceSurveyHistoryId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (answers.present) {
      map['answers'] = Variable<String>(answers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationAdherenceSurveyAnswersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write(
              'medicationAdherenceSurveyHistoryId: $medicationAdherenceSurveyHistoryId, ')
          ..write('questionId: $questionId, ')
          ..write('answers: $answers')
          ..write(')'))
        .toString();
  }
}

class $MedicationAdherenceSurveyAnswersTable
    extends MedicationAdherenceSurveyAnswers
    with
        TableInfo<$MedicationAdherenceSurveyAnswersTable,
            MedicationAdherenceSurveyAnswerModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationAdherenceSurveyAnswersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _medicationAdherenceSurveyHistoryIdMeta =
      const VerificationMeta('medicationAdherenceSurveyHistoryId');
  @override
  late final GeneratedColumn<String> medicationAdherenceSurveyHistoryId =
      GeneratedColumn<String>(
          'medication_adherence_survey_history_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints:
              'REFERENCES medication_adherence_survey_histories (id)');
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _answersMeta = const VerificationMeta('answers');
  @override
  late final GeneratedColumn<String> answers = GeneratedColumn<String>(
      'answers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        medicationAdherenceSurveyHistoryId,
        questionId,
        answers
      ];
  @override
  String get aliasedName => _alias ?? 'medication_adherence_survey_answers';
  @override
  String get actualTableName => 'medication_adherence_survey_answers';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationAdherenceSurveyAnswerModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('medication_adherence_survey_history_id')) {
      context.handle(
          _medicationAdherenceSurveyHistoryIdMeta,
          medicationAdherenceSurveyHistoryId.isAcceptableOrUnknown(
              data['medication_adherence_survey_history_id']!,
              _medicationAdherenceSurveyHistoryIdMeta));
    } else if (isInserting) {
      context.missing(_medicationAdherenceSurveyHistoryIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('answers')) {
      context.handle(_answersMeta,
          answers.isAcceptableOrUnknown(data['answers']!, _answersMeta));
    } else if (isInserting) {
      context.missing(_answersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {medicationAdherenceSurveyHistoryId, questionId},
      ];
  @override
  MedicationAdherenceSurveyAnswerModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationAdherenceSurveyAnswerModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      medicationAdherenceSurveyHistoryId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}medication_adherence_survey_history_id'])!,
      questionId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      answers: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answers'])!,
    );
  }

  @override
  $MedicationAdherenceSurveyAnswersTable createAlias(String alias) {
    return $MedicationAdherenceSurveyAnswersTable(attachedDatabase, alias);
  }
}

class UserPointModel extends DataClass implements Insertable<UserPointModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final int point;
  final String? hospitalVisitScheduleId;
  const UserPointModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.point,
      this.hospitalVisitScheduleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['point'] = Variable<int>(point);
    if (!nullToAbsent || hospitalVisitScheduleId != null) {
      map['hospital_visit_schedule_id'] =
          Variable<String>(hospitalVisitScheduleId);
    }
    return map;
  }

  UserPointsCompanion toCompanion(bool nullToAbsent) {
    return UserPointsCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      point: Value(point),
      hospitalVisitScheduleId: hospitalVisitScheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalVisitScheduleId),
    );
  }

  factory UserPointModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPointModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      point: serializer.fromJson<int>(json['point']),
      hospitalVisitScheduleId:
          serializer.fromJson<String?>(json['hospitalVisitScheduleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'point': serializer.toJson<int>(point),
      'hospitalVisitScheduleId':
          serializer.toJson<String?>(hospitalVisitScheduleId),
    };
  }

  UserPointModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? point,
          Value<String?> hospitalVisitScheduleId = const Value.absent()}) =>
      UserPointModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        point: point ?? this.point,
        hospitalVisitScheduleId: hospitalVisitScheduleId.present
            ? hospitalVisitScheduleId.value
            : this.hospitalVisitScheduleId,
      );
  @override
  String toString() {
    return (StringBuffer('UserPointModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('point: $point, ')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId, id, createdAt, updatedAt, point, hospitalVisitScheduleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPointModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.point == this.point &&
          other.hospitalVisitScheduleId == this.hospitalVisitScheduleId);
}

class UserPointsCompanion extends UpdateCompanion<UserPointModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> point;
  final Value<String?> hospitalVisitScheduleId;
  const UserPointsCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.point = const Value.absent(),
    this.hospitalVisitScheduleId = const Value.absent(),
  });
  UserPointsCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.point = const Value.absent(),
    this.hospitalVisitScheduleId = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UserPointModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? point,
    Expression<String>? hospitalVisitScheduleId,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (point != null) 'point': point,
      if (hospitalVisitScheduleId != null)
        'hospital_visit_schedule_id': hospitalVisitScheduleId,
    });
  }

  UserPointsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? point,
      Value<String?>? hospitalVisitScheduleId}) {
    return UserPointsCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      point: point ?? this.point,
      hospitalVisitScheduleId:
          hospitalVisitScheduleId ?? this.hospitalVisitScheduleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    if (hospitalVisitScheduleId.present) {
      map['hospital_visit_schedule_id'] =
          Variable<String>(hospitalVisitScheduleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPointsCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('point: $point, ')
          ..write('hospitalVisitScheduleId: $hospitalVisitScheduleId')
          ..write(')'))
        .toString();
  }
}

class $UserPointsTable extends UserPoints
    with TableInfo<$UserPointsTable, UserPointModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPointsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
      'point', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _hospitalVisitScheduleIdMeta =
      const VerificationMeta('hospitalVisitScheduleId');
  @override
  late final GeneratedColumn<String> hospitalVisitScheduleId =
      GeneratedColumn<String>('hospital_visit_schedule_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: 'REFERENCES hospital_visit_schedules (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [userId, id, createdAt, updatedAt, point, hospitalVisitScheduleId];
  @override
  String get aliasedName => _alias ?? 'user_points';
  @override
  String get actualTableName => 'user_points';
  @override
  VerificationContext validateIntegrity(Insertable<UserPointModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
    }
    if (data.containsKey('hospital_visit_schedule_id')) {
      context.handle(
          _hospitalVisitScheduleIdMeta,
          hospitalVisitScheduleId.isAcceptableOrUnknown(
              data['hospital_visit_schedule_id']!,
              _hospitalVisitScheduleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId},
        {hospitalVisitScheduleId},
      ];
  @override
  UserPointModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPointModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      point: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}point'])!,
      hospitalVisitScheduleId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}hospital_visit_schedule_id']),
    );
  }

  @override
  $UserPointsTable createAlias(String alias) {
    return $UserPointsTable(attachedDatabase, alias);
  }
}

class PrescriptionModel extends DataClass
    implements Insertable<PrescriptionModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  /// 의사 이름
  final String doctorName;

  /// 처방일
  final DateTime prescriptedAt;

  /// 복약 시작일
  final DateTime medicationStartAt;

  /// 복약 기간
  final int duration;

  /// 삭제일
  final DateTime? deletedAt;
  const PrescriptionModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.doctorName,
      required this.prescriptedAt,
      required this.medicationStartAt,
      required this.duration,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['doctor_name'] = Variable<String>(doctorName);
    map['prescripted_at'] = Variable<DateTime>(prescriptedAt);
    map['medication_start_at'] = Variable<DateTime>(medicationStartAt);
    map['duration'] = Variable<int>(duration);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  PrescriptionsCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionsCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      doctorName: Value(doctorName),
      prescriptedAt: Value(prescriptedAt),
      medicationStartAt: Value(medicationStartAt),
      duration: Value(duration),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory PrescriptionModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrescriptionModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      prescriptedAt: serializer.fromJson<DateTime>(json['prescriptedAt']),
      medicationStartAt:
          serializer.fromJson<DateTime>(json['medicationStartAt']),
      duration: serializer.fromJson<int>(json['duration']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'doctorName': serializer.toJson<String>(doctorName),
      'prescriptedAt': serializer.toJson<DateTime>(prescriptedAt),
      'medicationStartAt': serializer.toJson<DateTime>(medicationStartAt),
      'duration': serializer.toJson<int>(duration),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  PrescriptionModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? doctorName,
          DateTime? prescriptedAt,
          DateTime? medicationStartAt,
          int? duration,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      PrescriptionModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        doctorName: doctorName ?? this.doctorName,
        prescriptedAt: prescriptedAt ?? this.prescriptedAt,
        medicationStartAt: medicationStartAt ?? this.medicationStartAt,
        duration: duration ?? this.duration,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('PrescriptionModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('prescriptedAt: $prescriptedAt, ')
          ..write('medicationStartAt: $medicationStartAt, ')
          ..write('duration: $duration, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, id, createdAt, updatedAt, doctorName,
      prescriptedAt, medicationStartAt, duration, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.doctorName == this.doctorName &&
          other.prescriptedAt == this.prescriptedAt &&
          other.medicationStartAt == this.medicationStartAt &&
          other.duration == this.duration &&
          other.deletedAt == this.deletedAt);
}

class PrescriptionsCompanion extends UpdateCompanion<PrescriptionModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> doctorName;
  final Value<DateTime> prescriptedAt;
  final Value<DateTime> medicationStartAt;
  final Value<int> duration;
  final Value<DateTime?> deletedAt;
  const PrescriptionsCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.prescriptedAt = const Value.absent(),
    this.medicationStartAt = const Value.absent(),
    this.duration = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  PrescriptionsCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.doctorName = const Value.absent(),
    required DateTime prescriptedAt,
    required DateTime medicationStartAt,
    required int duration,
    this.deletedAt = const Value.absent(),
  })  : userId = Value(userId),
        prescriptedAt = Value(prescriptedAt),
        medicationStartAt = Value(medicationStartAt),
        duration = Value(duration);
  static Insertable<PrescriptionModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? doctorName,
    Expression<DateTime>? prescriptedAt,
    Expression<DateTime>? medicationStartAt,
    Expression<int>? duration,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (doctorName != null) 'doctor_name': doctorName,
      if (prescriptedAt != null) 'prescripted_at': prescriptedAt,
      if (medicationStartAt != null) 'medication_start_at': medicationStartAt,
      if (duration != null) 'duration': duration,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  PrescriptionsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? doctorName,
      Value<DateTime>? prescriptedAt,
      Value<DateTime>? medicationStartAt,
      Value<int>? duration,
      Value<DateTime?>? deletedAt}) {
    return PrescriptionsCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      doctorName: doctorName ?? this.doctorName,
      prescriptedAt: prescriptedAt ?? this.prescriptedAt,
      medicationStartAt: medicationStartAt ?? this.medicationStartAt,
      duration: duration ?? this.duration,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (prescriptedAt.present) {
      map['prescripted_at'] = Variable<DateTime>(prescriptedAt.value);
    }
    if (medicationStartAt.present) {
      map['medication_start_at'] = Variable<DateTime>(medicationStartAt.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionsCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('prescriptedAt: $prescriptedAt, ')
          ..write('medicationStartAt: $medicationStartAt, ')
          ..write('duration: $duration, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $PrescriptionsTable extends Prescriptions
    with TableInfo<$PrescriptionsTable, PrescriptionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescriptionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
      'doctor_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _prescriptedAtMeta =
      const VerificationMeta('prescriptedAt');
  @override
  late final GeneratedColumn<DateTime> prescriptedAt =
      GeneratedColumn<DateTime>('prescripted_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _medicationStartAtMeta =
      const VerificationMeta('medicationStartAt');
  @override
  late final GeneratedColumn<DateTime> medicationStartAt =
      GeneratedColumn<DateTime>('medication_start_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      check: () => duration.isBiggerOrEqual(const Constant(0)),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        id,
        createdAt,
        updatedAt,
        doctorName,
        prescriptedAt,
        medicationStartAt,
        duration,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 'prescriptions';
  @override
  String get actualTableName => 'prescriptions';
  @override
  VerificationContext validateIntegrity(Insertable<PrescriptionModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    }
    if (data.containsKey('prescripted_at')) {
      context.handle(
          _prescriptedAtMeta,
          prescriptedAt.isAcceptableOrUnknown(
              data['prescripted_at']!, _prescriptedAtMeta));
    } else if (isInserting) {
      context.missing(_prescriptedAtMeta);
    }
    if (data.containsKey('medication_start_at')) {
      context.handle(
          _medicationStartAtMeta,
          medicationStartAt.isAcceptableOrUnknown(
              data['medication_start_at']!, _medicationStartAtMeta));
    } else if (isInserting) {
      context.missing(_medicationStartAtMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrescriptionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrescriptionModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      doctorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_name'])!,
      prescriptedAt: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}prescripted_at'])!,
      medicationStartAt: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}medication_start_at'])!,
      duration: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $PrescriptionsTable createAlias(String alias) {
    return $PrescriptionsTable(attachedDatabase, alias);
  }
}

class MedicationInformationModel extends DataClass
    implements Insertable<MedicationInformationModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String prescriptionId;

  /// 약 ID
  final String pillId;

  /// 첫번째 복용 시간
  final int? timeOne;

  /// 두번째 복용 시간
  final int? timeTwo;

  /// 세번째 복용 시간
  final int? timeThree;

  /// 복용량
  final String takeCount;

  /// 복용주기
  final int takeCycle;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;
  const MedicationInformationModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.prescriptionId,
      required this.pillId,
      this.timeOne,
      this.timeTwo,
      this.timeThree,
      required this.takeCount,
      required this.takeCycle,
      required this.beforePush,
      required this.afterPush});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['prescription_id'] = Variable<String>(prescriptionId);
    map['pill_id'] = Variable<String>(pillId);
    if (!nullToAbsent || timeOne != null) {
      map['time_one'] = Variable<int>(timeOne);
    }
    if (!nullToAbsent || timeTwo != null) {
      map['time_two'] = Variable<int>(timeTwo);
    }
    if (!nullToAbsent || timeThree != null) {
      map['time_three'] = Variable<int>(timeThree);
    }
    map['take_count'] = Variable<String>(takeCount);
    map['take_cycle'] = Variable<int>(takeCycle);
    map['before_push'] = Variable<bool>(beforePush);
    map['after_push'] = Variable<bool>(afterPush);
    return map;
  }

  MedicationInformationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationInformationsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      prescriptionId: Value(prescriptionId),
      pillId: Value(pillId),
      timeOne: timeOne == null && nullToAbsent
          ? const Value.absent()
          : Value(timeOne),
      timeTwo: timeTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(timeTwo),
      timeThree: timeThree == null && nullToAbsent
          ? const Value.absent()
          : Value(timeThree),
      takeCount: Value(takeCount),
      takeCycle: Value(takeCycle),
      beforePush: Value(beforePush),
      afterPush: Value(afterPush),
    );
  }

  factory MedicationInformationModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationInformationModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      prescriptionId: serializer.fromJson<String>(json['prescriptionId']),
      pillId: serializer.fromJson<String>(json['pillId']),
      timeOne: serializer.fromJson<int?>(json['timeOne']),
      timeTwo: serializer.fromJson<int?>(json['timeTwo']),
      timeThree: serializer.fromJson<int?>(json['timeThree']),
      takeCount: serializer.fromJson<String>(json['takeCount']),
      takeCycle: serializer.fromJson<int>(json['takeCycle']),
      beforePush: serializer.fromJson<bool>(json['beforePush']),
      afterPush: serializer.fromJson<bool>(json['afterPush']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'prescriptionId': serializer.toJson<String>(prescriptionId),
      'pillId': serializer.toJson<String>(pillId),
      'timeOne': serializer.toJson<int?>(timeOne),
      'timeTwo': serializer.toJson<int?>(timeTwo),
      'timeThree': serializer.toJson<int?>(timeThree),
      'takeCount': serializer.toJson<String>(takeCount),
      'takeCycle': serializer.toJson<int>(takeCycle),
      'beforePush': serializer.toJson<bool>(beforePush),
      'afterPush': serializer.toJson<bool>(afterPush),
    };
  }

  MedicationInformationModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? prescriptionId,
          String? pillId,
          Value<int?> timeOne = const Value.absent(),
          Value<int?> timeTwo = const Value.absent(),
          Value<int?> timeThree = const Value.absent(),
          String? takeCount,
          int? takeCycle,
          bool? beforePush,
          bool? afterPush}) =>
      MedicationInformationModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        prescriptionId: prescriptionId ?? this.prescriptionId,
        pillId: pillId ?? this.pillId,
        timeOne: timeOne.present ? timeOne.value : this.timeOne,
        timeTwo: timeTwo.present ? timeTwo.value : this.timeTwo,
        timeThree: timeThree.present ? timeThree.value : this.timeThree,
        takeCount: takeCount ?? this.takeCount,
        takeCycle: takeCycle ?? this.takeCycle,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationInformationModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('pillId: $pillId, ')
          ..write('timeOne: $timeOne, ')
          ..write('timeTwo: $timeTwo, ')
          ..write('timeThree: $timeThree, ')
          ..write('takeCount: $takeCount, ')
          ..write('takeCycle: $takeCycle, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      prescriptionId,
      pillId,
      timeOne,
      timeTwo,
      timeThree,
      takeCount,
      takeCycle,
      beforePush,
      afterPush);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationInformationModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.prescriptionId == this.prescriptionId &&
          other.pillId == this.pillId &&
          other.timeOne == this.timeOne &&
          other.timeTwo == this.timeTwo &&
          other.timeThree == this.timeThree &&
          other.takeCount == this.takeCount &&
          other.takeCycle == this.takeCycle &&
          other.beforePush == this.beforePush &&
          other.afterPush == this.afterPush);
}

class MedicationInformationsCompanion
    extends UpdateCompanion<MedicationInformationModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> prescriptionId;
  final Value<String> pillId;
  final Value<int?> timeOne;
  final Value<int?> timeTwo;
  final Value<int?> timeThree;
  final Value<String> takeCount;
  final Value<int> takeCycle;
  final Value<bool> beforePush;
  final Value<bool> afterPush;
  const MedicationInformationsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.prescriptionId = const Value.absent(),
    this.pillId = const Value.absent(),
    this.timeOne = const Value.absent(),
    this.timeTwo = const Value.absent(),
    this.timeThree = const Value.absent(),
    this.takeCount = const Value.absent(),
    this.takeCycle = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  });
  MedicationInformationsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String prescriptionId,
    required String pillId,
    this.timeOne = const Value.absent(),
    this.timeTwo = const Value.absent(),
    this.timeThree = const Value.absent(),
    required String takeCount,
    required int takeCycle,
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  })  : prescriptionId = Value(prescriptionId),
        pillId = Value(pillId),
        takeCount = Value(takeCount),
        takeCycle = Value(takeCycle);
  static Insertable<MedicationInformationModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? prescriptionId,
    Expression<String>? pillId,
    Expression<int>? timeOne,
    Expression<int>? timeTwo,
    Expression<int>? timeThree,
    Expression<String>? takeCount,
    Expression<int>? takeCycle,
    Expression<bool>? beforePush,
    Expression<bool>? afterPush,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (prescriptionId != null) 'prescription_id': prescriptionId,
      if (pillId != null) 'pill_id': pillId,
      if (timeOne != null) 'time_one': timeOne,
      if (timeTwo != null) 'time_two': timeTwo,
      if (timeThree != null) 'time_three': timeThree,
      if (takeCount != null) 'take_count': takeCount,
      if (takeCycle != null) 'take_cycle': takeCycle,
      if (beforePush != null) 'before_push': beforePush,
      if (afterPush != null) 'after_push': afterPush,
    });
  }

  MedicationInformationsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? prescriptionId,
      Value<String>? pillId,
      Value<int?>? timeOne,
      Value<int?>? timeTwo,
      Value<int?>? timeThree,
      Value<String>? takeCount,
      Value<int>? takeCycle,
      Value<bool>? beforePush,
      Value<bool>? afterPush}) {
    return MedicationInformationsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prescriptionId: prescriptionId ?? this.prescriptionId,
      pillId: pillId ?? this.pillId,
      timeOne: timeOne ?? this.timeOne,
      timeTwo: timeTwo ?? this.timeTwo,
      timeThree: timeThree ?? this.timeThree,
      takeCount: takeCount ?? this.takeCount,
      takeCycle: takeCycle ?? this.takeCycle,
      beforePush: beforePush ?? this.beforePush,
      afterPush: afterPush ?? this.afterPush,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (prescriptionId.present) {
      map['prescription_id'] = Variable<String>(prescriptionId.value);
    }
    if (pillId.present) {
      map['pill_id'] = Variable<String>(pillId.value);
    }
    if (timeOne.present) {
      map['time_one'] = Variable<int>(timeOne.value);
    }
    if (timeTwo.present) {
      map['time_two'] = Variable<int>(timeTwo.value);
    }
    if (timeThree.present) {
      map['time_three'] = Variable<int>(timeThree.value);
    }
    if (takeCount.present) {
      map['take_count'] = Variable<String>(takeCount.value);
    }
    if (takeCycle.present) {
      map['take_cycle'] = Variable<int>(takeCycle.value);
    }
    if (beforePush.present) {
      map['before_push'] = Variable<bool>(beforePush.value);
    }
    if (afterPush.present) {
      map['after_push'] = Variable<bool>(afterPush.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationInformationsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('pillId: $pillId, ')
          ..write('timeOne: $timeOne, ')
          ..write('timeTwo: $timeTwo, ')
          ..write('timeThree: $timeThree, ')
          ..write('takeCount: $takeCount, ')
          ..write('takeCycle: $takeCycle, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }
}

class $MedicationInformationsTable extends MedicationInformations
    with TableInfo<$MedicationInformationsTable, MedicationInformationModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationInformationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _prescriptionIdMeta =
      const VerificationMeta('prescriptionId');
  @override
  late final GeneratedColumn<String> prescriptionId = GeneratedColumn<String>(
      'prescription_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES prescriptions (id)');
  final VerificationMeta _pillIdMeta = const VerificationMeta('pillId');
  @override
  late final GeneratedColumn<String> pillId = GeneratedColumn<String>(
      'pill_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES pills (id)');
  final VerificationMeta _timeOneMeta = const VerificationMeta('timeOne');
  @override
  late final GeneratedColumn<int> timeOne = GeneratedColumn<int>(
      'time_one', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _timeTwoMeta = const VerificationMeta('timeTwo');
  @override
  late final GeneratedColumn<int> timeTwo = GeneratedColumn<int>(
      'time_two', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _timeThreeMeta = const VerificationMeta('timeThree');
  @override
  late final GeneratedColumn<int> timeThree = GeneratedColumn<int>(
      'time_three', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _takeCountMeta = const VerificationMeta('takeCount');
  @override
  late final GeneratedColumn<String> takeCount = GeneratedColumn<String>(
      'take_count', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _takeCycleMeta = const VerificationMeta('takeCycle');
  @override
  late final GeneratedColumn<int> takeCycle = GeneratedColumn<int>(
      'take_cycle', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _beforePushMeta = const VerificationMeta('beforePush');
  @override
  late final GeneratedColumn<bool> beforePush = GeneratedColumn<bool>(
      'before_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (before_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _afterPushMeta = const VerificationMeta('afterPush');
  @override
  late final GeneratedColumn<bool> afterPush = GeneratedColumn<bool>(
      'after_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (after_push IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        prescriptionId,
        pillId,
        timeOne,
        timeTwo,
        timeThree,
        takeCount,
        takeCycle,
        beforePush,
        afterPush
      ];
  @override
  String get aliasedName => _alias ?? 'medication_informations';
  @override
  String get actualTableName => 'medication_informations';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationInformationModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('prescription_id')) {
      context.handle(
          _prescriptionIdMeta,
          prescriptionId.isAcceptableOrUnknown(
              data['prescription_id']!, _prescriptionIdMeta));
    } else if (isInserting) {
      context.missing(_prescriptionIdMeta);
    }
    if (data.containsKey('pill_id')) {
      context.handle(_pillIdMeta,
          pillId.isAcceptableOrUnknown(data['pill_id']!, _pillIdMeta));
    } else if (isInserting) {
      context.missing(_pillIdMeta);
    }
    if (data.containsKey('time_one')) {
      context.handle(_timeOneMeta,
          timeOne.isAcceptableOrUnknown(data['time_one']!, _timeOneMeta));
    }
    if (data.containsKey('time_two')) {
      context.handle(_timeTwoMeta,
          timeTwo.isAcceptableOrUnknown(data['time_two']!, _timeTwoMeta));
    }
    if (data.containsKey('time_three')) {
      context.handle(_timeThreeMeta,
          timeThree.isAcceptableOrUnknown(data['time_three']!, _timeThreeMeta));
    }
    if (data.containsKey('take_count')) {
      context.handle(_takeCountMeta,
          takeCount.isAcceptableOrUnknown(data['take_count']!, _takeCountMeta));
    } else if (isInserting) {
      context.missing(_takeCountMeta);
    }
    if (data.containsKey('take_cycle')) {
      context.handle(_takeCycleMeta,
          takeCycle.isAcceptableOrUnknown(data['take_cycle']!, _takeCycleMeta));
    } else if (isInserting) {
      context.missing(_takeCycleMeta);
    }
    if (data.containsKey('before_push')) {
      context.handle(
          _beforePushMeta,
          beforePush.isAcceptableOrUnknown(
              data['before_push']!, _beforePushMeta));
    }
    if (data.containsKey('after_push')) {
      context.handle(_afterPushMeta,
          afterPush.isAcceptableOrUnknown(data['after_push']!, _afterPushMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {prescriptionId, pillId},
      ];
  @override
  MedicationInformationModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationInformationModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      prescriptionId: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}prescription_id'])!,
      pillId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}pill_id'])!,
      timeOne: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}time_one']),
      timeTwo: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}time_two']),
      timeThree: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}time_three']),
      takeCount: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}take_count'])!,
      takeCycle: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}take_cycle'])!,
      beforePush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}before_push'])!,
      afterPush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}after_push'])!,
    );
  }

  @override
  $MedicationInformationsTable createAlias(String alias) {
    return $MedicationInformationsTable(attachedDatabase, alias);
  }
}

class MedicationScheduleModel extends DataClass
    implements Insertable<MedicationScheduleModel> {
  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  final String medicationInformationId;

  /// 복용 예정일
  final DateTime reservedAt;

  /// 실제 복용일
  final DateTime? medicatedAt;

  /// 30분 전 알림
  final bool beforePush;

  /// 30분 후 알림
  final bool afterPush;
  const MedicationScheduleModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.medicationInformationId,
      required this.reservedAt,
      this.medicatedAt,
      required this.beforePush,
      required this.afterPush});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['medication_information_id'] =
        Variable<String>(medicationInformationId);
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    if (!nullToAbsent || medicatedAt != null) {
      map['medicated_at'] = Variable<DateTime>(medicatedAt);
    }
    map['before_push'] = Variable<bool>(beforePush);
    map['after_push'] = Variable<bool>(afterPush);
    return map;
  }

  MedicationSchedulesCompanion toCompanion(bool nullToAbsent) {
    return MedicationSchedulesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      medicationInformationId: Value(medicationInformationId),
      reservedAt: Value(reservedAt),
      medicatedAt: medicatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(medicatedAt),
      beforePush: Value(beforePush),
      afterPush: Value(afterPush),
    );
  }

  factory MedicationScheduleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationScheduleModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      medicationInformationId:
          serializer.fromJson<String>(json['medicationInformationId']),
      reservedAt: serializer.fromJson<DateTime>(json['reservedAt']),
      medicatedAt: serializer.fromJson<DateTime?>(json['medicatedAt']),
      beforePush: serializer.fromJson<bool>(json['beforePush']),
      afterPush: serializer.fromJson<bool>(json['afterPush']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'medicationInformationId':
          serializer.toJson<String>(medicationInformationId),
      'reservedAt': serializer.toJson<DateTime>(reservedAt),
      'medicatedAt': serializer.toJson<DateTime?>(medicatedAt),
      'beforePush': serializer.toJson<bool>(beforePush),
      'afterPush': serializer.toJson<bool>(afterPush),
    };
  }

  MedicationScheduleModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? medicationInformationId,
          DateTime? reservedAt,
          Value<DateTime?> medicatedAt = const Value.absent(),
          bool? beforePush,
          bool? afterPush}) =>
      MedicationScheduleModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        medicationInformationId:
            medicationInformationId ?? this.medicationInformationId,
        reservedAt: reservedAt ?? this.reservedAt,
        medicatedAt: medicatedAt.present ? medicatedAt.value : this.medicatedAt,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationScheduleModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('medicationInformationId: $medicationInformationId, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('medicatedAt: $medicatedAt, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt,
      medicationInformationId, reservedAt, medicatedAt, beforePush, afterPush);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationScheduleModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.medicationInformationId == this.medicationInformationId &&
          other.reservedAt == this.reservedAt &&
          other.medicatedAt == this.medicatedAt &&
          other.beforePush == this.beforePush &&
          other.afterPush == this.afterPush);
}

class MedicationSchedulesCompanion
    extends UpdateCompanion<MedicationScheduleModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> medicationInformationId;
  final Value<DateTime> reservedAt;
  final Value<DateTime?> medicatedAt;
  final Value<bool> beforePush;
  final Value<bool> afterPush;
  const MedicationSchedulesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.medicationInformationId = const Value.absent(),
    this.reservedAt = const Value.absent(),
    this.medicatedAt = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  });
  MedicationSchedulesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String medicationInformationId,
    required DateTime reservedAt,
    this.medicatedAt = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  })  : medicationInformationId = Value(medicationInformationId),
        reservedAt = Value(reservedAt);
  static Insertable<MedicationScheduleModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? medicationInformationId,
    Expression<DateTime>? reservedAt,
    Expression<DateTime>? medicatedAt,
    Expression<bool>? beforePush,
    Expression<bool>? afterPush,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (medicationInformationId != null)
        'medication_information_id': medicationInformationId,
      if (reservedAt != null) 'reserved_at': reservedAt,
      if (medicatedAt != null) 'medicated_at': medicatedAt,
      if (beforePush != null) 'before_push': beforePush,
      if (afterPush != null) 'after_push': afterPush,
    });
  }

  MedicationSchedulesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? medicationInformationId,
      Value<DateTime>? reservedAt,
      Value<DateTime?>? medicatedAt,
      Value<bool>? beforePush,
      Value<bool>? afterPush}) {
    return MedicationSchedulesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      medicationInformationId:
          medicationInformationId ?? this.medicationInformationId,
      reservedAt: reservedAt ?? this.reservedAt,
      medicatedAt: medicatedAt ?? this.medicatedAt,
      beforePush: beforePush ?? this.beforePush,
      afterPush: afterPush ?? this.afterPush,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (medicationInformationId.present) {
      map['medication_information_id'] =
          Variable<String>(medicationInformationId.value);
    }
    if (reservedAt.present) {
      map['reserved_at'] = Variable<DateTime>(reservedAt.value);
    }
    if (medicatedAt.present) {
      map['medicated_at'] = Variable<DateTime>(medicatedAt.value);
    }
    if (beforePush.present) {
      map['before_push'] = Variable<bool>(beforePush.value);
    }
    if (afterPush.present) {
      map['after_push'] = Variable<bool>(afterPush.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('medicationInformationId: $medicationInformationId, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('medicatedAt: $medicatedAt, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
          ..write(')'))
        .toString();
  }
}

class $MedicationSchedulesTable extends MedicationSchedules
    with TableInfo<$MedicationSchedulesTable, MedicationScheduleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationSchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _medicationInformationIdMeta =
      const VerificationMeta('medicationInformationId');
  @override
  late final GeneratedColumn<String> medicationInformationId =
      GeneratedColumn<String>('medication_information_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES medication_informations (id)');
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime> reservedAt = GeneratedColumn<DateTime>(
      'reserved_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _medicatedAtMeta =
      const VerificationMeta('medicatedAt');
  @override
  late final GeneratedColumn<DateTime> medicatedAt = GeneratedColumn<DateTime>(
      'medicated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _beforePushMeta = const VerificationMeta('beforePush');
  @override
  late final GeneratedColumn<bool> beforePush = GeneratedColumn<bool>(
      'before_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (before_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _afterPushMeta = const VerificationMeta('afterPush');
  @override
  late final GeneratedColumn<bool> afterPush = GeneratedColumn<bool>(
      'after_push', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (after_push IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        medicationInformationId,
        reservedAt,
        medicatedAt,
        beforePush,
        afterPush
      ];
  @override
  String get aliasedName => _alias ?? 'medication_schedules';
  @override
  String get actualTableName => 'medication_schedules';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationScheduleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('medication_information_id')) {
      context.handle(
          _medicationInformationIdMeta,
          medicationInformationId.isAcceptableOrUnknown(
              data['medication_information_id']!,
              _medicationInformationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationInformationIdMeta);
    }
    if (data.containsKey('reserved_at')) {
      context.handle(
          _reservedAtMeta,
          reservedAt.isAcceptableOrUnknown(
              data['reserved_at']!, _reservedAtMeta));
    } else if (isInserting) {
      context.missing(_reservedAtMeta);
    }
    if (data.containsKey('medicated_at')) {
      context.handle(
          _medicatedAtMeta,
          medicatedAt.isAcceptableOrUnknown(
              data['medicated_at']!, _medicatedAtMeta));
    }
    if (data.containsKey('before_push')) {
      context.handle(
          _beforePushMeta,
          beforePush.isAcceptableOrUnknown(
              data['before_push']!, _beforePushMeta));
    }
    if (data.containsKey('after_push')) {
      context.handle(_afterPushMeta,
          afterPush.isAcceptableOrUnknown(data['after_push']!, _afterPushMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {medicationInformationId, reservedAt},
      ];
  @override
  MedicationScheduleModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationScheduleModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      medicationInformationId: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}medication_information_id'])!,
      reservedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reserved_at'])!,
      medicatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}medicated_at']),
      beforePush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}before_push'])!,
      afterPush: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}after_push'])!,
    );
  }

  @override
  $MedicationSchedulesTable createAlias(String alias) {
    return $MedicationSchedulesTable(attachedDatabase, alias);
  }
}

class NotificationScheduleModel extends DataClass
    implements Insertable<NotificationScheduleModel> {
  /// 아이디
  final int id;

  /// 유저 아이디
  final String userId;

  /// 0: 복약일정, 1: 병원방문 일정
  final int type;

  /// 이전 알림인지
  final PushType pushType;

  /// 알림 예정일
  final DateTime reservedAt;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  const NotificationScheduleModel(
      {required this.id,
      required this.userId,
      required this.type,
      required this.pushType,
      required this.reservedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<int>(type);
    {
      final converter = $NotificationSchedulesTable.$converter0;
      map['push_type'] = Variable<int>(converter.toSql(pushType));
    }
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotificationSchedulesCompanion toCompanion(bool nullToAbsent) {
    return NotificationSchedulesCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      pushType: Value(pushType),
      reservedAt: Value(reservedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NotificationScheduleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationScheduleModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<int>(json['type']),
      pushType: serializer.fromJson<PushType>(json['pushType']),
      reservedAt: serializer.fromJson<DateTime>(json['reservedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<int>(type),
      'pushType': serializer.toJson<PushType>(pushType),
      'reservedAt': serializer.toJson<DateTime>(reservedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NotificationScheduleModel copyWith(
          {int? id,
          String? userId,
          int? type,
          PushType? pushType,
          DateTime? reservedAt,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NotificationScheduleModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        pushType: pushType ?? this.pushType,
        reservedAt: reservedAt ?? this.reservedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationScheduleModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('pushType: $pushType, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, type, pushType, reservedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationScheduleModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.pushType == this.pushType &&
          other.reservedAt == this.reservedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationSchedulesCompanion
    extends UpdateCompanion<NotificationScheduleModel> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> type;
  final Value<PushType> pushType;
  final Value<DateTime> reservedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NotificationSchedulesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.pushType = const Value.absent(),
    this.reservedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NotificationSchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int type,
    required PushType pushType,
    required DateTime reservedAt,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : userId = Value(userId),
        type = Value(type),
        pushType = Value(pushType),
        reservedAt = Value(reservedAt);
  static Insertable<NotificationScheduleModel> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? type,
    Expression<int>? pushType,
    Expression<DateTime>? reservedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (pushType != null) 'push_type': pushType,
      if (reservedAt != null) 'reserved_at': reservedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NotificationSchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? type,
      Value<PushType>? pushType,
      Value<DateTime>? reservedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return NotificationSchedulesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      pushType: pushType ?? this.pushType,
      reservedAt: reservedAt ?? this.reservedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (pushType.present) {
      final converter = $NotificationSchedulesTable.$converter0;
      map['push_type'] = Variable<int>(converter.toSql(pushType.value));
    }
    if (reservedAt.present) {
      map['reserved_at'] = Variable<DateTime>(reservedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('pushType: $pushType, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationSchedulesTable extends NotificationSchedules
    with TableInfo<$NotificationSchedulesTable, NotificationScheduleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _pushTypeMeta = const VerificationMeta('pushType');
  @override
  late final GeneratedColumnWithTypeConverter<PushType, int> pushType =
      GeneratedColumn<int>('push_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<PushType>($NotificationSchedulesTable.$converter0);
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime> reservedAt = GeneratedColumn<DateTime>(
      'reserved_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, type, pushType, reservedAt, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'notification_schedules';
  @override
  String get actualTableName => 'notification_schedules';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationScheduleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    context.handle(_pushTypeMeta, const VerificationResult.success());
    if (data.containsKey('reserved_at')) {
      context.handle(
          _reservedAtMeta,
          reservedAt.isAcceptableOrUnknown(
              data['reserved_at']!, _reservedAtMeta));
    } else if (isInserting) {
      context.missing(_reservedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, type, pushType, reservedAt},
      ];
  @override
  NotificationScheduleModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationScheduleModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      pushType: $NotificationSchedulesTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}push_type'])!),
      reservedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reserved_at'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NotificationSchedulesTable createAlias(String alias) {
    return $NotificationSchedulesTable(attachedDatabase, alias);
  }

  static TypeConverter<PushType, int> $converter0 =
      const EnumIndexConverter<PushType>(PushType.values);
}

class LastLoginUserModel extends DataClass
    implements Insertable<LastLoginUserModel> {
  /// 유저 아이디
  final String userId;

  /// 아이디
  final String id;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  const LastLoginUserModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LastLoginUsersCompanion toCompanion(bool nullToAbsent) {
    return LastLoginUsersCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LastLoginUserModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LastLoginUserModel(
      userId: serializer.fromJson<String>(json['userId']),
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LastLoginUserModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      LastLoginUserModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('LastLoginUserModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, id, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastLoginUserModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LastLoginUsersCompanion extends UpdateCompanion<LastLoginUserModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LastLoginUsersCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LastLoginUsersCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<LastLoginUserModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LastLoginUsersCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return LastLoginUsersCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastLoginUsersCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LastLoginUsersTable extends LastLoginUsers
    with TableInfo<$LastLoginUsersTable, LastLoginUserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LastLoginUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [userId, id, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'last_login_users';
  @override
  String get actualTableName => 'last_login_users';
  @override
  VerificationContext validateIntegrity(Insertable<LastLoginUserModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastLoginUserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LastLoginUserModel(
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $LastLoginUsersTable createAlias(String alias) {
    return $LastLoginUsersTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $UsersTable users = $UsersTable(this);
  late final $PillsTable pills = $PillsTable(this);
  late final $HospitalVisitSchedulesTable hospitalVisitSchedules =
      $HospitalVisitSchedulesTable(this);
  late final $LiverLevelHistoriesTable liverLevelHistories =
      $LiverLevelHistoriesTable(this);
  late final $PointHistoriesTable pointHistories = $PointHistoriesTable(this);
  late final $SF12SurveyHistoriesTable sF12SurveyHistories =
      $SF12SurveyHistoriesTable(this);
  late final $MedicationAdherenceSurveyHistoriesTable
      medicationAdherenceSurveyHistories =
      $MedicationAdherenceSurveyHistoriesTable(this);
  late final $SF12SurveyAnswersTable sF12SurveyAnswers =
      $SF12SurveyAnswersTable(this);
  late final $MetabolicDiseasesTable metabolicDiseases =
      $MetabolicDiseasesTable(this);
  late final $ExaminationResultsTable examinationResults =
      $ExaminationResultsTable(this);
  late final $HealthQuestionsTable healthQuestions =
      $HealthQuestionsTable(this);
  late final $DrinkingHistoriesTable drinkingHistories =
      $DrinkingHistoriesTable(this);
  late final $SmokingHistoriesTable smokingHistories =
      $SmokingHistoriesTable(this);
  late final $ExcerciseHistoriesTable excerciseHistories =
      $ExcerciseHistoriesTable(this);
  late final $HospitalsTable hospitals = $HospitalsTable(this);
  late final $MedicationAdherenceSurveyAnswersTable
      medicationAdherenceSurveyAnswers =
      $MedicationAdherenceSurveyAnswersTable(this);
  late final $UserPointsTable userPoints = $UserPointsTable(this);
  late final $PrescriptionsTable prescriptions = $PrescriptionsTable(this);
  late final $MedicationInformationsTable medicationInformations =
      $MedicationInformationsTable(this);
  late final $MedicationSchedulesTable medicationSchedules =
      $MedicationSchedulesTable(this);
  late final $NotificationSchedulesTable notificationSchedules =
      $NotificationSchedulesTable(this);
  late final $LastLoginUsersTable lastLoginUsers = $LastLoginUsersTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        pills,
        hospitalVisitSchedules,
        liverLevelHistories,
        pointHistories,
        sF12SurveyHistories,
        medicationAdherenceSurveyHistories,
        sF12SurveyAnswers,
        metabolicDiseases,
        examinationResults,
        healthQuestions,
        drinkingHistories,
        smokingHistories,
        excerciseHistories,
        hospitals,
        medicationAdherenceSurveyAnswers,
        userPoints,
        prescriptions,
        medicationInformations,
        medicationSchedules,
        notificationSchedules,
        lastLoginUsers
      ];
}
