// Package imports:
import 'package:equatable/equatable.dart';

class ExaminationResult extends Equatable {
  const ExaminationResult({
    required this.id,
    required this.date,
    required this.platelet,
    required this.ast,
    required this.alt,
    required this.ggt,
    required this.bilirubin,
    required this.albumin,
    required this.afp,
    required this.hbvDna,
    required this.hcvRna,
    required this.benignTumor,
    required this.dangerousNodule,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExaminationResult.fromJson(Map<String, dynamic> json) =>
      ExaminationResult(
        id: json['id'] as String,
        platelet:
            json['platelet'] == null ? null : (json['platelet'] as int) / 1000,
        ast: json['ast'] == null ? null : (json['ast'] as int) / 1000,
        alt: json['alt'] == null ? null : (json['alt'] as int) / 1000,
        ggt: json['ggt'] == null ? null : (json['ggt'] as int) / 1000,
        bilirubin: json['bilirubin'] == null
            ? null
            : (json['bilirubin'] as int) / 1000,
        albumin:
            json['albumin'] == null ? null : (json['albumin'] as int) / 1000,
        afp: json['afp'] == null ? null : (json['afp'] as int) / 1000,
        hbvDna: json['hbvDna'] == null ? null : (json['hbvDna'] as int) / 1000,
        hcvRna: json['hcvRna'] == null ? null : (json['hcvRna'] as int) / 1000,
        benignTumor: json['benignTumor'] as String?,
        dangerousNodule: json['dangerousNodule'] as String?,
        date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final String id;

  /// 혈소판
  final double? platelet;

  /// 간효소
  final double? ast;

  /// 간효소
  final double? alt;

  /// 간효소
  final double? ggt;

  /// 빌리루빈
  final double? bilirubin;

  /// 알부민
  final double? albumin;

  /// 알파태아단백질
  final double? afp;

  /// 알부민
  final double? hbvDna;

  /// 알부민
  final double? hcvRna;

  /// 양성종양(혈관종, 낭종 등)
  final String? benignTumor;

  /// 양성종양(혈관종, 낭종 등)
  final String? dangerousNodule;

  /// 검사일
  final DateTime date;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  ExaminationResult copyWith({
    double? platelet,
    double? ast,
    double? alt,
    double? ggt,
    double? bilirubin,
    double? albumin,
    double? afp,
    double? hbvDna,
    double? hcvRna,
    String? benignTumor,
    String? dangerousNodule,
  }) =>
      ExaminationResult(
        id: id,
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
        date: date,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
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
        dangerousNodule,
        createdAt,
        updatedAt,
      ];
}
