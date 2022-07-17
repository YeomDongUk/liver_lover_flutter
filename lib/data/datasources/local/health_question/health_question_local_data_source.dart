import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class HealthQuestionLocalDataSource {
  Future<List<HealthQuestionModel>> getHealthQuestions({
    required String userId,
  });

  Future<HealthQuestionModel> upsertHealthQuestions({
    required String userId,
    required HealthQuestionsCompanion companion,
  });
  Future<HealthQuestionModel> updateHealthQuestion({
    required String userId,
    required HealthQuestionsCompanion companion,
  });

  Future<void> deleteHealthQuestion({
    required String id,
    required String userId,
  });
}

class HealthQuestionLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements HealthQuestionLocalDataSource {
  HealthQuestionLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.healthQuestions;

  @override
  Future<List<HealthQuestionModel>> getHealthQuestions({
    required String userId,
  }) =>
      (select(table)..where((t) => t.userId.equals(userId))).get();

  @override
  Future<HealthQuestionModel> upsertHealthQuestions({
    required String userId,
    required HealthQuestionsCompanion companion,
  }) async {
    if (companion.id == const Value<String>.absent()) {
      return into(table).insertReturning(
        companion.copyWith(
          userId: Value(userId),
        ),
      );
    } else {
      final id = companion.id.value;
      await (update(table)
            ..where(
              (tbl) => tbl.id.equals(id),
            )
            ..where((tbl) => tbl.userId.equals(userId)))
          .write(companion);
      return (select(table)
            ..where((tbl) => tbl.id.equals(id))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .getSingle();
    }
  }

  @override
  Future<void> deleteHealthQuestion({
    required String id,
    required String userId,
  }) =>
      (delete(table)
            ..where((tbl) => tbl.id.equals(id))
            ..where((tbl) => tbl.userId.equals(userId)))
          .go();

  @override
  Future<HealthQuestionModel> updateHealthQuestion({
    required String userId,
    required HealthQuestionsCompanion companion,
  }) async {
    await (update(table)
          ..where((tbl) => tbl.id.equals(companion.id.value))
          ..where((tbl) => tbl.userId.equals(userId)))
        .write(companion);

    return (select(table)
          ..where((tbl) => tbl.id.equals(companion.id.value))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .getSingle();
  }
}
