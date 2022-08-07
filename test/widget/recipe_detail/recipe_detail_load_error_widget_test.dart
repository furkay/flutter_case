import 'package:flutter/material.dart';
import 'package:flutter_case/view/recipe_detail/extension/recipe_detail_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('recipe detail page -> load error widget group', () {
    testWidgets('load error widget check', (tester) async {
      final key = UniqueKey();
      const errorText = 'Error Text';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecipeDetailLoadErrorWidget(
            key: key,
            error: errorText,
          ),
        ),
      ));
      expect(find.byKey(key), findsOneWidget);
      expect(
        find.byType(ErrorWidget),
        findsOneWidget,
      );
    });
  });
}
