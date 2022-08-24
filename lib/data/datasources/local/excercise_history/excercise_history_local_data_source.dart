// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/models/excercise_history/excercise_history_average.dart';

abstract class ExcerciseHistoryLocalDataSource {
  Future<List<ExcerciseHistoryModel>> getExcerciseHistories({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<ExcerciseHistoryModel> upsertExcerciseHistory({
    required String userId,
    required ExcerciseHistoriesCompanion companion,
  });

  Future<ExcerciseHistoryAverage> getExcerciseHistoryAverage({
    required String id,
    required String userId,
  });
}

class ExcerciseHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements ExcerciseHistoryLocalDataSource {
  ExcerciseHistoryLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.excerciseHistories;

  @override
  Future<List<ExcerciseHistoryModel>> getExcerciseHistories({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    // await delete(table).go();
    return (select(table)
          ..where((tbl) => tbl.userId.equals(userId))
          ..where((tbl) => tbl.date.isBetweenValues(startAt, endAt))
          ..orderBy(
            [(tbl) => OrderingTerm.asc(tbl.date)],
          ))
        .get();
  }

  @override
  Future<ExcerciseHistoryAverage> getExcerciseHistoryAverage({
    required String id,
    required String userId,
  }) async {
    final excerciseHistoryModel = await (select(table)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.userId.equals(userId)))
        .getSingleOrNull();
    if (excerciseHistoryModel == null) {
      return ExcerciseHistoryAverage(excerciseHistoryId: id, average: 0);
    } else {
      final startAt = excerciseHistoryModel.date.add(const Duration(days: -30));
      final endAt = excerciseHistoryModel.date;
      final excerciseHistoryModels = await (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..where((tbl) => tbl.date.isBetweenValues(startAt, endAt)))
          .get();

      final average = excerciseHistoryModels.isEmpty
          ? .0
          : excerciseHistoryModels.fold<int>(
                0,
                (previousValue, element) => previousValue + element.minuite,
              ) /
              30;

      return ExcerciseHistoryAverage(excerciseHistoryId: id, average: average);
    }
  }

  @override
  Future<ExcerciseHistoryModel> upsertExcerciseHistory({
    required String userId,
    required ExcerciseHistoriesCompanion companion,
  }) =>
      into(table).insertReturning(
        companion,
        onConflict: DoUpdate(
          (old) => ExcerciseHistoriesCompanion.custom(
            minuite: Constant(companion.minuite.value),
            weight: Constant(companion.weight.value),
            updatedAt: Constant(DateTime.now()),
          ),
          target: [
            table.userId,
            table.date,
          ],
        ),
      );
}
