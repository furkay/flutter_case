import '../../core/base/service/i_base_service.dart';
import '../../core/constant/api_constant.dart';
import '../../core/constant/request_type.dart';
import '../../core/exception/response_exception.dart';
import '../../core/network/network_manager.dart';
import '../model/entity/recipe/recipe_entity.dart';
import '../model/entity/recipe_detail/recipe_detail_entity.dart';

class RecipeService implements IBaseService {
  @override
  final NetworkDioManager networkManager;

  const RecipeService(this.networkManager);

  Future<List<RecipeEntity>> getRecipes() async {
    final response = await networkManager.send(
      ApiConstant.recipesPath,
      method: RequestType.get,
    );
    final responseData = response.data['results'];
    try {
      if (responseData != null && responseData is List) {
        final entities =
            responseData.map((e) => RecipeEntity.fromJson(e)).toList();
        return entities;
      } else {
        throw ResponseException(responseData);
      }
    } catch (e) {
      throw ResponseException(responseData);
    }
  }

  Future<RecipeDetailEntity> getRecipeDetail(int id) async {
    final response = await networkManager.send(
      ApiConstant.getDetailPath(id),
      method: RequestType.get,
    );
    final responseData = response.data;
    if (responseData != null && responseData is Map<String, dynamic>) {
      try {
        final entity = RecipeDetailEntity.fromJson(responseData);
        return entity;
      } catch (e) {
        throw ResponseException(e);
      }
    }
    throw ResponseException(response);
  }
}
