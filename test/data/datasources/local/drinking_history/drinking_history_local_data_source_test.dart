import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak/core/database/database.dart';
import 'package:yak/data/datasources/local/drinking_history/drinking_history_local_data_source.dart';

void main() {
  late final AppDatabase attachedDatabase;
  late final DrinkingHistoryLocalDataSourceImpl
      drinkingHistoryLocalDataSourceImpl;

  setUpAll(() async {
    attachedDatabase = AppDatabase(
      LazyDatabase(
        () => NativeDatabase.memory(logStatements: true),
      ),
    );

    drinkingHistoryLocalDataSourceImpl = DrinkingHistoryLocalDataSourceImpl(
      attachedDatabase,
    );
  });

  group('CURD TEST', () {
    test('조회', () async {
      final models =
          await drinkingHistoryLocalDataSourceImpl.getDrinkingHistories(
        userId: 'test',
        startAt: DateTime(2022, 7, 17),
        endAt: DateTime(2022, 7, 23),
      );

      expect(
        models,
        hasLength(0),
      );
    });
    test('생성', () async {
      final model =
          await drinkingHistoryLocalDataSourceImpl.upsertDrinkingHistory(
        userId: 'test',
        companion: DrinkingHistoriesCompanion.insert(
          userId: 'test',
          amount: 1000,
          date: DateTime(2022, 7, 17),
        ),
      );

      final model2 =
          await drinkingHistoryLocalDataSourceImpl.upsertDrinkingHistory(
        userId: 'test',
        companion: DrinkingHistoriesCompanion.insert(
          userId: 'test',
          amount: 1000,
          date: DateTime(2022, 7, 18),
        ),
      );

      expect(
        model,
        const TypeMatcher<DrinkingHistoryModel>()
            .having(
              (p0) => p0.date,
              '날짜',
              DateTime(2022, 7, 17),
            )
            .having(
              (p0) => p0.userId,
              '유저 ID',
              'test',
            )
            .having(
              (p0) => p0.amount,
              '양(밀리그램)',
              1000,
            ),
      );
      expect(
        model2,
        const TypeMatcher<DrinkingHistoryModel>()
            .having(
              (p0) => p0.date,
              '날짜',
              DateTime(2022, 7, 18),
            )
            .having(
              (p0) => p0.userId,
              '유저 ID',
              'test',
            )
            .having(
              (p0) => p0.amount,
              '양(밀리그램)',
              1000,
            ),
      );
    });

    test('조회', () async {
      final models =
          await drinkingHistoryLocalDataSourceImpl.getDrinkingHistories(
        userId: 'test',
        startAt: DateTime(2022, 7, 17),
        endAt: DateTime(2022, 7, 23),
      );

      expect(
        models,
        hasLength(2),
      );
    });

    test('수정', () async {
      final model =
          await drinkingHistoryLocalDataSourceImpl.upsertDrinkingHistory(
        userId: 'test',
        companion: DrinkingHistoriesCompanion(
          amount: const Value(1500),
          date: Value(DateTime(2022, 7, 17)),
        ).copyWith(userId: const Value('test')),
      );

      expect(
        model,
        const TypeMatcher<DrinkingHistoryModel>()
            .having(
              (p0) => p0.date,
              '날짜',
              DateTime(2022, 7, 17),
            )
            .having(
              (p0) => p0.userId,
              '유저 ID',
              'test',
            )
            .having(
              (p0) => p0.amount,
              '양(밀리그램)',
              1500,
            ),
      );
    });

    test('조회', () async {
      final models =
          await drinkingHistoryLocalDataSourceImpl.getDrinkingHistories(
        userId: 'test',
        startAt: DateTime(2022, 7, 17),
        endAt: DateTime(2022, 7, 23),
      );

      expect(
        models.first,
        const TypeMatcher<DrinkingHistoryModel>()
            .having(
              (p0) => p0.date,
              '날짜',
              DateTime(2022, 7, 17),
            )
            .having(
              (p0) => p0.userId,
              '유저 ID',
              'test',
            )
            .having(
              (p0) => p0.amount,
              '양(밀리그램)',
              1500,
            ),
      );
      expect(
        models[1],
        const TypeMatcher<DrinkingHistoryModel>()
            .having(
              (p0) => p0.date,
              '날짜',
              DateTime(2022, 7, 18),
            )
            .having(
              (p0) => p0.userId,
              '유저 ID',
              'test',
            )
            .having(
              (p0) => p0.amount,
              '양(밀리그램)',
              1000,
            ),
      );
      final averageOne =
          await drinkingHistoryLocalDataSourceImpl.getDrinkingHistoryAverage(
        id: models[0].id,
        userId: 'test',
      );

      expect(averageOne.average, 1500);

      final averageTwo =
          await drinkingHistoryLocalDataSourceImpl.getDrinkingHistoryAverage(
        id: models[1].id,
        userId: 'test',
      );

      expect(averageTwo.average, (1500 + 1000) / 2);
    });
  });
}
