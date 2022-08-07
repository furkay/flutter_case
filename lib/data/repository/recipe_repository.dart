import '../../core/base/service/i_base_reposityory.dart';
import '../model/business/recipe/recipe.dart';
import '../model/business/recipe_detail/recipe_detail.dart';
import '../service/recipe_service.dart';

class RecipeRepository implements IBaseRepository {
  @override
  final RecipeService service;
  const RecipeRepository(this.service);

  Future<List<Recipe>> getRecipes() async {
    final recipeEntities = await service.getRecipes();
    return recipeEntities.map((recipe) => Recipe.fromEntity(recipe)).toList();
  }

  Future<RecipeDetail> getRecipeDetail(int id) async {
    final recipeDetail = await service.getRecipeDetail(id);
    return RecipeDetail.fromEntity(recipeDetail);
  }
}
