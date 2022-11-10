// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/models/smoking_history/smoking_history_average.dart';

abstract class SmokingHistoryLocalDataSource {
  Future<List<SmokingHistoryModel>> getSmokingHistories({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<SmokingHistoryModel> upsertSmokingHistory({
    required String userId,
    required SmokingHistoriesCompanion companion,
  });

  Future<SmokingHistoryAverage> getSmokingHistoryAverage({
    required String id,
    required String userId,
  });

  Stream<SmokingHistoryModel?> getLastSmokingHistoryStream({
    required String userId,
  });
}

class SmokingHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase> implements SmokingHistoryLocalDataSource {
  SmokingHistoryLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.smokingHistories;

  @override
  Future<List<SmokingHistoryModel>> getSmokingHistories({
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
  Future<SmokingHistoryAverage> getSmokingHistoryAverage({
    required String id,
    required String userId,
  }) async {
    final smokingHistoryModel = await (select(table)
          ..where((tbl) => tbl.id.equals(id))
          ..where((tbl) => tbl.userId.equals(userId)))
        .getSingleOrNull();
    if (smokingHistoryModel == null) {
      return SmokingHistoryAverage(smokingHistoryId: id, average: 0);
    } else {
      final startAt = smokingHistoryModel.date.add(const Duration(days: -30));
      final endAt = smokingHistoryModel.date;
      final smokingHistoryModels = await (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..where((tbl) => tbl.date.isBetweenValues(startAt, endAt)))
          .get();

      final average = smokingHistoryModels.isEmpty
          ? .0
          : smokingHistoryModels.fold<int>(
                0,
                (previousValue, element) => previousValue + element.amount,
              ) /
              30;

      return SmokingHistoryAverage(smokingHistoryId: id, average: average);
    }
  }

  @override
  Future<SmokingHistoryModel> upsertSmokingHistory({
    required String userId,
    required SmokingHistoriesCompanion companion,
  }) =>
      into(table).insertReturning(
        companion,
        onConflict: DoUpdate(
          (old) => SmokingHistoriesCompanion.custom(
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
  Stream<SmokingHistoryModel?> getLastSmokingHistoryStream({
    required String userId,
  }) =>
      (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..orderBy([(u) => OrderingTerm.desc(u.date)])
            ..limit(1))
          .watchSingleOrNull();
}
