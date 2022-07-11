import 'package:equatable/equatable.dart';

class MetabolicDisease extends Equatable {
  const MetabolicDisease({
    required this.id,
    required this.hav,
    required this.antiHavConfirmedAt,
    required this.vaccinConfirmedAt,
    required this.hbv,
    required this.hbvConfirmedAt,
    required this.hbvInactivityConfirmedAt,
    required this.chronicHbvConfirmedAt,
    required this.cirrhosisConfirmedAt,
    required this.hcv,
    required this.fattyRiver,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MetabolicDisease.undefined() => MetabolicDisease(
        id: '-',
        hav: null,
        antiHavConfirmedAt: null,
        vaccinConfirmedAt: null,
        hbv: null,
        hbvConfirmedAt: null,
        hbvInactivityConfirmedAt: null,
        chronicHbvConfirmedAt: null,
        cirrhosisConfirmedAt: null,
        hcv: null,
        fattyRiver: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory MetabolicDisease.fromJson(Map<String, dynamic> json) =>
      MetabolicDisease(
        id: json['id'] as String,
        hav: json['hav'] as bool?,
        antiHavConfirmedAt: json['antiHavConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['antiHavConfirmedAt'] as int,
              ),
        vaccinConfirmedAt: json['vaccinConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['vaccinConfirmedAt'] as int,
              ),
        hbv: json['hbv'] as bool?,
        hbvConfirmedAt: json['hbvConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['hbvConfirmedAt'] as int,
              ),
        hbvInactivityConfirmedAt: json['hbvInactivityConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['hbvInactivityConfirmedAt'] as int,
              ),
        chronicHbvConfirmedAt: json['chronicHbvConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['chronicHbvConfirmedAt'] as int,
              ),
        cirrhosisConfirmedAt: json['cirrhosisConfirmedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['cirrhosisConfirmedAt'] as int,
              ),
        hcv: json['hcv'] as bool?,
        fattyRiver: json['fattyRiver'] as bool?,
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
        updatedAt:
            DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      );

  /// 아이디
  final String id;

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

  /// B형 간염 바이러스 비활동성 보유상태 확인일
  final DateTime? hbvInactivityConfirmedAt;

  /// 만성 B형 간염 확인일
  final DateTime? chronicHbvConfirmedAt;

  /// 간경병증 확인일
  final DateTime? cirrhosisConfirmedAt;

  /// C형 간염 여부
  final bool? hcv;

  ///  지방간 여부
  final bool? fattyRiver;

  /// 생성일
  final DateTime createdAt;

  /// 수정일
  final DateTime updatedAt;

  MetabolicDisease copyWith({
    bool? hav,
    DateTime? antiHavConfirmedAt,
    DateTime? vaccinConfirmedAt,
    bool? hbv,
    DateTime? hbvConfirmedAt,
    DateTime? hbvInactivityConfirmedAt,
    DateTime? chronicHbvConfirmedAt,
    DateTime? cirrhosisConfirmedAt,
    bool? hcv,
    bool? fattyRiver,
  }) =>
      MetabolicDisease(
        id: id,
        hav: hav ?? this.hav,
        antiHavConfirmedAt: antiHavConfirmedAt ?? this.antiHavConfirmedAt,
        vaccinConfirmedAt: vaccinConfirmedAt ?? this.vaccinConfirmedAt,
        hbv: hbv ?? this.hbv,
        hbvConfirmedAt: hbvConfirmedAt ?? this.hbvConfirmedAt,
        hbvInactivityConfirmedAt:
            hbvInactivityConfirmedAt ?? this.hbvInactivityConfirmedAt,
        chronicHbvConfirmedAt:
            chronicHbvConfirmedAt ?? this.chronicHbvConfirmedAt,
        cirrhosisConfirmedAt: cirrhosisConfirmedAt ?? this.cirrhosisConfirmedAt,
        hcv: hcv ?? this.hcv,
        fattyRiver: fattyRiver ?? this.fattyRiver,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        hav,
        antiHavConfirmedAt,
        vaccinConfirmedAt,
        hbv,
        hbvConfirmedAt,
        hbvInactivityConfirmedAt,
        chronicHbvConfirmedAt,
        cirrhosisConfirmedAt,
        hcv,
        fattyRiver,
        createdAt,
        updatedAt,
      ];
}
