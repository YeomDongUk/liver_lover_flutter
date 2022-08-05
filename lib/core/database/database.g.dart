// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
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
  final int point;
  UserModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.phone,
      required this.birthYear,
      required this.sex,
      required this.height,
      required this.weight,
      required this.pinCode,
      required this.point});
  factory UserModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      birthYear: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_year'])!,
      sex: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sex'])!,
      height: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height'])!,
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      pinCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pin_code'])!,
      point: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}point'])!,
    );
  }
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
    map['point'] = Variable<int>(point);
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
      point: Value(point),
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
      point: serializer.fromJson<int>(json['point']),
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
      'point': serializer.toJson<int>(point),
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
          String? pinCode,
          int? point}) =>
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
        point: point ?? this.point,
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
          ..write('pinCode: $pinCode, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, name, phone,
      birthYear, sex, height, weight, pinCode, point);
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
          other.pinCode == this.pinCode &&
          other.point == this.point);
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
  final Value<int> point;
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
    this.point = const Value.absent(),
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
    this.point = const Value.absent(),
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
    Expression<int>? point,
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
      if (point != null) 'point': point,
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
      Value<String>? pinCode,
      Value<int>? point}) {
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
      point: point ?? this.point,
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
    if (point.present) {
      map['point'] = Variable<int>(point.value);
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
          ..write('pinCode: $pinCode, ')
          ..write('point: $point')
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      check: () => name.length.isBiggerThan(const Constant(0)),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      check: () => phone.length.equalsExp(const Constant(11)),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _birthYearMeta = const VerificationMeta('birthYear');
  @override
  late final GeneratedColumn<int?> birthYear = GeneratedColumn<int?>(
      'birth_year', aliasedName, false,
      check: () => birthYear.isBiggerThan(const Constant(1900)),
      type: const IntType(),
      requiredDuringInsert: true);
  final VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<int?> sex = GeneratedColumn<int?>(
      'sex', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL CHECK (sex IN (0, 1))');
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int?> height = GeneratedColumn<int?>(
      'height', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pinCodeMeta = const VerificationMeta('pinCode');
  @override
  late final GeneratedColumn<String?> pinCode = GeneratedColumn<String?>(
      'pin_code', aliasedName, false,
      check: () => pinCode.length.equalsExp(const Constant(6)),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int?> point = GeneratedColumn<int?>(
      'point', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
        pinCode,
        point
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
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
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
    return UserModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final String material;
  final String imageUrl;
  final String effect;
  final String useage;
  PillModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.entpName,
      required this.name,
      required this.material,
      required this.imageUrl,
      required this.effect,
      required this.useage});
  factory PillModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PillModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      entpName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entp_name'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      material: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}material'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      effect: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}effect'])!,
      useage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}useage'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['entp_name'] = Variable<String>(entpName);
    map['name'] = Variable<String>(name);
    map['material'] = Variable<String>(material);
    map['image_url'] = Variable<String>(imageUrl);
    map['effect'] = Variable<String>(effect);
    map['useage'] = Variable<String>(useage);
    return map;
  }

  PillsCompanion toCompanion(bool nullToAbsent) {
    return PillsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      entpName: Value(entpName),
      name: Value(name),
      material: Value(material),
      imageUrl: Value(imageUrl),
      effect: Value(effect),
      useage: Value(useage),
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
      material: serializer.fromJson<String>(json['material']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      effect: serializer.fromJson<String>(json['effect']),
      useage: serializer.fromJson<String>(json['useage']),
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
      'material': serializer.toJson<String>(material),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'effect': serializer.toJson<String>(effect),
      'useage': serializer.toJson<String>(useage),
    };
  }

  PillModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? entpName,
          String? name,
          String? material,
          String? imageUrl,
          String? effect,
          String? useage}) =>
      PillModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        entpName: entpName ?? this.entpName,
        name: name ?? this.name,
        material: material ?? this.material,
        imageUrl: imageUrl ?? this.imageUrl,
        effect: effect ?? this.effect,
        useage: useage ?? this.useage,
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
          ..write('imageUrl: $imageUrl, ')
          ..write('effect: $effect, ')
          ..write('useage: $useage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, entpName, name,
      material, imageUrl, effect, useage);
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
          other.imageUrl == this.imageUrl &&
          other.effect == this.effect &&
          other.useage == this.useage);
}

class PillsCompanion extends UpdateCompanion<PillModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> entpName;
  final Value<String> name;
  final Value<String> material;
  final Value<String> imageUrl;
  final Value<String> effect;
  final Value<String> useage;
  const PillsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.entpName = const Value.absent(),
    this.name = const Value.absent(),
    this.material = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.effect = const Value.absent(),
    this.useage = const Value.absent(),
  });
  PillsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String entpName,
    required String name,
    required String material,
    required String imageUrl,
    required String effect,
    required String useage,
  })  : entpName = Value(entpName),
        name = Value(name),
        material = Value(material),
        imageUrl = Value(imageUrl),
        effect = Value(effect),
        useage = Value(useage);
  static Insertable<PillModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? entpName,
    Expression<String>? name,
    Expression<String>? material,
    Expression<String>? imageUrl,
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
      if (imageUrl != null) 'image_url': imageUrl,
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
      Value<String>? material,
      Value<String>? imageUrl,
      Value<String>? effect,
      Value<String>? useage}) {
    return PillsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      entpName: entpName ?? this.entpName,
      name: name ?? this.name,
      material: material ?? this.material,
      imageUrl: imageUrl ?? this.imageUrl,
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
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
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
          ..write('imageUrl: $imageUrl, ')
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _entpNameMeta = const VerificationMeta('entpName');
  @override
  late final GeneratedColumn<String?> entpName = GeneratedColumn<String?>(
      'entp_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _materialMeta = const VerificationMeta('material');
  @override
  late final GeneratedColumn<String?> material = GeneratedColumn<String?>(
      'material', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _effectMeta = const VerificationMeta('effect');
  @override
  late final GeneratedColumn<String?> effect = GeneratedColumn<String?>(
      'effect', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _useageMeta = const VerificationMeta('useage');
  @override
  late final GeneratedColumn<String?> useage = GeneratedColumn<String?>(
      'useage', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        entpName,
        name,
        material,
        imageUrl,
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
    } else if (isInserting) {
      context.missing(_materialMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('effect')) {
      context.handle(_effectMeta,
          effect.isAcceptableOrUnknown(data['effect']!, _effectMeta));
    } else if (isInserting) {
      context.missing(_effectMeta);
    }
    if (data.containsKey('useage')) {
      context.handle(_useageMeta,
          useage.isAcceptableOrUnknown(data['useage']!, _useageMeta));
    } else if (isInserting) {
      context.missing(_useageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PillModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PillModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PillsTable createAlias(String alias) {
    return $PillsTable(attachedDatabase, alias);
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
  final String doctorName;
  final DateTime prescribedAt;
  final DateTime medicationStartAt;
  final DateTime medicationEndAt;
  final bool push;
  final bool beforePush;
  final bool afterPush;
  PrescriptionModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.doctorName,
      required this.prescribedAt,
      required this.medicationStartAt,
      required this.medicationEndAt,
      required this.push,
      required this.beforePush,
      required this.afterPush});
  factory PrescriptionModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PrescriptionModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      doctorName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}doctor_name'])!,
      prescribedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prescribed_at'])!,
      medicationStartAt: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}medication_start_at'])!,
      medicationEndAt: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}medication_end_at'])!,
      push: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}push'])!,
      beforePush: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}before_push'])!,
      afterPush: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}after_push'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['doctor_name'] = Variable<String>(doctorName);
    map['prescribed_at'] = Variable<DateTime>(prescribedAt);
    map['medication_start_at'] = Variable<DateTime>(medicationStartAt);
    map['medication_end_at'] = Variable<DateTime>(medicationEndAt);
    map['push'] = Variable<bool>(push);
    map['before_push'] = Variable<bool>(beforePush);
    map['after_push'] = Variable<bool>(afterPush);
    return map;
  }

  PrescriptionsCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionsCompanion(
      userId: Value(userId),
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      doctorName: Value(doctorName),
      prescribedAt: Value(prescribedAt),
      medicationStartAt: Value(medicationStartAt),
      medicationEndAt: Value(medicationEndAt),
      push: Value(push),
      beforePush: Value(beforePush),
      afterPush: Value(afterPush),
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
      prescribedAt: serializer.fromJson<DateTime>(json['prescribedAt']),
      medicationStartAt:
          serializer.fromJson<DateTime>(json['medicationStartAt']),
      medicationEndAt: serializer.fromJson<DateTime>(json['medicationEndAt']),
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
      'doctorName': serializer.toJson<String>(doctorName),
      'prescribedAt': serializer.toJson<DateTime>(prescribedAt),
      'medicationStartAt': serializer.toJson<DateTime>(medicationStartAt),
      'medicationEndAt': serializer.toJson<DateTime>(medicationEndAt),
      'push': serializer.toJson<bool>(push),
      'beforePush': serializer.toJson<bool>(beforePush),
      'afterPush': serializer.toJson<bool>(afterPush),
    };
  }

  PrescriptionModel copyWith(
          {String? userId,
          String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? doctorName,
          DateTime? prescribedAt,
          DateTime? medicationStartAt,
          DateTime? medicationEndAt,
          bool? push,
          bool? beforePush,
          bool? afterPush}) =>
      PrescriptionModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        doctorName: doctorName ?? this.doctorName,
        prescribedAt: prescribedAt ?? this.prescribedAt,
        medicationStartAt: medicationStartAt ?? this.medicationStartAt,
        medicationEndAt: medicationEndAt ?? this.medicationEndAt,
        push: push ?? this.push,
        beforePush: beforePush ?? this.beforePush,
        afterPush: afterPush ?? this.afterPush,
      );
  @override
  String toString() {
    return (StringBuffer('PrescriptionModel(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('prescribedAt: $prescribedAt, ')
          ..write('medicationStartAt: $medicationStartAt, ')
          ..write('medicationEndAt: $medicationEndAt, ')
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
      doctorName,
      prescribedAt,
      medicationStartAt,
      medicationEndAt,
      push,
      beforePush,
      afterPush);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionModel &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.doctorName == this.doctorName &&
          other.prescribedAt == this.prescribedAt &&
          other.medicationStartAt == this.medicationStartAt &&
          other.medicationEndAt == this.medicationEndAt &&
          other.push == this.push &&
          other.beforePush == this.beforePush &&
          other.afterPush == this.afterPush);
}

