// Dart imports:
import 'dart:async';

// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class UserPointLocalDataSource {
  Stream<UserPointModel> getUserPoint(String userId);
  Future<void> addUserPoint({
    required String eventId,
    required String userId,
    required PointHistoryEvent event,
    required int point,
  });
}

class UserPointLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements UserPointLocalDataSource {
  UserPointLocalDataSourceImpl(super.attachedDatabase);

  late final $UserPointsTable table = attachedDatabase.userPoints;

  @override
  Stream<UserPointModel> getUserPoint(String userId) =>
      (select(table)..where((tbl) => tbl.userId.equals(userId))).watchSingle();

  @override
  Future<void> addUserPoint({
    required String eventId,
    required String userId,
    required PointHistoryEvent event,
    required int point,
  }) async {
    final userPoint = await (select(table)
          ..where((tbl) => tbl.userId.equals(userId)))
        .getSingle();

    await (update(table)..where((tbl) => tbl.userId.equals(userId))).write(
      userPoint.copyWith(
        point: userPoint.point + point,
      ),
    );

    await into(pointHistories).insert(
      PointHistoriesCompanion.insert(
        userId: userId,
        event: event,
        point: point,
        forginId: eventId,
      ),
    );
    return;
  }
}
