// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class MetabolicDiseaseLocalDataSource {
  Future<MetabolicDiseaseModel> getMetabolicDisease({required String userId});
  Future<void> upsertMetabolicDisease({
    required String userId,
    required MetabolicDiseasesCompanion companion,
  });
}

class MetabolicDiseaseLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements MetabolicDiseaseLocalDataSource {
  MetabolicDiseaseLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.metabolicDiseases;

  @override
  Future<MetabolicDiseaseModel> getMetabolicDisease({
    required String userId,
  }) =>
      (select(table)..where((tbl) => tbl.userId.equals(userId))).getSingle();

  @override
  Future<void> upsertMetabolicDisease({
    required String userId,
    required MetabolicDiseasesCompanion companion,
  }) =>
      into(table).insertReturning(
        companion.copyWith(userId: Value(userId)),
        onConflict: DoUpdate(
          (old) => companion,
          target: [
            table.userId,
          ],
        ),
      );
}
