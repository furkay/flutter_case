import 'package:flutter/material.dart';
import 'package:flutter_case/view/recipes/extension/recipes_state_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('recipe page -> load error widget group', () {
    testWidgets('load error widget check', (tester) async {
      final key = UniqueKey();
      const errorText = 'Error Text';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RecipesLoadErrorWidget(
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
