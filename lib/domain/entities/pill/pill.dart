// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:equatable/equatable.dart';

class Pill extends Equatable {
  const Pill({
    required this.id,
    required this.name,
    required this.entpName,
    required this.image,
    required this.material,
    required this.effect,
    required this.useage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pill.fromJson(Map<String, dynamic> json) => Pill(
        id: json['id'] as String,
        entpName: json['entpName'] as String,
        name: json['name'] as String,
        material: json['material'] as String?,
        image: json['image'] as Uint8List?,
        effect: json['effect'] as String?,
        useage: json['useage'] as String?,
        createdAt: json['createdAt'] == null
            ? DateTime.now()
            : DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt: json['createdAt'] == null
            ? DateTime.now()
            : DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final String id;
  final String entpName;
  final String name;
  final String? material;
  final Uint8List? image;
  final String? effect;
  final String? useage;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;
  @override
  List<Object?> get props => [
        id,
        entpName,
        name,
        material,
        image,
        effect,
        useage,
        createdAt,
        updatedAt,
      ];
}
