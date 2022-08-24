// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:html/parser.dart' as parser;

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/data/models/pill/pill_api_model.dart';

abstract class PillRemoteDataSource {
  Future<List<PillSearchResult>> findPills(String pillName);
  Future<PillsCompanion> findPill(PillSearchResult pillSearchResult);
}

class PillRemoteDataSourceImpl implements PillRemoteDataSource {
  PillRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PillSearchResult>> findPills(String pillName) async {
    final response = await dio.get<Map<String, dynamic>>(
      'http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01?serviceKey=vFsA8BSDXJ%2FFR79%2By6MfZU9ejxyLYtruz9Ms%2F7dbjKXMuYbOFvi1Du0HsUWutw1VRgtEaSAD%2F8h9TFWANic3aw%3D%3D&item_name=$pillName&type=json',
    );

    final body = response.data!['body'] as Map<String, dynamic>;
    final items = List<Map<String, dynamic>>.from(body['items'] as List);

    return items.map(PillSearchResult.fromJson).toList();
  }

  @override
  Future<PillsCompanion> findPill(PillSearchResult pillSearchResult) async {
    final response = await dio.get<dynamic>(
      'https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=${pillSearchResult.id}',
    );
    Uint8List? imageBlob;
    final document = parser.parse(response.data);

    final effectNode = document.getElementById('_ee_doc');

    final effect = effectNode!.children.isEmpty
        ? effectNode.text
        : effectNode.children
            .map(
              (e) => e.children.isEmpty
                  ? e.text
                  : e.children.map((e) => e.text).join('\n'),
            )
            .join('\n');

    final useageNode = document.getElementById('_ud_doc');
    final useage = useageNode!.children.isEmpty
        ? useageNode.text
        : useageNode.children
            .map(
              (e) => e.children.isEmpty
                  ? e.text
                  : e.children.map((e) => e.text).join('\n'),
            )
            .join('\n');

    final materialNode = document.getElementById('scroll_02');
    final material = materialNode?.children
        .where((element) => element.className.contains('cont_title'))
        .map((e) => e.text)
        .join('\n');

    final imageNode = document
        .getElementsByClassName('pc-img')
        .firstOrNull
        ?.children
        .firstOrNull;

    if (imageNode != null) {
      final match = RegExp('"(.*?)"').firstMatch(imageNode.outerHtml);
      if ((match?.groupCount ?? 0) > 0) {
        final based64Image = match!.group(1)?.split(',').last;
        imageBlob = based64Image == null
            ? null
            : const Base64Decoder().convert(based64Image);
      }
    }

    return PillsCompanion.insert(
      id: Value(pillSearchResult.id),
      entpName: pillSearchResult.entpName,
      name: pillSearchResult.name,
      material: Value(material),
      image: Value(imageBlob),
      effect: Value(effect),
      useage: Value(useage),
    );
  }
}
