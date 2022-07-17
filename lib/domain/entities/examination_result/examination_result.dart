import 'package:equatable/equatable.dart';

class ExaminationResult extends Equatable {
  const ExaminationResult({
    required this.id,
    required this.examinedAt,
    required this.platelet,
    required this.ast,
    required this.atl,
    required this.ggt,
    required this.bilirubin,
    required this.albumin,
    required this.afp,
    required this.hbvDna,
    required this.hcvDna,
    required this.fattyLiver,
    required this.benignTumor,
    required this.dangerousNodule,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExaminationResult.fromJson(Map<String, dynamic> json) =>
      ExaminationResult(
        id: json['id'] as String,
        platelet: json['platelet'] as int,
        ast: json['ast'] as int,
        atl: json['atl'] as int,
        ggt: json['ggt'] as int,
        bilirubin: json['bilirubin'] as int,
        albumin: json['albumin'] as int,
        afp: json['afp'] as int,
        hbvDna: json['hbvDna'] as int,
        hcvDna: json['hcvDna'] as int,
        fattyLiver: json['fattyLiver'] as bool,
        benignTumor: json['benignTumor'] as bool,
        dangerousNodule: json['dangerousNodule'] as bool,
        examinedAt:
            DateTime.fromMillisecondsSinceEpoch(json['examinedAt'] as int),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final String id;

  /// 검사일
  final DateTime examinedAt;

  /// 혈소판
  final int platelet;

  /// 간효소
  final int ast;

  /// 간효소
  final int atl;

  /// 간효소
  final int ggt;

  /// 빌리루빈
  final int bilirubin;

  /// 알부민
  final int albumin;

  /// 알파태아단백질
  final int afp;

  /// 알부민
  final int hbvDna;

  /// 알부민
  final int hcvDna;

  /// 지방간
  final bool fattyLiver;

  /// 양성종양(혈관종, 낭종 등)
  final bool benignTumor;

  /// 양성종양(혈관종, 낭종 등)
  final bool dangerousNodule;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        examinedAt,
        platelet,
        ast,
        atl,
        ggt,
        bilirubin,
        albumin,
        afp,
        hbvDna,
        hcvDna,
        fattyLiver,
        benignTumor,
        dangerousNodule,
        createdAt,
        updatedAt,
      ];
}
