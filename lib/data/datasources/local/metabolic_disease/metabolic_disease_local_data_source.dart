import 'package:drift/drift.dart';
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
      into(table).insertOnConflictUpdate(
        companion.copyWith(
          userId: companion.userId == const Value<String>.absent()
              ? Value(userId)
              : companion.userId,
        ),
      );
}
