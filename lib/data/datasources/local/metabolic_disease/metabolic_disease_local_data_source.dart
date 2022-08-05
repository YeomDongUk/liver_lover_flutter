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
  }) async {
    try {
      await getMetabolicDisease(userId: userId);
      await (update(table)..where((tbl) => tbl.userId.equals(userId)))
          .write(companion);
    } catch (e) {
      await into(table).insert(
        companion.copyWith(
          userId: companion.userId == const Value<String>.absent()
              ? Value(userId)
              : companion.userId,
        ),
      );
    }
  }
}
