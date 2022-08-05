// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('ExaminationResultModel')
class ExaminationResults extends UserReferenceTable {
  /// 검사일
  DateTimeColumn get date => dateTime()();

  /// 혈소판
  IntColumn get platelet => integer().nullable()();

  /// 간효소
  IntColumn get ast => integer().nullable()();

  /// 간효소
  IntColumn get alt => integer().nullable()();

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
  IntColumn get hcvRna => integer().nullable()();

  /// 양성종양(혈관종, 낭종 등)
  TextColumn get benignTumor => text().nullable()();

  /// 양성종양(혈관종, 낭종 등)
  TextColumn get dangerousNodule => text().nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          date,
        }
      ];
}
