// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:yak/core/database/table/common_table.dart';

/// 약품 테이블
@DataClassName('PillModel')
class Pills extends CommonTable {
  TextColumn get entpName => text()();
  TextColumn get name => text()();
  TextColumn get material => text().nullable()();
  BlobColumn get image => blob().nullable()();
  TextColumn get effect => text().nullable()();
  TextColumn get useage => text().nullable()();
}
