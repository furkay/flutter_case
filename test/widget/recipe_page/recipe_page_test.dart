import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/data/model/business/recipe/recipe.dart';
import 'package:flutter_case/data/repository/recipe_repository.dart';
import 'package:flutter_case/view/recipes/bloc/recipes_bloc.dart';
import 'package:flutter_case/view/recipes/extension/recipes_state_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeBLoc extends MockBloc<RecipesEvent, RecipesState>
    implements RecipesBloc {}

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockRecipeModel extends Mock implements Recipe {}

void main() {
  const model = Recipe(id: 1, image: 'image', title: 'title', type: 'type');
  const model2 = Recipe(id: 2, image: 'image2', title: 'ti2', type: 'type2');
  group('bloc state widget group -> recipe page test', () {
    late List<Recipe> recipes;
    late RecipeRepository repository;

    setUp(() {
      recipes = [MockRecipeModel(), MockRecipeModel()];
      repository = MockRecipeRepository();

      when((() => recipes.first.id)).thenReturn(model.id);
      when((() => recipes.first.image)).thenReturn(model.image);
      when((() => recipes.first.title)).thenReturn(model.title);
      when((() => recipes.first.type)).thenReturn(model.type);
      when((() => recipes.last.id)).thenReturn(model2.id);
      when((() => recipes.last.image)).thenReturn(model2.image);
      when((() => recipes.last.title)).thenReturn(model2.title);
      when((() => recipes.last.type)).thenReturn(model2.type);

      when(() => repository.getRecipes()).thenAnswer((_) async => recipes);
    });

    testWidgets('bloc state widget check-> recipes load state', (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(RecipesLoadSucces(recipes));

      await tester.pumpWidget(
        BlocProvider<MockRecipeBLoc>(
          key: key,
          create: (context) => MockRecipeBLoc(),
          child: MaterialApp(
            home: Scaffold(body: testRecipe.state.widget),
          ),
        ),
      );
      expect(find.text(recipes.first.title), findsOneWidget);
      expect(find.text(recipes.last.title), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('bloc state widget check-> recipes load progress state',
        (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(RecipesLoadProgress());

      await tester.pumpWidget(
        BlocProvider<MockRecipeBLoc>(
          key: key,
          create: (context) => MockRecipeBLoc(),
          child: MaterialApp(
            home: Scaffold(body: testRecipe.state.widget),
          ),
        ),
      );
      // await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('bloc state widget check-> recipes load error state',
        (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(const RecipesLoadError('Exception'));

      await tester.pumpWidget(
        BlocProvider<MockRecipeBLoc>(
          key: key,
          create: (context) => MockRecipeBLoc(),
          child: MaterialApp(
            home: Scaffold(body: testRecipe.state.widget),
          ),
        ),
      );
      // await tester.pumpAndSettle();
      expect(find.byType(ErrorWidget), findsOneWidget);
    });
  });
}
