// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('ExaminationResultModel')
class ExaminationResults extends UserReferenceTable {
  /// 검사일
  DateTimeColumn get date => dateTime()();

  /// 혈소판
  TextColumn get platelet => text().nullable()();

  /// 간효소
  TextColumn get ast => text().nullable()();

  /// 간효소
  TextColumn get alt => text().nullable()();

  /// 간효소
  TextColumn get ggt => text().nullable()();

  /// 빌리루빈
  TextColumn get bilirubin => text().nullable()();

  /// 알부민
  TextColumn get albumin => text().nullable()();

  /// 알파태아단백질
  TextColumn get afp => text().nullable()();

  /// hbvDna
  TextColumn get hbvDna => text().nullable()();

  /// hcvRna
  TextColumn get hcvRna => text().nullable()();

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
