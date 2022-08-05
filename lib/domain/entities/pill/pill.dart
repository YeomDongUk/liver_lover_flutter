// Package imports:
import 'package:equatable/equatable.dart';

class Pill extends Equatable {
  const Pill({
    required this.id,
    required this.name,
    required this.entpName,
    required this.imageUrl,
  });

  factory Pill.fromJson(Map<String, dynamic> json) => Pill(
        id: json['id'] as String,
        name: json['name'] as String,
        entpName: json['entpName'] as String,
        imageUrl: json['imageUrl'] as String,
      );

  final String id;
  final String name;
  final String entpName;
  final String imageUrl;

  @override
  List<Object> get props => [
        id,
        name,
        entpName,
        imageUrl,
      ];
}
