import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_case/core/constant/request_type.dart';
import 'package:flutter_case/core/network/network_manager.dart';
import 'package:flutter_case/data/model/entity/recipe/recipe_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_case/core/constant/api_constant.dart';

void main() {
  late String apiUrl;
  late String apiKey;
  setUpAll(() {
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
    apiUrl = dotenv.get('API_URL');
    apiKey = dotenv.get('API_KEY');
  });

  test('api available check request', () async {
    final value = await Dio(BaseOptions(baseUrl: apiUrl, queryParameters: {
      ApiConstant.keyHeader: apiKey,
    })).get(ApiConstant.recipesPath);
    expect(value.data != null, true);
  });

  test('get detail available test', () async {
    const id = '716426';
    final value = await Dio(BaseOptions(baseUrl: apiUrl, queryParameters: {
      ApiConstant.keyHeader: apiKey,
    })).get('/recipes/$id/priceBreakdownWidget.json');
    expect(value.data != null, true);
  });

  test('api available check request with network manager', () async {
    final value = await NetworkDioManager(
      options: BaseOptions(baseUrl: apiUrl),
    ).send(
      ApiConstant.recipesPath,
      method: RequestType.get,
      queryParameters: {
        ApiConstant.keyHeader: apiKey,
      },
    );
    final data = value.data['results'];
    List<RecipeEntity> list = [];
    if (data is List<dynamic>) {
      list = data.map((e) => RecipeEntity.fromJson(e)).toList();
    }

    expect(list.isNotEmpty, true);
  });
}
