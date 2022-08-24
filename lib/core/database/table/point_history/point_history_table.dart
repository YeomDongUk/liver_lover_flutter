// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

enum PointHistoryEvent {
  /// 복약완료
  medicationComplete(text: '복약완료'),

  /// 검진/외래 일정 등록
  hospitalVisitScheduleCreate(text: '외래/검진 일정 등록'),

  /// 걸사결과 등록
  examinationResultCreate(text: '검사결과 등록'),

  /// 설문 완료
  surveyComplete(text: '설문완료');

  const PointHistoryEvent({required this.text});
  final String text;
}

@DataClassName('PointHistoryModel')
class PointHistories extends UserReferenceTable {
  IntColumn get event => intEnum<PointHistoryEvent>()();
  IntColumn get point => integer()();
  TextColumn get forginId => text()();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {
          userId,
          event,
          forginId,
        }
      ];
}