class PrescriptionsCompanion extends UpdateCompanion<PrescriptionModel> {
  final Value<String> userId;
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> doctorName;
  final Value<DateTime> prescribedAt;
  final Value<DateTime> medicationStartAt;
  final Value<DateTime> medicationEndAt;
  final Value<bool> push;
  final Value<bool> beforePush;
  final Value<bool> afterPush;
  const PrescriptionsCompanion({
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.prescribedAt = const Value.absent(),
    this.medicationStartAt = const Value.absent(),
    this.medicationEndAt = const Value.absent(),
    this.push = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  });
  PrescriptionsCompanion.insert({
    required String userId,
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String doctorName,
    required DateTime prescribedAt,
    required DateTime medicationStartAt,
    required DateTime medicationEndAt,
    this.push = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  })  : userId = Value(userId),
        doctorName = Value(doctorName),
        prescribedAt = Value(prescribedAt),
        medicationStartAt = Value(medicationStartAt),
        medicationEndAt = Value(medicationEndAt);
  static Insertable<PrescriptionModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? doctorName,
    Expression<DateTime>? prescribedAt,
    Expression<DateTime>? medicationStartAt,
    Expression<DateTime>? medicationEndAt,
    Expression<bool>? push,
    Expression<bool>? beforePush,
    Expression<bool>? afterPush,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (doctorName != null) 'doctor_name': doctorName,
      if (prescribedAt != null) 'prescribed_at': prescribedAt,
      if (medicationStartAt != null) 'medication_start_at': medicationStartAt,
      if (medicationEndAt != null) 'medication_end_at': medicationEndAt,
      if (push != null) 'push': push,
      if (beforePush != null) 'before_push': beforePush,
      if (afterPush != null) 'after_push': afterPush,
    });
  }

  PrescriptionsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? doctorName,
      Value<DateTime>? prescribedAt,
      Value<DateTime>? medicationStartAt,
      Value<DateTime>? medicationEndAt,
      Value<bool>? push,
      Value<bool>? beforePush,
      Value<bool>? afterPush}) {
    return PrescriptionsCompanion(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      doctorName: doctorName ?? this.doctorName,
      prescribedAt: prescribedAt ?? this.prescribedAt,
      medicationStartAt: medicationStartAt ?? this.medicationStartAt,
      medicationEndAt: medicationEndAt ?? this.medicationEndAt,
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
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (prescribedAt.present) {
      map['prescribed_at'] = Variable<DateTime>(prescribedAt.value);
    }
    if (medicationStartAt.present) {
      map['medication_start_at'] = Variable<DateTime>(medicationStartAt.value);
    }
    if (medicationEndAt.present) {
      map['medication_end_at'] = Variable<DateTime>(medicationEndAt.value);
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
    return (StringBuffer('PrescriptionsCompanion(')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('doctorName: $doctorName, ')
          ..write('prescribedAt: $prescribedAt, ')
          ..write('medicationStartAt: $medicationStartAt, ')
          ..write('medicationEndAt: $medicationEndAt, ')
          ..write('push: $push, ')
          ..write('beforePush: $beforePush, ')
          ..write('afterPush: $afterPush')
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String?> doctorName = GeneratedColumn<String?>(
      'doctor_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _prescribedAtMeta =
      const VerificationMeta('prescribedAt');
  @override
  late final GeneratedColumn<DateTime?> prescribedAt =
      GeneratedColumn<DateTime?>('prescribed_at', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _medicationStartAtMeta =
      const VerificationMeta('medicationStartAt');
  @override
  late final GeneratedColumn<DateTime?> medicationStartAt =
      GeneratedColumn<DateTime?>('medication_start_at', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _medicationEndAtMeta =
      const VerificationMeta('medicationEndAt');
  @override
  late final GeneratedColumn<DateTime?> medicationEndAt =
      GeneratedColumn<DateTime?>('medication_end_at', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pushMeta = const VerificationMeta('push');
  @override
  late final GeneratedColumn<bool?> push = GeneratedColumn<bool?>(
      'push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _beforePushMeta = const VerificationMeta('beforePush');
  @override
  late final GeneratedColumn<bool?> beforePush = GeneratedColumn<bool?>(
      'before_push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (before_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _afterPushMeta = const VerificationMeta('afterPush');
  @override
  late final GeneratedColumn<bool?> afterPush = GeneratedColumn<bool?>(
      'after_push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (after_push IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        id,
        createdAt,
        updatedAt,
        doctorName,
        prescribedAt,
        medicationStartAt,
        medicationEndAt,
        push,
        beforePush,
        afterPush
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
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('prescribed_at')) {
      context.handle(
          _prescribedAtMeta,
          prescribedAt.isAcceptableOrUnknown(
              data['prescribed_at']!, _prescribedAtMeta));
    } else if (isInserting) {
      context.missing(_prescribedAtMeta);
    }
    if (data.containsKey('medication_start_at')) {
      context.handle(
          _medicationStartAtMeta,
          medicationStartAt.isAcceptableOrUnknown(
              data['medication_start_at']!, _medicationStartAtMeta));
    } else if (isInserting) {
      context.missing(_medicationStartAtMeta);
    }
    if (data.containsKey('medication_end_at')) {
      context.handle(
          _medicationEndAtMeta,
          medicationEndAt.isAcceptableOrUnknown(
              data['medication_end_at']!, _medicationEndAtMeta));
    } else if (isInserting) {
      context.missing(_medicationEndAtMeta);
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
  PrescriptionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PrescriptionModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final String pillId;
  final int dayDuration;
  final int takeCount;
  final int? moring;
  final int? afternoon;
  final int? evening;
  final int? night;
  MedicationInformationModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.prescriptionId,
      required this.pillId,
      required this.dayDuration,
      required this.takeCount,
      this.moring,
      this.afternoon,
      this.evening,
      this.night});
  factory MedicationInformationModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MedicationInformationModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      prescriptionId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prescription_id'])!,
      pillId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pill_id'])!,
      dayDuration: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}day_duration'])!,
      takeCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}take_count'])!,
      moring: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}moring']),
      afternoon: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}afternoon']),
      evening: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}evening']),
      night: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}night']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['prescription_id'] = Variable<String>(prescriptionId);
    map['pill_id'] = Variable<String>(pillId);
    map['day_duration'] = Variable<int>(dayDuration);
    map['take_count'] = Variable<int>(takeCount);
    if (!nullToAbsent || moring != null) {
      map['moring'] = Variable<int?>(moring);
    }
    if (!nullToAbsent || afternoon != null) {
      map['afternoon'] = Variable<int?>(afternoon);
    }
    if (!nullToAbsent || evening != null) {
      map['evening'] = Variable<int?>(evening);
    }
    if (!nullToAbsent || night != null) {
      map['night'] = Variable<int?>(night);
    }
    return map;
  }

  MedicationInformationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationInformationsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      prescriptionId: Value(prescriptionId),
      pillId: Value(pillId),
      dayDuration: Value(dayDuration),
      takeCount: Value(takeCount),
      moring:
          moring == null && nullToAbsent ? const Value.absent() : Value(moring),
      afternoon: afternoon == null && nullToAbsent
          ? const Value.absent()
          : Value(afternoon),
      evening: evening == null && nullToAbsent
          ? const Value.absent()
          : Value(evening),
      night:
          night == null && nullToAbsent ? const Value.absent() : Value(night),
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
      dayDuration: serializer.fromJson<int>(json['dayDuration']),
      takeCount: serializer.fromJson<int>(json['takeCount']),
      moring: serializer.fromJson<int?>(json['moring']),
      afternoon: serializer.fromJson<int?>(json['afternoon']),
      evening: serializer.fromJson<int?>(json['evening']),
      night: serializer.fromJson<int?>(json['night']),
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
      'dayDuration': serializer.toJson<int>(dayDuration),
      'takeCount': serializer.toJson<int>(takeCount),
      'moring': serializer.toJson<int?>(moring),
      'afternoon': serializer.toJson<int?>(afternoon),
      'evening': serializer.toJson<int?>(evening),
      'night': serializer.toJson<int?>(night),
    };
  }

  MedicationInformationModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? prescriptionId,
          String? pillId,
          int? dayDuration,
          int? takeCount,
          int? moring,
          int? afternoon,
          int? evening,
          int? night}) =>
      MedicationInformationModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        prescriptionId: prescriptionId ?? this.prescriptionId,
        pillId: pillId ?? this.pillId,
        dayDuration: dayDuration ?? this.dayDuration,
        takeCount: takeCount ?? this.takeCount,
        moring: moring ?? this.moring,
        afternoon: afternoon ?? this.afternoon,
        evening: evening ?? this.evening,
        night: night ?? this.night,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationInformationModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('pillId: $pillId, ')
          ..write('dayDuration: $dayDuration, ')
          ..write('takeCount: $takeCount, ')
          ..write('moring: $moring, ')
          ..write('afternoon: $afternoon, ')
          ..write('evening: $evening, ')
          ..write('night: $night')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, prescriptionId,
      pillId, dayDuration, takeCount, moring, afternoon, evening, night);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationInformationModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.prescriptionId == this.prescriptionId &&
          other.pillId == this.pillId &&
          other.dayDuration == this.dayDuration &&
          other.takeCount == this.takeCount &&
          other.moring == this.moring &&
          other.afternoon == this.afternoon &&
          other.evening == this.evening &&
          other.night == this.night);
}

