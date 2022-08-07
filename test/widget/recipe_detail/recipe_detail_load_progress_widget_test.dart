import 'package:flutter/material.dart';
import 'package:flutter_case/view/recipe_detail/extension/recipe_detail_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('recipe detail page -> load progress widget group', () {
    testWidgets('load progress widget check', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecipeDetailLoadProgressWidget(
            key: key,
          ),
        ),
      ));
      expect(find.byKey(key), findsOneWidget);
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
    });
  });
}
