// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/models/drinking_history/drinking_history_avergage.dart';

abstract class DrinkingHistoryLocalDataSource {
  Future<List<DrinkingHistoryModel>> getDrinkingHistories({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<DrinkingHistoryModel> upsertDrinkingHistory({
    required String userId,
    required DrinkingHistoriesCompanion companion,
  });

  Future<DrinkingHistoryAverage> getDrinkingHistoryAverage({
    required String id,
    required String userId,
  });

  Stream<DrinkingHistoryModel?> getLastDrinkingHistoryStream({
    required String userId,
  });
}

class DrinkingHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements DrinkingHistoryLocalDataSource {
  DrinkingHistoryLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.drinkingHistories;
  @override
  Future<List<DrinkingHistoryModel>> getDrinkingHistories({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  }) =>
      (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..where((tbl) => tbl.date.isBetweenValues(startAt, endAt))
            ..orderBy(
              [(tbl) => OrderingTerm.asc(tbl.date)],
            ))
          .get();

  @override
  Future<DrinkingHistoryAverage> getDrinkingHistoryAverage({
    required String id,
    required String userId,
  }) async {
    final drinkingHistoryModel = await (select(table)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.userId.equals(userId)))
        .getSingleOrNull();
    if (drinkingHistoryModel == null) {
      return DrinkingHistoryAverage(drikingHistoryId: id, average: 0);
    } else {
      final startAt = drinkingHistoryModel.date.add(const Duration(days: -30));
      final endAt = drinkingHistoryModel.date;
      final drinkingHistoryModels = await (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..where((tbl) => tbl.date.isBetweenValues(startAt, endAt)))
          .get();

      final average = drinkingHistoryModels.isEmpty
          ? .0
          : drinkingHistoryModels.fold<int>(
                0,
                (previousValue, element) => previousValue + element.amount,
              ) /
              30;

      return DrinkingHistoryAverage(drikingHistoryId: id, average: average);
    }
  }

  @override
  Future<DrinkingHistoryModel> upsertDrinkingHistory({
    required String userId,
    required DrinkingHistoriesCompanion companion,
  }) =>
      into(table).insertReturning(
        companion,
        onConflict: DoUpdate(
          (old) => DrinkingHistoriesCompanion.custom(
            amount: Constant(companion.amount.value),
            updatedAt: Constant(DateTime.now()),
          ),
          target: [
            table.userId,
            table.date,
          ],
        ),
      );

  @override
  Stream<DrinkingHistoryModel?> getLastDrinkingHistoryStream({
    required String userId,
  }) =>
      (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..orderBy([(u) => OrderingTerm.desc(u.createdAt)])
            ..limit(1))
          .watchSingleOrNull();
}
