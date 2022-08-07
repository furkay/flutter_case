import 'package:flutter/material.dart';
import 'package:flutter_case/view/recipes/extension/recipes_state_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('recipe page -> load progress widget group', () {
    testWidgets('load progress widget check', (tester) async {
      final key = UniqueKey();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecipesLoadProgressWidget(
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
