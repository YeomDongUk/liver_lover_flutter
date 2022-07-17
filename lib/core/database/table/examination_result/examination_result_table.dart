import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('ExaminationResultModel')
class ExaminationResults extends UserReferenceTable {
  /// 검사일
  DateTimeColumn get examinedAt => dateTime()();

  /// 혈소판
  IntColumn get platelet => integer().nullable()();

  /// 간효소
  IntColumn get ast => integer().nullable()();

  /// 간효소
  IntColumn get atl => integer().nullable()();

  /// 간효소
  IntColumn get ggt => integer().nullable()();

  /// 빌리루빈
  IntColumn get bilirubin => integer().nullable()();

  /// 알부민
  IntColumn get albumin => integer().nullable()();

  /// 알파태아단백질
  IntColumn get afp => integer().nullable()();

  /// 알부민
  IntColumn get hbvDna => integer().nullable()();

  /// 알부민
  IntColumn get hcvDna => integer().nullable()();

  /// 지방간
  BoolColumn get fattyLiver => boolean().nullable()();

  /// 양성종양(혈관종, 낭종 등)
  BoolColumn get benignTumor => boolean().nullable()();

  /// 양성종양(혈관종, 낭종 등)
  BoolColumn get dangerousNodule => boolean().nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          examinedAt,
        }
      ];
}
