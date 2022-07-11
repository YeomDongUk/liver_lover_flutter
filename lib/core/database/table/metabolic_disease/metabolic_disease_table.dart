import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('MetabolicDiseaseModel')
class MetabolicDiseases extends UserReferenceTable {
  /// A형 간염 여부
  BoolColumn get hav => boolean().nullable()();

  /// A형 간염 항체 보유 확인일
  DateTimeColumn get antiHavConfirmedAt => dateTime().nullable()();

  /// A형 간염 예방 접종 완료 확인일
  DateTimeColumn get vaccinConfirmedAt => dateTime().nullable()();

  /// B형 간염 여부
  BoolColumn get hbv => boolean().nullable()();

  /// B형 간염확인일
  DateTimeColumn get hbvConfirmedAt => dateTime().nullable()();

  /// B형 간염 바이러스 비활동성 보유상태 확인일
  DateTimeColumn get hbvInactivityConfirmedAt => dateTime().nullable()();

  /// 만성 B형 간염 확인일
  DateTimeColumn get chronicHbvConfirmedAt => dateTime().nullable()();

  /// 간경병증 확인일
  DateTimeColumn get cirrhosisConfirmedAt => dateTime().nullable()();

  /// C형 간염 여부
  BoolColumn get hcv => boolean().nullable()();

  ///  지방간 여부
  BoolColumn get fattyRiver => boolean().nullable()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
        }
      ];
}
