// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:yak/data/models/pill/pill_api_model.dart';

abstract class PillRemoteDataSource {
  Future<List<PillApiModel>> findPills(String pillName);
}

class PillRemoteDataSourceImpl implements PillRemoteDataSource {
  PillRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PillApiModel>> findPills(String pillName) async {
    final response = await dio.get<Map<String, dynamic>>(
      'http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01?serviceKey=vFsA8BSDXJ%2FFR79%2By6MfZU9ejxyLYtruz9Ms%2F7dbjKXMuYbOFvi1Du0HsUWutw1VRgtEaSAD%2F8h9TFWANic3aw%3D%3D&item_name=$pillName&type=json',
    );

    return List<Map<String, dynamic>>.from(
      (response.data!['body'] as Map<String, dynamic>)['items'] as List,
    ).map(PillApiModel.fromJson).toList();
  }
}
