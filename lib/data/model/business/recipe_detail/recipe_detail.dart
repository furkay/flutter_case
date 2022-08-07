import '../../entity/recipe_detail/recipe_detail_entity.dart';
import '../ingredient/ingredient.dart';

class RecipeDetail {
  final List<Ingredient> ingredients;
  final double totalCost;
  final double totalCostPerServing;

  const RecipeDetail({
    required this.ingredients,
    required this.totalCost,
    required this.totalCostPerServing,
  });

  factory RecipeDetail.fromEntity(RecipeDetailEntity entity) {
    return RecipeDetail(
        ingredients:
            entity.ingredients.map((e) => Ingredient.fromEntity(e)).toList(),
        totalCost: entity.totalCost,
        totalCostPerServing: entity.totalCostPerServing);
  }

  RecipeDetailEntity toEntity() {
    return RecipeDetailEntity(
        ingredients: ingredients.map((e) => e.toEntity()).toList(),
        totalCost: totalCost,
        totalCostPerServing: totalCostPerServing);
  }
}
