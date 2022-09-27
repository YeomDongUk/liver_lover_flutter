// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/database/table/point_history/point_history_table.dart';
import 'package:yak/data/datasources/local/dao_mixin.dart';

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

  Stream<ExaminationResultModel> getLastExaminationResult({
    required String userId,
  });

  Future<List<ExaminationResultModel>> getExaminationResultHistories({
    required String userId,
    required bool isBloodTest,
  });
}

class ExaminationResultLocalDataSourceImpl extends DatabaseAccessor<AppDatabase>
    with DaoMixin
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
      transaction(
        () async {
          final result = await (select(table)
                ..where((tbl) => tbl.date.equals(companion.date.value)))
              .getSingleOrNull();

          if (result == null) {
            final resultModel = await into(table).insertReturning(companion);

            final userPoint = await (select(userPoints)
                  ..where((tbl) => tbl.userId.equals(userId)))
                .getSingle();

            await (update(userPoints)
                  ..where((tbl) => tbl.userId.equals(userId)))
                .write(
              UserPointsCompanion(
                point: Value(userPoint.point + 30),
                updatedAt: Value(DateTime.now()),
              ),
            );

            await into(pointHistories).insert(
              PointHistoriesCompanion.insert(
                userId: userId,
                event: PointHistoryEvent.examinationResultCreate,
                point: 30,
                forginId: resultModel.id,
                createdAt: Value(DateTime.now()),
                updatedAt: Value(DateTime.now()),
              ),
            );

            return resultModel;
          } else {
            await (update(table)..where((tbl) => tbl.id.equals(result.id)))
                .writeReturning(
              companion.copyWith(
                updatedAt: Value(DateTime.now()),
              ),
            );

            return (select(table)
                  ..where((tbl) => tbl.date.equals(companion.date.value)))
                .getSingle();
          }
        },
      );

  @override
  Stream<ExaminationResultModel> getLastExaminationResult({
    required String userId,
  }) =>
      (select(table)
            ..where((tbl) => tbl.userId.equals(userId))
            ..orderBy([
              (u) => OrderingTerm.desc(u.date),
            ]))
          .watch()
          .map(
        (examinationResultModels) {
          var examinationResultModel = ExaminationResultModel(
            id: 'id',
            userId: userId,
            date: DateTime.now(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          for (final model in examinationResultModels) {
            examinationResultModel = examinationResultModel.copyWith(
              platelet:
                  Value(examinationResultModel.platelet ?? model.platelet),
              ast: Value(examinationResultModel.ast ?? model.ast),
              alt: Value(examinationResultModel.alt ?? model.alt),
              ggt: Value(examinationResultModel.ggt ?? model.ggt),
              bilirubin:
                  Value(examinationResultModel.bilirubin ?? model.bilirubin),
              albumin: Value(examinationResultModel.albumin ?? model.albumin),
              afp: Value(examinationResultModel.afp ?? model.afp),
              hbvDna: Value(examinationResultModel.hbvDna ?? model.hbvDna),
              hcvRna: Value(examinationResultModel.hcvRna ?? model.hcvRna),
              benignTumor: Value(
                examinationResultModel.benignTumor ?? model.benignTumor,
              ),
              dangerousNodule: Value(
                examinationResultModel.dangerousNodule ?? model.dangerousNodule,
              ),
            );

            if (examinationResultModel.platelet != null &&
                examinationResultModel.ast != null &&
                examinationResultModel.alt != null &&
                examinationResultModel.ggt != null &&
                examinationResultModel.bilirubin != null &&
                examinationResultModel.albumin != null &&
                examinationResultModel.afp != null &&
                examinationResultModel.hbvDna != null &&
                examinationResultModel.hcvRna != null &&
                examinationResultModel.benignTumor != null &&
                examinationResultModel.dangerousNodule != null) {
              break;
            }
          }

          return examinationResultModel;
        },
      );

  @override
  Future<List<ExaminationResultModel>> getExaminationResultHistories({
    required String userId,
    required bool isBloodTest,
  }) =>
      (select(examinationResults)
            ..where(
              (t) =>
                  (isBloodTest
                      ? (t.platelet.isNotNull() |
                          t.ast.isNotNull() |
                          t.alt.isNotNull() |
                          t.ggt.isNotNull() |
                          t.bilirubin.isNotNull() |
                          t.albumin.isNotNull() |
                          t.afp.isNotNull() |
                          t.hbvDna.isNotNull() |
                          t.hcvRna.isNotNull())
                      : (t.benignTumor.isNotNull() |
                          t.dangerousNodule.isNotNull())) &
                  t.userId.equals(userId),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.date)])
            ..limit(6))
          .get();
}