class MedicationInformationsCompanion
    extends UpdateCompanion<MedicationInformationModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> prescriptionId;
  final Value<String> pillId;
  final Value<int> dayDuration;
  final Value<int> takeCount;
  final Value<int?> moring;
  final Value<int?> afternoon;
  final Value<int?> evening;
  final Value<int?> night;
  const MedicationInformationsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.prescriptionId = const Value.absent(),
    this.pillId = const Value.absent(),
    this.dayDuration = const Value.absent(),
    this.takeCount = const Value.absent(),
    this.moring = const Value.absent(),
    this.afternoon = const Value.absent(),
    this.evening = const Value.absent(),
    this.night = const Value.absent(),
  });
  MedicationInformationsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String prescriptionId,
    required String pillId,
    required int dayDuration,
    required int takeCount,
    this.moring = const Value.absent(),
    this.afternoon = const Value.absent(),
    this.evening = const Value.absent(),
    this.night = const Value.absent(),
  })  : prescriptionId = Value(prescriptionId),
        pillId = Value(pillId),
        dayDuration = Value(dayDuration),
        takeCount = Value(takeCount);
  static Insertable<MedicationInformationModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? prescriptionId,
    Expression<String>? pillId,
    Expression<int>? dayDuration,
    Expression<int>? takeCount,
    Expression<int?>? moring,
    Expression<int?>? afternoon,
    Expression<int?>? evening,
    Expression<int?>? night,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (prescriptionId != null) 'prescription_id': prescriptionId,
      if (pillId != null) 'pill_id': pillId,
      if (dayDuration != null) 'day_duration': dayDuration,
      if (takeCount != null) 'take_count': takeCount,
      if (moring != null) 'moring': moring,
      if (afternoon != null) 'afternoon': afternoon,
      if (evening != null) 'evening': evening,
      if (night != null) 'night': night,
    });
  }

  MedicationInformationsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? prescriptionId,
      Value<String>? pillId,
      Value<int>? dayDuration,
      Value<int>? takeCount,
      Value<int?>? moring,
      Value<int?>? afternoon,
      Value<int?>? evening,
      Value<int?>? night}) {
    return MedicationInformationsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prescriptionId: prescriptionId ?? this.prescriptionId,
      pillId: pillId ?? this.pillId,
      dayDuration: dayDuration ?? this.dayDuration,
      takeCount: takeCount ?? this.takeCount,
      moring: moring ?? this.moring,
      afternoon: afternoon ?? this.afternoon,
      evening: evening ?? this.evening,
      night: night ?? this.night,
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
    if (dayDuration.present) {
      map['day_duration'] = Variable<int>(dayDuration.value);
    }
    if (takeCount.present) {
      map['take_count'] = Variable<int>(takeCount.value);
    }
    if (moring.present) {
      map['moring'] = Variable<int?>(moring.value);
    }
    if (afternoon.present) {
      map['afternoon'] = Variable<int?>(afternoon.value);
    }
    if (evening.present) {
      map['evening'] = Variable<int?>(evening.value);
    }
    if (night.present) {
      map['night'] = Variable<int?>(night.value);
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
          ..write('dayDuration: $dayDuration, ')
          ..write('takeCount: $takeCount, ')
          ..write('moring: $moring, ')
          ..write('afternoon: $afternoon, ')
          ..write('evening: $evening, ')
          ..write('night: $night')
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _prescriptionIdMeta =
      const VerificationMeta('prescriptionId');
  @override
  late final GeneratedColumn<String?> prescriptionId = GeneratedColumn<String?>(
      'prescription_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES prescriptions (id)');
  final VerificationMeta _pillIdMeta = const VerificationMeta('pillId');
  @override
  late final GeneratedColumn<String?> pillId = GeneratedColumn<String?>(
      'pill_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES pills (id)');
  final VerificationMeta _dayDurationMeta =
      const VerificationMeta('dayDuration');
  @override
  late final GeneratedColumn<int?> dayDuration = GeneratedColumn<int?>(
      'day_duration', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _takeCountMeta = const VerificationMeta('takeCount');
  @override
  late final GeneratedColumn<int?> takeCount = GeneratedColumn<int?>(
      'take_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _moringMeta = const VerificationMeta('moring');
  @override
  late final GeneratedColumn<int?> moring = GeneratedColumn<int?>(
      'moring', aliasedName, true,
      check: () => moring.isBetween(const Constant(7), const Constant(9)),
      type: const IntType(),
      requiredDuringInsert: false);
  final VerificationMeta _afternoonMeta = const VerificationMeta('afternoon');
  @override
  late final GeneratedColumn<int?> afternoon = GeneratedColumn<int?>(
      'afternoon', aliasedName, true,
      check: () => afternoon.isBetween(const Constant(11), const Constant(13)),
      type: const IntType(),
      requiredDuringInsert: false);
  final VerificationMeta _eveningMeta = const VerificationMeta('evening');
  @override
  late final GeneratedColumn<int?> evening = GeneratedColumn<int?>(
      'evening', aliasedName, true,
      check: () => evening.isBetween(const Constant(18), const Constant(20)),
      type: const IntType(),
      requiredDuringInsert: false);
  final VerificationMeta _nightMeta = const VerificationMeta('night');
  @override
  late final GeneratedColumn<int?> night = GeneratedColumn<int?>(
      'night', aliasedName, true,
      check: () => night.isBetween(const Constant(22), const Constant(24)),
      type: const IntType(),
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        prescriptionId,
        pillId,
        dayDuration,
        takeCount,
        moring,
        afternoon,
        evening,
        night
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
    if (data.containsKey('day_duration')) {
      context.handle(
          _dayDurationMeta,
          dayDuration.isAcceptableOrUnknown(
              data['day_duration']!, _dayDurationMeta));
    } else if (isInserting) {
      context.missing(_dayDurationMeta);
    }
    if (data.containsKey('take_count')) {
      context.handle(_takeCountMeta,
          takeCount.isAcceptableOrUnknown(data['take_count']!, _takeCountMeta));
    } else if (isInserting) {
      context.missing(_takeCountMeta);
    }
    if (data.containsKey('moring')) {
      context.handle(_moringMeta,
          moring.isAcceptableOrUnknown(data['moring']!, _moringMeta));
    }
    if (data.containsKey('afternoon')) {
      context.handle(_afternoonMeta,
          afternoon.isAcceptableOrUnknown(data['afternoon']!, _afternoonMeta));
    }
    if (data.containsKey('evening')) {
      context.handle(_eveningMeta,
          evening.isAcceptableOrUnknown(data['evening']!, _eveningMeta));
    }
    if (data.containsKey('night')) {
      context.handle(
          _nightMeta, night.isAcceptableOrUnknown(data['night']!, _nightMeta));
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
    return MedicationInformationModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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

  /// 스케쥴 그룹 아이디
  final String prescriptionId;
  final MedicationScheduleType type;
  final DateTime reservedAt;
  final DateTime? medicatedAt;
  MedicationScheduleModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.prescriptionId,
      required this.type,
      required this.reservedAt,
      this.medicatedAt});
  factory MedicationScheduleModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MedicationScheduleModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      prescriptionId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}prescription_id'])!,
      type: $MedicationSchedulesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      reservedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reserved_at'])!,
      medicatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}medicated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['prescription_id'] = Variable<String>(prescriptionId);
    {
      final converter = $MedicationSchedulesTable.$converter0;
      map['type'] = Variable<int>(converter.mapToSql(type)!);
    }
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    if (!nullToAbsent || medicatedAt != null) {
      map['medicated_at'] = Variable<DateTime?>(medicatedAt);
    }
    return map;
  }

  MedicationSchedulesCompanion toCompanion(bool nullToAbsent) {
    return MedicationSchedulesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      prescriptionId: Value(prescriptionId),
      type: Value(type),
      reservedAt: Value(reservedAt),
      medicatedAt: medicatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(medicatedAt),
    );
  }

  factory MedicationScheduleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationScheduleModel(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      prescriptionId: serializer.fromJson<String>(json['prescriptionId']),
      type: serializer.fromJson<MedicationScheduleType>(json['type']),
      reservedAt: serializer.fromJson<DateTime>(json['reservedAt']),
      medicatedAt: serializer.fromJson<DateTime?>(json['medicatedAt']),
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
      'type': serializer.toJson<MedicationScheduleType>(type),
      'reservedAt': serializer.toJson<DateTime>(reservedAt),
      'medicatedAt': serializer.toJson<DateTime?>(medicatedAt),
    };
  }

  MedicationScheduleModel copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? prescriptionId,
          MedicationScheduleType? type,
          DateTime? reservedAt,
          DateTime? medicatedAt}) =>
      MedicationScheduleModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        prescriptionId: prescriptionId ?? this.prescriptionId,
        type: type ?? this.type,
        reservedAt: reservedAt ?? this.reservedAt,
        medicatedAt: medicatedAt ?? this.medicatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationScheduleModel(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('type: $type, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('medicatedAt: $medicatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, prescriptionId, type, reservedAt, medicatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationScheduleModel &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.prescriptionId == this.prescriptionId &&
          other.type == this.type &&
          other.reservedAt == this.reservedAt &&
          other.medicatedAt == this.medicatedAt);
}

