import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../constant/api_constant.dart';
import '../network/network_manager.dart';
import '../../data/repository/recipe_repository.dart';
import '../../data/service/recipe_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void init() {
  sl.registerFactory(() => NetworkDioManager(
          options: BaseOptions(
        baseUrl: dotenv.get('API_URL'),
        queryParameters: {ApiConstant.keyHeader: dotenv.get('API_KEY')},
      )));

  sl.registerLazySingleton(
      () => RecipeRepository(RecipeService(sl.get<NetworkDioManager>())));
}
