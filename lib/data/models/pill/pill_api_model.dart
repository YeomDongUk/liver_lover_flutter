// Package imports:
import 'package:equatable/equatable.dart';

class PillSearchResult extends Equatable {
  const PillSearchResult({
    required this.id,
    required this.name,
    required this.entpName,
  });

  factory PillSearchResult.fromJson(Map<String, dynamic> json) =>
      PillSearchResult(
        id: json['ITEM_SEQ'] as String? ?? '',
        name: json['ITEM_NAME'] as String? ?? '',
        entpName: json['ENTP_NAME'] as String? ?? '',
      );

  final String id;
  final String name;
  final String entpName;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'entpName': entpName,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        entpName,
      ];


}
