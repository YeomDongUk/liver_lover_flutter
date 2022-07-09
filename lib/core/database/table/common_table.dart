import 'package:cuid/cuid.dart';
import 'package:drift/drift.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/database/table/user/user_table.dart';

abstract class CommonTable extends Table {
  /// 아이디
  TextColumn get id => text().clientDefault(newCuid)();

  /// 생성일
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();

  /// 수정일
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();

  @override
  Set<Column>? get primaryKey => {
        id,
      };
}

abstract class UserReferenceTable extends CommonTable {
  /// 유저 아이디
  TextColumn get userId => text().references(Users, #id)();
}

abstract class CommonSurveyHistoryTable extends CommonTable {
  TextColumn get hospitalVisitScheduleId =>
      text().references(HospitalVisitSchedules, #id)();
  BoolColumn get done => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          hospitalVisitScheduleId,
        }
      ];
}
