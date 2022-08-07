import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/data/model/business/ingredient/ingredient.dart';
import 'package:flutter_case/data/model/business/recipe_detail/recipe_detail.dart';
import 'package:flutter_case/data/repository/recipe_repository.dart';
import 'package:flutter_case/view/recipe_detail/bloc/recipe_detail_bloc.dart';
import 'package:flutter_case/view/recipe_detail/extension/recipe_detail_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeDetailBLoc
    extends MockBloc<RecipeDetailEvent, RecipeDetailState>
    implements RecipeDetailBloc {}

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockRecipeDetailModel extends Mock implements RecipeDetail {}

void main() {
  const id = 1;
  const ingredient = Ingredient(
    name: 'ingredient_name',
    price: 2.1,
    image: 'https://picsum.photos/seed/picsum/200/300',
  );
  const model = RecipeDetail(
    ingredients: [ingredient],
    totalCost: 1.1,
    totalCostPerServing: 1.2,
  );
  group('bloc state widget -> recipe detail page test', () {
    late RecipeDetail recipeDetail;
    late RecipeRepository repository;

    setUp(() {
      recipeDetail = MockRecipeDetailModel();
      repository = MockRecipeRepository();

      when((() => recipeDetail.ingredients)).thenReturn(model.ingredients);
      when((() => recipeDetail.totalCost)).thenReturn(model.totalCost);
      when((() => recipeDetail.totalCostPerServing))
          .thenReturn(model.totalCostPerServing);

      when(() => repository.getRecipeDetail(id))
          .thenAnswer((_) async => recipeDetail);
    });

    testWidgets('bloc state widget check -> recipe detail load state',
        (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeDetailBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(RecipeDetailLoadSucces(recipeDetail));

      await tester.pumpWidget(
        BlocProvider<MockRecipeDetailBLoc>(
          key: key,
          create: (context) => MockRecipeDetailBLoc(),
          child: MaterialApp(
            home: Scaffold(body: testRecipe.state.widget),
          ),
        ),
      );
      expect(find.text(recipeDetail.totalCost.toString()), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('bloc state widget check -> recipe detail load progress state',
        (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeDetailBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(RecipeDetailLoadProgress());

      await tester.pumpWidget(
        BlocProvider<MockRecipeDetailBLoc>(
          key: key,
          create: (context) => MockRecipeDetailBLoc(),
          child: MaterialApp(
            home: Scaffold(body: testRecipe.state.widget),
          ),
        ),
      );
      // await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('bloc state widget check -> recipe detail load error state',
        (tester) async {
      final key = UniqueKey();
      final testRecipe = MockRecipeDetailBLoc();
      when(
        () => testRecipe.state,
      ).thenReturn(const RecipeDetailLoadError('Exception'));

      await tester.pumpWidget(
        BlocProvider<MockRecipeDetailBLoc>(
          key: key,
          create: (context) => MockRecipeDetailBLoc(),
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
