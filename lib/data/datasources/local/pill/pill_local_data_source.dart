// Package imports:
import 'package:drift/drift.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/remote/pill/pill_remote_data_source.dart';
import 'package:yak/data/models/pill/pill_api_model.dart';

abstract class PillLocalDataSource {
  Future<PillModel> getPill(String id);
  Future<PillModel?> getPillOrNull(String id);
  Future<List<PillModel>> getPills(String name);
  Future<List<PillModel>> getPillsInIds(List<String> ids);
  Future<PillModel> createPill(PillsCompanion companion);
  Future<List<PillModel>> createPills(Iterable<PillsCompanion> companions);
  Future<void> initCommonPills();
}

class PillLocalDataSourceImpl extends DatabaseAccessor<AppDatabase> implements PillLocalDataSource {
  PillLocalDataSourceImpl(super.attachedDatabase);

  $PillsTable get table => attachedDatabase.pills;

  @override
  Future<PillModel> getPill(String id) => (select(table)..where((p) => p.id.equals(id))).getSingle();

  @override
  Future<PillModel?> getPillOrNull(String id) => (select(table)..where((p) => p.id.equals(id))).getSingleOrNull();

  @override
  Future<PillModel> createPill(PillsCompanion companion) =>
      into(table).insertOnConflictUpdate(companion).then((value) => getPill(companion.id.value));

  @override
  Future<List<PillModel>> getPills(String name) => (select(table)..where((p) => p.name.like('%$name%'))).get();

  @override
  Future<List<PillModel>> createPills(
    Iterable<PillsCompanion> companions,
  ) async {
    await attachedDatabase.batch(
      (batch) async => batch.insertAllOnConflictUpdate(table, companions),
    );

    return (select(table)..where((p) => p.id.isIn(companions.map((e) => e.id.value)))).get();
  }

  @override
  Future<List<PillModel>> getPillsInIds(List<String> ids) => (select(table)..where((p) => p.id.isIn(ids))).get();

  @override
  Future<void> initCommonPills() {
    return attachedDatabase.batch(
      (batch) async {
        final pillSearchResults = await Future.wait(
          [
            PillsCompanion.insert(
              id: const Value('201004172'),
              name: '????????????',
              entpName: '?????????????????????????????????(???)',
            ),
            PillsCompanion.insert(
              id: const Value('200605263'),
              name: '???????????????',
              entpName: '(???)????????????????????????',
            ),
            PillsCompanion.insert(
              id: const Value('201702418'),
              name: '????????????',
              entpName: '?????????????????????????????????(???)',
            ),
            PillsCompanion.insert(
              id: const Value('201800200'),
              name: '?????????',
              entpName: '???????????????(???)',
            ),
          ].map((companion) => KiwiContainer().resolve<PillRemoteDataSource>().findPillById(companion.id.value)),
        );

        final companions = await Future.wait(
          List<PillSearchResult>.from(pillSearchResults.where((pillSearchResult) => pillSearchResult != null))
              .map(KiwiContainer().resolve<PillRemoteDataSource>().findPill)
              .toList(),
        );

        batch.insertAllOnConflictUpdate(table, companions);
      },
    );
  }
}