class MedicationSchedulesCompanion
    extends UpdateCompanion<MedicationScheduleModel> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> prescriptionId;
  final Value<MedicationScheduleType> type;
  final Value<DateTime> reservedAt;
  final Value<DateTime?> medicatedAt;
  const MedicationSchedulesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.prescriptionId = const Value.absent(),
    this.type = const Value.absent(),
    this.reservedAt = const Value.absent(),
    this.medicatedAt = const Value.absent(),
  });
  MedicationSchedulesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String prescriptionId,
    required MedicationScheduleType type,
    required DateTime reservedAt,
    this.medicatedAt = const Value.absent(),
  })  : prescriptionId = Value(prescriptionId),
        type = Value(type),
        reservedAt = Value(reservedAt);
  static Insertable<MedicationScheduleModel> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? prescriptionId,
    Expression<MedicationScheduleType>? type,
    Expression<DateTime>? reservedAt,
    Expression<DateTime?>? medicatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (prescriptionId != null) 'prescription_id': prescriptionId,
      if (type != null) 'type': type,
      if (reservedAt != null) 'reserved_at': reservedAt,
      if (medicatedAt != null) 'medicated_at': medicatedAt,
    });
  }

  MedicationSchedulesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? prescriptionId,
      Value<MedicationScheduleType>? type,
      Value<DateTime>? reservedAt,
      Value<DateTime?>? medicatedAt}) {
    return MedicationSchedulesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prescriptionId: prescriptionId ?? this.prescriptionId,
      type: type ?? this.type,
      reservedAt: reservedAt ?? this.reservedAt,
      medicatedAt: medicatedAt ?? this.medicatedAt,
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
    if (type.present) {
      final converter = $MedicationSchedulesTable.$converter0;
      map['type'] = Variable<int>(converter.mapToSql(type.value)!);
    }
    if (reservedAt.present) {
      map['reserved_at'] = Variable<DateTime>(reservedAt.value);
    }
    if (medicatedAt.present) {
      map['medicated_at'] = Variable<DateTime?>(medicatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('type: $type, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('medicatedAt: $medicatedAt')
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _prescriptionIdMeta =
      const VerificationMeta('prescriptionId');
  @override
  late final GeneratedColumn<String?> prescriptionId = GeneratedColumn<String?>(
      'prescription_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES prescriptions (id)');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<MedicationScheduleType, int?>
      type = GeneratedColumn<int?>('type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<MedicationScheduleType>(
              $MedicationSchedulesTable.$converter0);
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime?> reservedAt = GeneratedColumn<DateTime?>(
      'reserved_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _medicatedAtMeta =
      const VerificationMeta('medicatedAt');
  @override
  late final GeneratedColumn<DateTime?> medicatedAt =
      GeneratedColumn<DateTime?>('medicated_at', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, prescriptionId, type, reservedAt, medicatedAt];
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
    if (data.containsKey('prescription_id')) {
      context.handle(
          _prescriptionIdMeta,
          prescriptionId.isAcceptableOrUnknown(
              data['prescription_id']!, _prescriptionIdMeta));
    } else if (isInserting) {
      context.missing(_prescriptionIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {prescriptionId, type, reservedAt},
      ];
  @override
  MedicationScheduleModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return MedicationScheduleModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MedicationSchedulesTable createAlias(String alias) {
    return $MedicationSchedulesTable(attachedDatabase, alias);
  }

  static TypeConverter<MedicationScheduleType, int> $converter0 =
      const EnumIndexConverter<MedicationScheduleType>(
          MedicationScheduleType.values);
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

  /// 진료실
  final String doctorOffice;

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
  HospitalVisitScheduleModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.type,
      required this.hospitalName,
      required this.medicalSubject,
      required this.doctorName,
      required this.doctorOffice,
      required this.reservedAt,
      this.visitedAt,
      required this.push,
      required this.beforePush,
      required this.afterPush});
  factory HospitalVisitScheduleModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HospitalVisitScheduleModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      type: $HospitalVisitSchedulesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      hospitalName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hospital_name'])!,
      medicalSubject: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}medical_subject'])!,
      doctorName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}doctor_name'])!,
      doctorOffice: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}doctor_office'])!,
      reservedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reserved_at'])!,
      visitedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visited_at']),
      push: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}push'])!,
      beforePush: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}before_push'])!,
      afterPush: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}after_push'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      final converter = $HospitalVisitSchedulesTable.$converter0;
      map['type'] = Variable<int>(converter.mapToSql(type)!);
    }
    map['hospital_name'] = Variable<String>(hospitalName);
    map['medical_subject'] = Variable<String>(medicalSubject);
    map['doctor_name'] = Variable<String>(doctorName);
    map['doctor_office'] = Variable<String>(doctorOffice);
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    if (!nullToAbsent || visitedAt != null) {
      map['visited_at'] = Variable<DateTime?>(visitedAt);
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
      doctorOffice: Value(doctorOffice),
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
      doctorOffice: serializer.fromJson<String>(json['doctorOffice']),
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
      'doctorOffice': serializer.toJson<String>(doctorOffice),
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
          String? doctorOffice,
          DateTime? reservedAt,
          DateTime? visitedAt,
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
        doctorOffice: doctorOffice ?? this.doctorOffice,
        reservedAt: reservedAt ?? this.reservedAt,
        visitedAt: visitedAt ?? this.visitedAt,
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
          ..write('doctorOffice: $doctorOffice, ')
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
      doctorOffice,
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
          other.doctorOffice == this.doctorOffice &&
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
  final Value<String> doctorOffice;
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
    this.doctorOffice = const Value.absent(),
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
    required String medicalSubject,
    required String doctorName,
    required String doctorOffice,
    required DateTime reservedAt,
    this.visitedAt = const Value.absent(),
    this.push = const Value.absent(),
    this.beforePush = const Value.absent(),
    this.afterPush = const Value.absent(),
  })  : userId = Value(userId),
        type = Value(type),
        hospitalName = Value(hospitalName),
        medicalSubject = Value(medicalSubject),
        doctorName = Value(doctorName),
        doctorOffice = Value(doctorOffice),
        reservedAt = Value(reservedAt);
  static Insertable<HospitalVisitScheduleModel> custom({
    Expression<String>? userId,
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<HospitalVisitScheduleType>? type,
    Expression<String>? hospitalName,
    Expression<String>? medicalSubject,
    Expression<String>? doctorName,
    Expression<String>? doctorOffice,
    Expression<DateTime>? reservedAt,
    Expression<DateTime?>? visitedAt,
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
      if (doctorOffice != null) 'doctor_office': doctorOffice,
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
      Value<String>? doctorOffice,
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
      doctorOffice: doctorOffice ?? this.doctorOffice,
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
      map['type'] = Variable<int>(converter.mapToSql(type.value)!);
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
    if (doctorOffice.present) {
      map['doctor_office'] = Variable<String>(doctorOffice.value);
    }
    if (reservedAt.present) {
      map['reserved_at'] = Variable<DateTime>(reservedAt.value);
    }
    if (visitedAt.present) {
      map['visited_at'] = Variable<DateTime?>(visitedAt.value);
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
          ..write('doctorOffice: $doctorOffice, ')
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<HospitalVisitScheduleType, int?>
      type = GeneratedColumn<int?>('type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<HospitalVisitScheduleType>(
              $HospitalVisitSchedulesTable.$converter0);
  final VerificationMeta _hospitalNameMeta =
      const VerificationMeta('hospitalName');
  @override
  late final GeneratedColumn<String?> hospitalName = GeneratedColumn<String?>(
      'hospital_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _medicalSubjectMeta =
      const VerificationMeta('medicalSubject');
  @override
  late final GeneratedColumn<String?> medicalSubject = GeneratedColumn<String?>(
      'medical_subject', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String?> doctorName = GeneratedColumn<String?>(
      'doctor_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doctorOfficeMeta =
      const VerificationMeta('doctorOffice');
  @override
  late final GeneratedColumn<String?> doctorOffice = GeneratedColumn<String?>(
      'doctor_office', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime?> reservedAt = GeneratedColumn<DateTime?>(
      'reserved_at', aliasedName, false,
      check: () => reservedAt.isBiggerThan(currentDate),
      type: const IntType(),
      requiredDuringInsert: true);
  final VerificationMeta _visitedAtMeta = const VerificationMeta('visitedAt');
  @override
  late final GeneratedColumn<DateTime?> visitedAt = GeneratedColumn<DateTime?>(
      'visited_at', aliasedName, true,
      check: () => visitedAt.isBiggerThan(currentDate),
      type: const IntType(),
      requiredDuringInsert: false);
  final VerificationMeta _pushMeta = const VerificationMeta('push');
  @override
  late final GeneratedColumn<bool?> push = GeneratedColumn<bool?>(
      'push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _beforePushMeta = const VerificationMeta('beforePush');
  @override
  late final GeneratedColumn<bool?> beforePush = GeneratedColumn<bool?>(
      'before_push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (before_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _afterPushMeta = const VerificationMeta('afterPush');
  @override
  late final GeneratedColumn<bool?> afterPush = GeneratedColumn<bool?>(
      'after_push', aliasedName, false,
      type: const BoolType(),
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
        doctorOffice,
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
    } else if (isInserting) {
      context.missing(_medicalSubjectMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
          _doctorNameMeta,
          doctorName.isAcceptableOrUnknown(
              data['doctor_name']!, _doctorNameMeta));
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('doctor_office')) {
      context.handle(
          _doctorOfficeMeta,
          doctorOffice.isAcceptableOrUnknown(
              data['doctor_office']!, _doctorOfficeMeta));
    } else if (isInserting) {
      context.missing(_doctorOfficeMeta);
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
    return HospitalVisitScheduleModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  LiverLevelHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.date,
      required this.type,
      required this.value});
  factory LiverLevelHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LiverLevelHistoryModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      type: $LiverLevelHistoriesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      value: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}value'])!,
    );
  }
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
      map['type'] = Variable<int>(converter.mapToSql(type)!);
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
    Expression<LiverLevelType>? type,
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
      map['type'] = Variable<int>(converter.mapToSql(type.value)!);
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<LiverLevelType, int?> type =
      GeneratedColumn<int?>('type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<LiverLevelType>($LiverLevelHistoriesTable.$converter0);
  final VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int?> value = GeneratedColumn<int?>(
      'value', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
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
    return LiverLevelHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  PointHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.event,
      required this.point,
      required this.forginId});
  factory PointHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PointHistoryModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      event: $PointHistoriesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event']))!,
      point: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}point'])!,
      forginId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}forgin_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      final converter = $PointHistoriesTable.$converter0;
      map['event'] = Variable<int>(converter.mapToSql(event)!);
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
    Expression<PointHistoryEvent>? event,
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
      map['event'] = Variable<int>(converter.mapToSql(event.value)!);
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumnWithTypeConverter<PointHistoryEvent, int?> event =
      GeneratedColumn<int?>('event', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<PointHistoryEvent>($PointHistoriesTable.$converter0);
  final VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int?> point = GeneratedColumn<int?>(
      'point', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _forginIdMeta = const VerificationMeta('forginId');
  @override
  late final GeneratedColumn<String?> forginId = GeneratedColumn<String?>(
      'forgin_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
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
    return PointHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  SF12SurveyHistoryModel(
      {required this.hospitalVisitScheduleId,
      required this.done,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  factory SF12SurveyHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SF12SurveyHistoryModel(
      hospitalVisitScheduleId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}hospital_visit_schedule_id'])!,
      done: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
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
  late final GeneratedColumn<String?> hospitalVisitScheduleId =
      GeneratedColumn<String?>('hospital_visit_schedule_id', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES hospital_visit_schedules (id)');
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool?> done = GeneratedColumn<bool?>(
      'done', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
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
    return SF12SurveyHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  MedicationAdherenceSurveyHistoryModel(
      {required this.hospitalVisitScheduleId,
      required this.done,
      required this.id,
      required this.createdAt,
      required this.updatedAt});
  factory MedicationAdherenceSurveyHistoryModel.fromData(
      Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MedicationAdherenceSurveyHistoryModel(
      hospitalVisitScheduleId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}hospital_visit_schedule_id'])!,
      done: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
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
  late final GeneratedColumn<String?> hospitalVisitScheduleId =
      GeneratedColumn<String?>('hospital_visit_schedule_id', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES hospital_visit_schedules (id)');
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool?> done = GeneratedColumn<bool?>(
      'done', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
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
    return MedicationAdherenceSurveyHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  SF12SurveyAnswerModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.sf12SurveyHistoryId,
      required this.questionId,
      required this.answers});
  factory SF12SurveyAnswerModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SF12SurveyAnswerModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      sf12SurveyHistoryId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}sf12_survey_history_id'])!,
      questionId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question_id'])!,
      answers: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answers'])!,
    );
  }
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _sf12SurveyHistoryIdMeta =
      const VerificationMeta('sf12SurveyHistoryId');
  @override
  late final GeneratedColumn<String?> sf12SurveyHistoryId =
      GeneratedColumn<String?>('sf12_survey_history_id', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints: 'REFERENCES s_f12_survey_histories (id)');
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int?> questionId = GeneratedColumn<int?>(
      'question_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _answersMeta = const VerificationMeta('answers');
  @override
  late final GeneratedColumn<String?> answers = GeneratedColumn<String?>(
      'answers', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
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
    return SF12SurveyAnswerModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  MetabolicDiseaseModel(
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
  factory MetabolicDiseaseModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MetabolicDiseaseModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      hav: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hav']),
      antiHavConfirmedAt: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}anti_hav_confirmed_at']),
      vaccinConfirmedAt: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}vaccin_confirmed_at']),
      hbv: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hbv']),
      hbvConfirmedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hbv_confirmed_at']),
      cirrhosis: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cirrhosis']),
      hcv: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hcv']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || hav != null) {
      map['hav'] = Variable<bool?>(hav);
    }
    if (!nullToAbsent || antiHavConfirmedAt != null) {
      map['anti_hav_confirmed_at'] = Variable<DateTime?>(antiHavConfirmedAt);
    }
    if (!nullToAbsent || vaccinConfirmedAt != null) {
      map['vaccin_confirmed_at'] = Variable<DateTime?>(vaccinConfirmedAt);
    }
    if (!nullToAbsent || hbv != null) {
      map['hbv'] = Variable<bool?>(hbv);
    }
    if (!nullToAbsent || hbvConfirmedAt != null) {
      map['hbv_confirmed_at'] = Variable<DateTime?>(hbvConfirmedAt);
    }
    if (!nullToAbsent || cirrhosis != null) {
      map['cirrhosis'] = Variable<bool?>(cirrhosis);
    }
    if (!nullToAbsent || hcv != null) {
      map['hcv'] = Variable<bool?>(hcv);
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
          bool? hav,
          DateTime? antiHavConfirmedAt,
          DateTime? vaccinConfirmedAt,
          bool? hbv,
          DateTime? hbvConfirmedAt,
          bool? cirrhosis,
          bool? hcv}) =>
      MetabolicDiseaseModel(
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
    Expression<bool?>? hav,
    Expression<DateTime?>? antiHavConfirmedAt,
    Expression<DateTime?>? vaccinConfirmedAt,
    Expression<bool?>? hbv,
    Expression<DateTime?>? hbvConfirmedAt,
    Expression<bool?>? cirrhosis,
    Expression<bool?>? hcv,
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
      map['hav'] = Variable<bool?>(hav.value);
    }
    if (antiHavConfirmedAt.present) {
      map['anti_hav_confirmed_at'] =
          Variable<DateTime?>(antiHavConfirmedAt.value);
    }
    if (vaccinConfirmedAt.present) {
      map['vaccin_confirmed_at'] = Variable<DateTime?>(vaccinConfirmedAt.value);
    }
    if (hbv.present) {
      map['hbv'] = Variable<bool?>(hbv.value);
    }
    if (hbvConfirmedAt.present) {
      map['hbv_confirmed_at'] = Variable<DateTime?>(hbvConfirmedAt.value);
    }
    if (cirrhosis.present) {
      map['cirrhosis'] = Variable<bool?>(cirrhosis.value);
    }
    if (hcv.present) {
      map['hcv'] = Variable<bool?>(hcv.value);
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _havMeta = const VerificationMeta('hav');
  @override
  late final GeneratedColumn<bool?> hav = GeneratedColumn<bool?>(
      'hav', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (hav IN (0, 1))');
  final VerificationMeta _antiHavConfirmedAtMeta =
      const VerificationMeta('antiHavConfirmedAt');
  @override
  late final GeneratedColumn<DateTime?> antiHavConfirmedAt =
      GeneratedColumn<DateTime?>('anti_hav_confirmed_at', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _vaccinConfirmedAtMeta =
      const VerificationMeta('vaccinConfirmedAt');
  @override
  late final GeneratedColumn<DateTime?> vaccinConfirmedAt =
      GeneratedColumn<DateTime?>('vaccin_confirmed_at', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hbvMeta = const VerificationMeta('hbv');
  @override
  late final GeneratedColumn<bool?> hbv = GeneratedColumn<bool?>(
      'hbv', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (hbv IN (0, 1))');
  final VerificationMeta _hbvConfirmedAtMeta =
      const VerificationMeta('hbvConfirmedAt');
  @override
  late final GeneratedColumn<DateTime?> hbvConfirmedAt =
      GeneratedColumn<DateTime?>('hbv_confirmed_at', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _cirrhosisMeta = const VerificationMeta('cirrhosis');
  @override
  late final GeneratedColumn<bool?> cirrhosis = GeneratedColumn<bool?>(
      'cirrhosis', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (cirrhosis IN (0, 1))');
  final VerificationMeta _hcvMeta = const VerificationMeta('hcv');
  @override
  late final GeneratedColumn<bool?> hcv = GeneratedColumn<bool?>(
      'hcv', aliasedName, true,
      type: const BoolType(),
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
    return MetabolicDiseaseModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final int? platelet;

  /// 간효소
  final int? ast;

  /// 간효소
  final int? alt;

  /// 간효소
  final int? ggt;

  /// 빌리루빈
  final int? bilirubin;

  /// 알부민
  final int? albumin;

  /// 알파태아단백질
  final int? afp;

  /// 알부민
  final int? hbvDna;

  /// 알부민
  final int? hcvRna;

  /// 양성종양(혈관종, 낭종 등)
  final String? benignTumor;

  /// 양성종양(혈관종, 낭종 등)
  final String? dangerousNodule;
  ExaminationResultModel(
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
  factory ExaminationResultModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExaminationResultModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      platelet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}platelet']),
      ast: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ast']),
      alt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}alt']),
      ggt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ggt']),
      bilirubin: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bilirubin']),
      albumin: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}albumin']),
      afp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}afp']),
      hbvDna: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hbv_dna']),
      hcvRna: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hcv_rna']),
      benignTumor: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}benign_tumor']),
      dangerousNodule: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dangerous_nodule']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || platelet != null) {
      map['platelet'] = Variable<int?>(platelet);
    }
    if (!nullToAbsent || ast != null) {
      map['ast'] = Variable<int?>(ast);
    }
    if (!nullToAbsent || alt != null) {
      map['alt'] = Variable<int?>(alt);
    }
    if (!nullToAbsent || ggt != null) {
      map['ggt'] = Variable<int?>(ggt);
    }
    if (!nullToAbsent || bilirubin != null) {
      map['bilirubin'] = Variable<int?>(bilirubin);
    }
    if (!nullToAbsent || albumin != null) {
      map['albumin'] = Variable<int?>(albumin);
    }
    if (!nullToAbsent || afp != null) {
      map['afp'] = Variable<int?>(afp);
    }
    if (!nullToAbsent || hbvDna != null) {
      map['hbv_dna'] = Variable<int?>(hbvDna);
    }
    if (!nullToAbsent || hcvRna != null) {
      map['hcv_rna'] = Variable<int?>(hcvRna);
    }
    if (!nullToAbsent || benignTumor != null) {
      map['benign_tumor'] = Variable<String?>(benignTumor);
    }
    if (!nullToAbsent || dangerousNodule != null) {
      map['dangerous_nodule'] = Variable<String?>(dangerousNodule);
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
      platelet: serializer.fromJson<int?>(json['platelet']),
      ast: serializer.fromJson<int?>(json['ast']),
      alt: serializer.fromJson<int?>(json['alt']),
      ggt: serializer.fromJson<int?>(json['ggt']),
      bilirubin: serializer.fromJson<int?>(json['bilirubin']),
      albumin: serializer.fromJson<int?>(json['albumin']),
      afp: serializer.fromJson<int?>(json['afp']),
      hbvDna: serializer.fromJson<int?>(json['hbvDna']),
      hcvRna: serializer.fromJson<int?>(json['hcvRna']),
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
      'platelet': serializer.toJson<int?>(platelet),
      'ast': serializer.toJson<int?>(ast),
      'alt': serializer.toJson<int?>(alt),
      'ggt': serializer.toJson<int?>(ggt),
      'bilirubin': serializer.toJson<int?>(bilirubin),
      'albumin': serializer.toJson<int?>(albumin),
      'afp': serializer.toJson<int?>(afp),
      'hbvDna': serializer.toJson<int?>(hbvDna),
      'hcvRna': serializer.toJson<int?>(hcvRna),
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
          int? platelet,
          int? ast,
          int? alt,
          int? ggt,
          int? bilirubin,
          int? albumin,
          int? afp,
          int? hbvDna,
          int? hcvRna,
          String? benignTumor,
          String? dangerousNodule}) =>
      ExaminationResultModel(
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
  final Value<int?> platelet;
  final Value<int?> ast;
  final Value<int?> alt;
  final Value<int?> ggt;
  final Value<int?> bilirubin;
  final Value<int?> albumin;
  final Value<int?> afp;
  final Value<int?> hbvDna;
  final Value<int?> hcvRna;
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
    Expression<int?>? platelet,
    Expression<int?>? ast,
    Expression<int?>? alt,
    Expression<int?>? ggt,
    Expression<int?>? bilirubin,
    Expression<int?>? albumin,
    Expression<int?>? afp,
    Expression<int?>? hbvDna,
    Expression<int?>? hcvRna,
    Expression<String?>? benignTumor,
    Expression<String?>? dangerousNodule,
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
      Value<int?>? platelet,
      Value<int?>? ast,
      Value<int?>? alt,
      Value<int?>? ggt,
      Value<int?>? bilirubin,
      Value<int?>? albumin,
      Value<int?>? afp,
      Value<int?>? hbvDna,
      Value<int?>? hcvRna,
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
      map['platelet'] = Variable<int?>(platelet.value);
    }
    if (ast.present) {
      map['ast'] = Variable<int?>(ast.value);
    }
    if (alt.present) {
      map['alt'] = Variable<int?>(alt.value);
    }
    if (ggt.present) {
      map['ggt'] = Variable<int?>(ggt.value);
    }
    if (bilirubin.present) {
      map['bilirubin'] = Variable<int?>(bilirubin.value);
    }
    if (albumin.present) {
      map['albumin'] = Variable<int?>(albumin.value);
    }
    if (afp.present) {
      map['afp'] = Variable<int?>(afp.value);
    }
    if (hbvDna.present) {
      map['hbv_dna'] = Variable<int?>(hbvDna.value);
    }
    if (hcvRna.present) {
      map['hcv_rna'] = Variable<int?>(hcvRna.value);
    }
    if (benignTumor.present) {
      map['benign_tumor'] = Variable<String?>(benignTumor.value);
    }
    if (dangerousNodule.present) {
      map['dangerous_nodule'] = Variable<String?>(dangerousNodule.value);
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _plateletMeta = const VerificationMeta('platelet');
  @override
  late final GeneratedColumn<int?> platelet = GeneratedColumn<int?>(
      'platelet', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _astMeta = const VerificationMeta('ast');
  @override
  late final GeneratedColumn<int?> ast = GeneratedColumn<int?>(
      'ast', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _altMeta = const VerificationMeta('alt');
  @override
  late final GeneratedColumn<int?> alt = GeneratedColumn<int?>(
      'alt', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _ggtMeta = const VerificationMeta('ggt');
  @override
  late final GeneratedColumn<int?> ggt = GeneratedColumn<int?>(
      'ggt', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _bilirubinMeta = const VerificationMeta('bilirubin');
  @override
  late final GeneratedColumn<int?> bilirubin = GeneratedColumn<int?>(
      'bilirubin', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _albuminMeta = const VerificationMeta('albumin');
  @override
  late final GeneratedColumn<int?> albumin = GeneratedColumn<int?>(
      'albumin', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _afpMeta = const VerificationMeta('afp');
  @override
  late final GeneratedColumn<int?> afp = GeneratedColumn<int?>(
      'afp', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hbvDnaMeta = const VerificationMeta('hbvDna');
  @override
  late final GeneratedColumn<int?> hbvDna = GeneratedColumn<int?>(
      'hbv_dna', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hcvRnaMeta = const VerificationMeta('hcvRna');
  @override
  late final GeneratedColumn<int?> hcvRna = GeneratedColumn<int?>(
      'hcv_rna', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _benignTumorMeta =
      const VerificationMeta('benignTumor');
  @override
  late final GeneratedColumn<String?> benignTumor = GeneratedColumn<String?>(
      'benign_tumor', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dangerousNoduleMeta =
      const VerificationMeta('dangerousNodule');
  @override
  late final GeneratedColumn<String?> dangerousNodule =
      GeneratedColumn<String?>('dangerous_nodule', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
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
    return ExaminationResultModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  HealthQuestionModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.qusetion,
      this.doctorName,
      this.answer});
  factory HealthQuestionModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HealthQuestionModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      qusetion: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qusetion'])!,
      doctorName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}doctor_name']),
      answer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answer']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['qusetion'] = Variable<String>(qusetion);
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String?>(doctorName);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String?>(answer);
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
          String? doctorName,
          String? answer}) =>
      HealthQuestionModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        qusetion: qusetion ?? this.qusetion,
        doctorName: doctorName ?? this.doctorName,
        answer: answer ?? this.answer,
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
    Expression<String?>? doctorName,
    Expression<String?>? answer,
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
      map['doctor_name'] = Variable<String?>(doctorName.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String?>(answer.value);
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _qusetionMeta = const VerificationMeta('qusetion');
  @override
  late final GeneratedColumn<String?> qusetion = GeneratedColumn<String?>(
      'qusetion', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doctorNameMeta = const VerificationMeta('doctorName');
  @override
  late final GeneratedColumn<String?> doctorName = GeneratedColumn<String?>(
      'doctor_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String?> answer = GeneratedColumn<String?>(
      'answer', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
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
    return HealthQuestionModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  DrinkingHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.amount,
      required this.date});
  factory DrinkingHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DrinkingHistoryModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      amount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int?> amount = GeneratedColumn<int?>(
      'amount', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
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
    return DrinkingHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  SmokingHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.amount,
      required this.date});
  factory SmokingHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SmokingHistoryModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      amount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int?> amount = GeneratedColumn<int?>(
      'amount', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
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
    return SmokingHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  ExcerciseHistoryModel(
      {required this.userId,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.date,
      required this.minuite,
      required this.weight});
  factory ExcerciseHistoryModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExcerciseHistoryModel(
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      minuite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}minuite'])!,
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
    );
  }
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
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _minuiteMeta = const VerificationMeta('minuite');
  @override
  late final GeneratedColumn<int?> minuite = GeneratedColumn<int?>(
      'minuite', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
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
    return ExcerciseHistoryModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  HospitalModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.logo});
  factory HospitalModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HospitalModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      logo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logo'])!,
    );
  }
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String?> logo = GeneratedColumn<String?>(
      'logo', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
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
    return HospitalModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HospitalsTable createAlias(String alias) {
    return $HospitalsTable(attachedDatabase, alias);
  }
}

class NotificationModel extends DataClass
    implements Insertable<NotificationModel> {
  final int id;
  final String userId;
  final String scheduleId;
  final NotificationStatus status;
  final NotificationType type;
  final NotificationSubType subType;
  final DateTime reservedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  NotificationModel(
      {required this.id,
      required this.userId,
      required this.scheduleId,
      required this.status,
      required this.type,
      required this.subType,
      required this.reservedAt,
      required this.createdAt,
      required this.updatedAt});
  factory NotificationModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NotificationModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      scheduleId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_id'])!,
      status: $NotificationsTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']))!,
      type: $NotificationsTable.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      subType: $NotificationsTable.$converter2.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_type']))!,
      reservedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reserved_at'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['schedule_id'] = Variable<String>(scheduleId);
    {
      final converter = $NotificationsTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status)!);
    }
    {
      final converter = $NotificationsTable.$converter1;
      map['type'] = Variable<int>(converter.mapToSql(type)!);
    }
    {
      final converter = $NotificationsTable.$converter2;
      map['sub_type'] = Variable<int>(converter.mapToSql(subType)!);
    }
    map['reserved_at'] = Variable<DateTime>(reservedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      userId: Value(userId),
      scheduleId: Value(scheduleId),
      status: Value(status),
      type: Value(type),
      subType: Value(subType),
      reservedAt: Value(reservedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      scheduleId: serializer.fromJson<String>(json['scheduleId']),
      status: serializer.fromJson<NotificationStatus>(json['status']),
      type: serializer.fromJson<NotificationType>(json['type']),
      subType: serializer.fromJson<NotificationSubType>(json['subType']),
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
      'scheduleId': serializer.toJson<String>(scheduleId),
      'status': serializer.toJson<NotificationStatus>(status),
      'type': serializer.toJson<NotificationType>(type),
      'subType': serializer.toJson<NotificationSubType>(subType),
      'reservedAt': serializer.toJson<DateTime>(reservedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NotificationModel copyWith(
          {int? id,
          String? userId,
          String? scheduleId,
          NotificationStatus? status,
          NotificationType? type,
          NotificationSubType? subType,
          DateTime? reservedAt,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NotificationModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        scheduleId: scheduleId ?? this.scheduleId,
        status: status ?? this.status,
        type: type ?? this.type,
        subType: subType ?? this.subType,
        reservedAt: reservedAt ?? this.reservedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('subType: $subType, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, scheduleId, status, type, subType,
      reservedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.scheduleId == this.scheduleId &&
          other.status == this.status &&
          other.type == this.type &&
          other.subType == this.subType &&
          other.reservedAt == this.reservedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationsCompanion extends UpdateCompanion<NotificationModel> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> scheduleId;
  final Value<NotificationStatus> status;
  final Value<NotificationType> type;
  final Value<NotificationSubType> subType;
  final Value<DateTime> reservedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.scheduleId = const Value.absent(),
    this.status = const Value.absent(),
    this.type = const Value.absent(),
    this.subType = const Value.absent(),
    this.reservedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String scheduleId,
    required NotificationStatus status,
    required NotificationType type,
    required NotificationSubType subType,
    required DateTime reservedAt,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : userId = Value(userId),
        scheduleId = Value(scheduleId),
        status = Value(status),
        type = Value(type),
        subType = Value(subType),
        reservedAt = Value(reservedAt);
  static Insertable<NotificationModel> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? scheduleId,
    Expression<NotificationStatus>? status,
    Expression<NotificationType>? type,
    Expression<NotificationSubType>? subType,
    Expression<DateTime>? reservedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (status != null) 'status': status,
      if (type != null) 'type': type,
      if (subType != null) 'sub_type': subType,
      if (reservedAt != null) 'reserved_at': reservedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NotificationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? scheduleId,
      Value<NotificationStatus>? status,
      Value<NotificationType>? type,
      Value<NotificationSubType>? subType,
      Value<DateTime>? reservedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return NotificationsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      scheduleId: scheduleId ?? this.scheduleId,
      status: status ?? this.status,
      type: type ?? this.type,
      subType: subType ?? this.subType,
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
    if (scheduleId.present) {
      map['schedule_id'] = Variable<String>(scheduleId.value);
    }
    if (status.present) {
      final converter = $NotificationsTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status.value)!);
    }
    if (type.present) {
      final converter = $NotificationsTable.$converter1;
      map['type'] = Variable<int>(converter.mapToSql(type.value)!);
    }
    if (subType.present) {
      final converter = $NotificationsTable.$converter2;
      map['sub_type'] = Variable<int>(converter.mapToSql(subType.value)!);
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
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('subType: $subType, ')
          ..write('reservedAt: $reservedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, NotificationModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES users (id)');
  final VerificationMeta _scheduleIdMeta = const VerificationMeta('scheduleId');
  @override
  late final GeneratedColumn<String?> scheduleId = GeneratedColumn<String?>(
      'schedule_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<NotificationStatus, int?> status =
      GeneratedColumn<int?>('status', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<NotificationStatus>($NotificationsTable.$converter0);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<NotificationType, int?> type =
      GeneratedColumn<int?>('type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<NotificationType>($NotificationsTable.$converter1);
  final VerificationMeta _subTypeMeta = const VerificationMeta('subType');
  @override
  late final GeneratedColumnWithTypeConverter<NotificationSubType, int?>
      subType = GeneratedColumn<int?>('sub_type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<NotificationSubType>($NotificationsTable.$converter2);
  final VerificationMeta _reservedAtMeta = const VerificationMeta('reservedAt');
  @override
  late final GeneratedColumn<DateTime?> reservedAt = GeneratedColumn<DateTime?>(
      'reserved_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        scheduleId,
        status,
        type,
        subType,
        reservedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'notifications';
  @override
  String get actualTableName => 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<NotificationModel> instance,
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
    if (data.containsKey('schedule_id')) {
      context.handle(
          _scheduleIdMeta,
          scheduleId.isAcceptableOrUnknown(
              data['schedule_id']!, _scheduleIdMeta));
    } else if (isInserting) {
      context.missing(_scheduleIdMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_subTypeMeta, const VerificationResult.success());
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
        {scheduleId, type, subType},
      ];
  @override
  NotificationModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NotificationModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }

  static TypeConverter<NotificationStatus, int> $converter0 =
      const EnumIndexConverter<NotificationStatus>(NotificationStatus.values);
  static TypeConverter<NotificationType, int> $converter1 =
      const EnumIndexConverter<NotificationType>(NotificationType.values);
  static TypeConverter<NotificationSubType, int> $converter2 =
      const EnumIndexConverter<NotificationSubType>(NotificationSubType.values);
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
  MedicationAdherenceSurveyAnswerModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.medicationAdherenceSurveyHistoryId,
      required this.questionId,
      required this.answers});
  factory MedicationAdherenceSurveyAnswerModel.fromData(
      Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MedicationAdherenceSurveyAnswerModel(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      medicationAdherenceSurveyHistoryId: const StringType()
          .mapFromDatabaseResponse(data[
              '${effectivePrefix}medication_adherence_survey_history_id'])!,
      questionId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question_id'])!,
      answers: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answers'])!,
    );
  }
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
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      clientDefault: newCuid);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDate);
  final VerificationMeta _medicationAdherenceSurveyHistoryIdMeta =
      const VerificationMeta('medicationAdherenceSurveyHistoryId');
  @override
  late final GeneratedColumn<String?> medicationAdherenceSurveyHistoryId =
      GeneratedColumn<String?>(
          'medication_adherence_survey_history_id', aliasedName, false,
          type: const StringType(),
          requiredDuringInsert: true,
          defaultConstraints:
              'REFERENCES medication_adherence_survey_histories (id)');
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int?> questionId = GeneratedColumn<int?>(
      'question_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _answersMeta = const VerificationMeta('answers');
  @override
  late final GeneratedColumn<String?> answers = GeneratedColumn<String?>(
      'answers', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
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
    return MedicationAdherenceSurveyAnswerModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MedicationAdherenceSurveyAnswersTable createAlias(String alias) {
    return $MedicationAdherenceSurveyAnswersTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $PillsTable pills = $PillsTable(this);
  late final $PrescriptionsTable prescriptions = $PrescriptionsTable(this);
  late final $MedicationInformationsTable medicationInformations =
      $MedicationInformationsTable(this);
  late final $MedicationSchedulesTable medicationSchedules =
      $MedicationSchedulesTable(this);
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
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $MedicationAdherenceSurveyAnswersTable
      medicationAdherenceSurveyAnswers =
      $MedicationAdherenceSurveyAnswersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        pills,
        prescriptions,
        medicationInformations,
        medicationSchedules,
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
        notifications,
        medicationAdherenceSurveyAnswers
      ];
}
