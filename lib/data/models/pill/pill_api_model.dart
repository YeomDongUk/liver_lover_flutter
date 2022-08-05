// Package imports:
import 'package:equatable/equatable.dart';

class PillApiModel extends Equatable {
  const PillApiModel({
    required this.id,
    required this.name,
    required this.entpName,
    required this.imageUrl,
  });

  factory PillApiModel.fromJson(Map<String, dynamic> json) => PillApiModel(
        id: json['ITEM_SEQ'] as String? ?? '',
        name: json['ITEM_NAME'] as String? ?? '',
        entpName: json['ENTP_SEQ'] as String? ?? '',
        imageUrl: json['ITEM_IMAGE'] as String? ?? '',
      );

  final String id;
  final String name;
  final String entpName;
  final String imageUrl;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'entpName': entpName,
        'imageUrl': imageUrl,
      };
  @override
  List<Object> get props => [
        id,
        name,
        entpName,
        imageUrl,
      ];

//   "ITEM_SEQ": "200808876",
// "ITEM_NAME": "가스디알정50밀리그램(디메크로틴산마그네슘)",
// "ENTP_SEQ": "19540006",
// "ITEM_IMAGE": "https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/147426403087300104",
}
