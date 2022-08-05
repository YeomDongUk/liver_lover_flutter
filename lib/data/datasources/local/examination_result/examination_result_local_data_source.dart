// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';

abstract class ExaminationResultLocalDataSource {
  Future<List<ExaminationResultModel>> getExaminationResults({
    required String userId,
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<ExaminationResultModel> upsertExaminationResult({
    required String userId,
    required ExaminationResultsCompanion companion,
  });
}

class ExaminationResultLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    implements ExaminationResultLocalDataSource {
  ExaminationResultLocalDataSourceImpl(super.attachedDatabase);

  late final table = attachedDatabase.examinationResults;

  @override
  Future<List<ExaminationResultModel>> getExaminationResults({
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
  Future<ExaminationResultModel> upsertExaminationResult({
    required String userId,
    required ExaminationResultsCompanion companion,
  }) =>
      into(table).insertReturning(
        companion,
        onConflict: DoUpdate(
          (old) => companion,
          target: [
            table.userId,
            table.date,
          ],
        ),
      );
}
