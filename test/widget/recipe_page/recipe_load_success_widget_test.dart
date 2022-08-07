import 'package:flutter/material.dart';
import 'package:flutter_case/data/model/business/recipe/recipe.dart';
import 'package:flutter_case/view/recipes/extension/recipes_state_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('recipe page -> load success widget group', () {
    const recipes = [
      Recipe(
          id: 1,
          title: 'Banana',
          image: 'https://picsum.photos/seed/picsum/200/300',
          type: 'banana_type'),
      Recipe(
          id: 2,
          title: 'Apple',
          image: 'https://picsum.photos/seed/picsum/200/300',
          type: 'apple_type'),
    ];

    testWidgets('load success widget check', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: RecipesLoadSuccessWidget(key: key, list: recipes)),
      ));
      expect(find.byKey(key), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(recipes.length));

      expect(find.text(recipes.first.title), findsOneWidget);

      expect(
          find.widgetWithText(ListTile, recipes.first.title), findsOneWidget);
    });
  });
}
