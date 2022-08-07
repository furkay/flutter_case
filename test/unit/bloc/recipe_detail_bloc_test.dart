import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_case/data/model/business/recipe_detail/recipe_detail.dart';
import 'package:flutter_case/data/repository/recipe_repository.dart';
import 'package:flutter_case/view/recipe_detail/bloc/recipe_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockRecipeDetailModel extends Mock implements RecipeDetail {}

void main() {
  const id = 1;
  const model = RecipeDetail(
    ingredients: [],
    totalCost: 1.1,
    totalCostPerServing: 1.2,
  );

  group('recipeDetailBloc test group', () {
    late RecipeDetail recipeDetailModel;
    late RecipeRepository repository;
    setUp(() {
      repository = MockRecipeRepository();
      recipeDetailModel = MockRecipeDetailModel();
      when((() => recipeDetailModel.ingredients)).thenReturn(model.ingredients);
      when((() => recipeDetailModel.totalCost)).thenReturn(model.totalCost);
      when((() => recipeDetailModel.totalCostPerServing))
          .thenReturn(model.totalCostPerServing);

      when(() => repository.getRecipeDetail(1))
          .thenAnswer((_) async => recipeDetailModel);
    });

    test('initial state check', () {
      final recipeBloc = RecipeDetailBloc(repository, id);
      expect(recipeBloc.state, RecipeDetailInitial());
    });

    blocTest<RecipeDetailBloc, RecipeDetailState>(
        'thrown-> exception,   expect(emit) -> [RecipeDetailLoadProgress, RecipeDetailLoadError]',
        setUp: () {
          when(() => repository.getRecipeDetail(id))
              .thenThrow(Exception('Get Recipe detail Exception'));
        },
        build: () => RecipeDetailBloc(repository, id),
        act: (bloc) => bloc.add(const RecipeDetailLoaded()),
        expect: () => {
              RecipeDetailLoadProgress(),
              isA<RecipeDetailLoadError>(),
            });

    blocTest<RecipeDetailBloc, RecipeDetailState>(
        'get recipes-> recipes,    expect(emit) -> [loading, success]',
        setUp: () {
          when(() => repository.getRecipeDetail(id))
              .thenAnswer((_) async => model);
        },
        build: () => RecipeDetailBloc(repository, id),
        act: (bloc) => bloc.add(const RecipeDetailLoaded()),
        expect: () => {
              RecipeDetailLoadProgress(),
              const RecipeDetailLoadSucces(model),
            });

    blocTest<RecipeDetailBloc, RecipeDetailState>(
        'get recipes-> recipes,    expect(emit) -> [loading, success] and check mocked data field',
        setUp: () {
          when(() => repository.getRecipeDetail(id))
              .thenAnswer((_) async => model);
        },
        build: () => RecipeDetailBloc(repository, id),
        act: (bloc) => bloc.add(const RecipeDetailLoaded()),
        expect: () => {
              RecipeDetailLoadProgress(),
              isA<RecipeDetailLoadSucces>().having(
                (state) => state.recipeDetailModel,
                'recipe detail',
                isA<RecipeDetail>()
                    .having((recipe) => recipe.ingredients, 'ingredients check',
                        model.ingredients)
                    .having((recipe) => recipe.totalCost, 'image check',
                        model.totalCost)
                    .having((recipe) => recipe.totalCostPerServing,
                        'title check', model.totalCostPerServing),
              )
            });
  });
}
