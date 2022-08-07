import 'dart:convert';

import 'package:flutter_case/data/model/business/recipe/recipe.dart';
import 'package:flutter_case/data/model/entity/recipe/recipe_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const entity =
      RecipeEntity(id: 1, image: 'image', title: 'title', type: 'type');
  group('recipe model tests', () {
    test('recipe entity field check', () {
      expect(entity.id, 1);
      expect(entity.image, 'image');
      expect(entity.title, 'title');
      expect(entity.type, 'type');
      expect(entity.toJson(), isA<Map>());
      expect(entity.toJson(), {
        'id': 1,
        'image': 'image',
        'title': 'title',
        'type': 'type',
      });
    });

    test('recipe entity parsing check', () {
      const fakeData =
          '{"results":[{"id":716426,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"https://spoonacular.com/recipeImages/716426-312x231.jpg","imageType":"jpg"},{"id":715594,"title":"Homemade Garlic and Basil French Fries","image":"https://spoonacular.com/recipeImages/715594-312x231.jpg","imageType":"jpg"},{"id":715497,"title":"Berry Banana Breakfast Smoothie","image":"https://spoonacular.com/recipeImages/715497-312x231.jpg","imageType":"jpg"},{"id":644387,"title":"Garlicky Kale","image":"https://spoonacular.com/recipeImages/644387-312x231.jpg","imageType":"jpg"},{"id":716268,"title":"African Chicken Peanut Stew","image":"https://spoonacular.com/recipeImages/716268-312x231.jpg","imageType":"jpg"},{"id":716381,"title":"Nigerian Snail Stew","image":"https://spoonacular.com/recipeImages/716381-312x231.jpg","imageType":"jpg"},{"id":782601,"title":"Red Kidney Bean Jambalaya","image":"https://spoonacular.com/recipeImages/782601-312x231.jpg","imageType":"jpg"},{"id":794349,"title":"Broccoli and Chickpea Rice Salad","image":"https://spoonacular.com/recipeImages/794349-312x231.jpg","imageType":"jpg"},{"id":715446,"title":"Slow Cooker Beef Stew","image":"https://spoonacular.com/recipeImages/715446-312x231.jpg","imageType":"jpg"},{"id":715415,"title":"Red Lentil Soup with Chicken and Turnips","image":"https://spoonacular.com/recipeImages/715415-312x231.jpg","imageType":"jpg"}],"offset":0,"number":10,"totalResults":5219}';
      final mapping = jsonDecode(fakeData);
      final model = RecipeEntity.fromJson(mapping['results'].first);
      expect(model.id, 716426);
    });

    test('recipe entity to model check', () {
      final recipeModel = Recipe.fromEntity(entity);
      expect(recipeModel.id, 1);
      expect(recipeModel.image, 'image');
      expect(recipeModel.title, 'title');
      expect(recipeModel.type, 'type');
      expect(recipeModel.toEntity(), isA<RecipeEntity>());
      expect(recipeModel.id, recipeModel.toEntity().id);
    });
  });
}
