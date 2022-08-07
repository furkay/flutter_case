import 'dart:convert';

import 'package:flutter_case/data/model/business/ingredient/ingredient.dart';
import 'package:flutter_case/data/model/business/recipe_detail/recipe_detail.dart';
import 'package:flutter_case/data/model/entity/ingredient/ingredients_entity.dart';
import 'package:flutter_case/data/model/entity/recipe_detail/recipe_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ingredientEntity =
      IngredientEntity(name: 'name', image: 'image', price: 1.0);
  const recipeDetailEntity = RecipeDetailEntity(
      totalCost: 1.1,
      totalCostPerServing: 1.2,
      ingredients: [ingredientEntity]);
  const fakeData =
      '{"ingredients":[{"name":"cooked broccoli","image":"broccoli.jpg","price":40.04,"amount":{"metric":{"value":182,"unit":"g"},"us":{"value":2,"unit":"cups"}}},{"name":"raw cauliflower","image":"cauliflower.jpg","price":299,"amount":{"metric":{"value":1,"unit":"head"},"us":{"value":1,"unit":"head"}}},{"name":"coconut oil","image":"oil-coconut.jpg","price":1.56,"amount":{"metric":{"value":1,"unit":""},"us":{"value":1,"unit":""}}},{"name":"cooked brown rice","image":"rice-brown-cooked.png","price":62.68,"amount":{"metric":{"value":585,"unit":"g"},"us":{"value":3,"unit":"cups"}}},{"name":"garlic","image":"garlic.png","price":33.33,"amount":{"metric":{"value":5,"unit":"cloves"},"us":{"value":5,"unit":"cloves"}}},{"name":"low sodium soy sauce","image":"soy-sauce.jpg","price":48.81,"amount":{"metric":{"value":3,"unit":"Tbsps"},"us":{"value":3,"unit":"Tbsps"}}},{"name":"frozen peas","image":"peas.jpg","price":82.86,"amount":{"metric":{"value":145,"unit":"g"},"us":{"value":1,"unit":"cup"}}},{"name":"scallion","image":"spring-onions.jpg","price":31.68,"amount":{"metric":{"value":8,"unit":"servings"},"us":{"value":8,"unit":"servings"}}},{"name":"green dark scallions","image":"spring-onions.jpg","price":55.44,"amount":{"metric":{"value":7,"unit":""},"us":{"value":7,"unit":""}}},{"name":"sesame oil","image":"sesame-oil.png","price":21.66,"amount":{"metric":{"value":0.643,"unit":"tsps"},"us":{"value":0.643,"unit":"tsps"}}},{"name":"sesame seeds","image":"sesame-seeds.png","price":246.86,"amount":{"metric":{"value":8,"unit":"servings"},"us":{"value":8,"unit":"servings"}}}],"totalCost":923.92,"totalCostPerServing":115.49}';

  group('ingredient object scenarios', () {
    test('ingredient object field check', () {
      expect(ingredientEntity.image, 'image');
      expect(ingredientEntity.name, 'name');
      expect(ingredientEntity.price, 1.0);
      expect(ingredientEntity.toJson(), isA<Map>());
      expect(ingredientEntity.toJson(), {
        'name': 'name',
        'image': 'image',
        'price': 1,
      });
    });
  });

  group('recipe detail object scenarios', () {
    test('recipe detail object field check', () {
      expect(recipeDetailEntity.totalCost, 1.1);
      expect(recipeDetailEntity.totalCostPerServing, 1.2);
      expect(recipeDetailEntity.ingredients,
          const [IngredientEntity(name: 'name', image: 'image', price: 1)]);

      expect(recipeDetailEntity.toJson(), isA<Map>());
      expect(recipeDetailEntity.toJson(), {
        'totalCost': 1.1,
        'totalCostPerServing': 1.2,
        'ingredients': [
          {
            'name': 'name',
            'image': 'image',
            'price': 1.0,
          }
        ]
      });
    });

    test('json to model for nested object(ingredient)', () {
      final entity = RecipeDetailEntity.fromJson(jsonDecode(fakeData));
      expect(entity.ingredients.isNotEmpty, true);
    });

    test('recipe detail entity to recipe detail model', () {
      final recipeDetailEntity =
          RecipeDetailEntity.fromJson(jsonDecode(fakeData));
      final recipeDetailModel = RecipeDetail.fromEntity(recipeDetailEntity);
      expect(recipeDetailModel, isA<RecipeDetail>());
      expect(recipeDetailModel.ingredients, isA<List<Ingredient>>());
    });
  });
}
