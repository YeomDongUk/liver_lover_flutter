// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:yak/data/datasources/remote/pill/pill_remote_data_source.dart';
import 'package:yak/data/models/pill/pill_api_model.dart';

void main() {
  late final Dio dio;
  late final PillRemoteDataSourceImpl pillRemoteDataSourceImpl;
  setUpAll(() {
    dio = Dio();
    pillRemoteDataSourceImpl = PillRemoteDataSourceImpl(dio);
  });

  test('Scraping Web', () async {
    await pillRemoteDataSourceImpl.findPill(
      const PillSearchResult(
        id: '200003092',
        name: '헤어그로정1밀리그램(피나스테리드)',
        entpName: '한올바이오파마(주)',
      ),
    );
  });
}
