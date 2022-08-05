// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

/// 약품 테이블
@DataClassName('PillModel')
class Pills extends CommonTable {
  TextColumn get entpName => text()();
  TextColumn get name => text()();
  TextColumn get material => text()();
  TextColumn get imageUrl => text()();
  TextColumn get effect => text()();
  TextColumn get useage => text()();
}
