import 'package:dio/dio.dart';

import '../constant/request_type.dart';

abstract class INetworkManager {
  Future<Response<dynamic>> send(
    String path, {
    required RequestType method,
    String? urlSuffix,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Interceptors get dioInterceptors;
}
