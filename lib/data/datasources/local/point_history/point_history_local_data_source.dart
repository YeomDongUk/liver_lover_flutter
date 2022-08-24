// Dart imports:
import 'dart:async';

// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

abstract class PointHistoryLocalDataSource {
  void initSubscription({required String userId});

  Future<List<PointHistoryModel>> getPointHistories({
    required String userId,
    required int? cursor,
  });
}

class PointHistoryLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
    implements PointHistoryLocalDataSource {
  PointHistoryLocalDataSourceImpl(super.attachedDatabase);
  StreamSubscription? _subscription;
  late final table = attachedDatabase.pointHistories;

  @override
  void initSubscription({required String userId}) {
    _subscription?.cancel();

    _subscription = (select(table)
          ..where(
            (tbl) => tbl.userId.equals(userId),
          )
          ..orderBy([(u) => OrderingTerm.desc(u.createdAt)])
          ..limit(1))
        .watchSingleOrNull()
        .listen((pointHistory) async {
      if (pointHistory == null) return;

      final results = await Future.wait([
        (select(userPoints)..where((tbl) => tbl.userId.equals(userId)))
            .getSingle(),
        (select(hospitalVisitSchedules)
              ..where(
                (tbl) =>
                    tbl.userId.equals(userId) &
                    tbl.type.equals(HospitalVisitScheduleType.outpatient.index),
              )
              ..orderBy([(u) => OrderingTerm.desc(u.reservedAt)])
              ..limit(1))
            .getSingleOrNull()
      ]);

      final userPoint = results[0]! as UserPointModel;

      final hospitalVisitSchedule = results[1] as HospitalVisitScheduleModel?;

      final isOutpatient =
          hospitalVisitSchedule?.type == HospitalVisitScheduleType.outpatient;

      final isNeedToResetPoint =
          userPoint.hospitalVisitScheduleId != hospitalVisitSchedule?.id &&
              isOutpatient;

      await update(userPoints).write(
        UserPointsCompanion(
          hospitalVisitScheduleId:
              !isNeedToResetPoint || hospitalVisitSchedule == null
                  ? const Value.absent()
                  : Value(hospitalVisitSchedule.id),
          point: Value(
            isNeedToResetPoint ? 0 : userPoint.point,
          ),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  @override
  Future<List<PointHistoryModel>> getPointHistories({
    required String userId,
    required int? cursor,
  }) async =>
      (select(table)
            ..where(
              (tbl) =>
                  tbl.userId.equals(userId) &
                  (cursor == null
                      ? const Constant(true)
                      : tbl.createdAt.isSmallerThan(
                          Constant(
                            DateTime.fromMillisecondsSinceEpoch(cursor),
                          ),
                        )),
            )
            ..orderBy([
              (u) => OrderingTerm.desc(u.createdAt),
            ])
            ..limit(15))
          .get();
}
