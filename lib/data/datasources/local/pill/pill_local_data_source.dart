import 'package:drift/drift.dart';
import 'package:yak/core/database/database.dart';

abstract class PillLocalDataSource {
  Future<PillModel> getPill(String id);
  Future<List<PillModel>> getPills(String name);
  Future<PillModel> createPill(PillsCompanion companion);
  Future<List<PillModel>> createPills(Iterable<PillsCompanion> companions);
}

class PillLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements PillLocalDataSource {
  PillLocalDataSourceImpl(super.attachedDatabase);

  $PillsTable get table => attachedDatabase.pills;

  @override
  Future<PillModel> getPill(String id) =>
      (select(table)..where((p) => p.id.equals(id))).getSingle();

  @override
  Future<PillModel> createPill(PillsCompanion companion) => into(table)
      .insertOnConflictUpdate(companion)
      .then((value) => getPill(companion.id.value));

  @override
  Future<List<PillModel>> getPills(String name) =>
      (select(table)..where((p) => p.name.like('%$name%'))).get();

  @override
  Future<List<PillModel>> createPills(
    Iterable<PillsCompanion> companions,
  ) async {
    await attachedDatabase.batch(
      (batch) async => batch.insertAllOnConflictUpdate(table, companions),
    );

    return (select(table)
          ..where((p) => p.id.isIn(companions.map((e) => e.id.value))))
        .get();
  }
}
