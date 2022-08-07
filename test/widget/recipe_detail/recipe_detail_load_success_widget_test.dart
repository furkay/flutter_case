import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_case/data/model/business/ingredient/ingredient.dart';
import 'package:flutter_case/data/model/business/recipe_detail/recipe_detail.dart';
import 'package:flutter_case/view/recipe_detail/extension/recipe_detail_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  const recipeDetail =
      RecipeDetail(totalCost: 1.1, totalCostPerServing: 1.2, ingredients: [
    Ingredient(
        name: 'ingredient',
        price: 2.1,
        image: 'https://picsum.photos/seed/picsum/200/300'),
  ]);
  group('recipe detail page -> load success widget group', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('load success widget check', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecipeDetailLoadSuccesWidget(
            model: recipeDetail,
            key: key,
          ),
        ),
      ));

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text(recipeDetail.ingredients.first.price.toString()),
          findsOneWidget);
      expect(
          find.widgetWithImage(
            ListTile,
            NetworkImage(
                'https://spoonacular.com/cdn/ingredients_100x100/${recipeDetail.ingredients.first.image}'),
          ),
          findsOneWidget);

      expect(find.byType(ListTile),
          findsNWidgets(recipeDetail.ingredients.length));
    });
  });
}
