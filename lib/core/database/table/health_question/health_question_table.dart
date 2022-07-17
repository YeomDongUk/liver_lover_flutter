import 'package:drift/drift.dart';
import 'package:yak/core/database/table/common_table.dart';

@DataClassName('HealthQuestionModel')
class HealthQuestions extends UserReferenceTable {
  TextColumn get qusetion => text()();
  TextColumn get doctorName => text().nullable()();
  TextColumn get answer => text().nullable()();
}
