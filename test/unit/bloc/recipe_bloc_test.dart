import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_case/data/model/business/recipe/recipe.dart';
import 'package:flutter_case/data/repository/recipe_repository.dart';
import 'package:flutter_case/view/recipes/bloc/recipes_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockRecipeModel extends Mock implements Recipe {}

void main() {
  const model = Recipe(id: 1, image: 'image', title: 'title', type: 'type');
  const model2 = Recipe(id: 2, image: 'image2', title: 'ti2', type: 'type2');
  group('recipesBloc test group', () {
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

    test('initial state check', () {
      final recipeBloc = RecipesBloc(repository);
      expect(recipeBloc.state, RecipesInitial());
    });

    blocTest<RecipesBloc, RecipesState>(
        'thrown-> exception,   expect(emit) -> [RecipesLoadProgress, RecipesLoadError]',
        setUp: () {
          when(() => repository.getRecipes())
              .thenThrow(Exception('Get Recipes Excepiton'));
        },
        build: () => RecipesBloc(repository),
        act: (bloc) => bloc.add(RecipesLoaded()),
        expect: () => {RecipesLoadProgress(), isA<RecipesLoadError>()});

    blocTest<RecipesBloc, RecipesState>(
        'get recipes-> recipes,    expect(emit) -> [loading, success]',
        setUp: () {
          when(() => repository.getRecipes()).thenAnswer((_) async => recipes);
        },
        build: () => RecipesBloc(repository),
        act: (bloc) => bloc.add(RecipesLoaded()),
        expect: () => {
              RecipesLoadProgress(),
              RecipesLoadSucces(recipes),
            });

    blocTest<RecipesBloc, RecipesState>(
        'get recipes-> recipes,    expect(emit) -> [loading, success] and check mocked data field',
        setUp: () {
          when(() => repository.getRecipes()).thenAnswer((_) async => recipes);
        },
        build: () => RecipesBloc(repository),
        act: (bloc) => bloc.add(RecipesLoaded()),
        expect: () => {
              RecipesLoadProgress(),
              isA<RecipesLoadSucces>().having(
                (state) => state.recipes.first,
                'first recipe',
                isA<Recipe>()
                    .having((recipe) => recipe.id, 'id check', model.id)
                    .having(
                        (recipe) => recipe.image, 'image check', model.image)
                    .having(
                        (recipe) => recipe.title, 'title check', model.title)
                    .having((recipe) => recipe.type, 'type check', model.type),
              )
            });
    blocTest<RecipesBloc, RecipesState>(
      'search first recipe-> recipe,    expect(emit) -> [loading, success, loading, success] and check mocked data field',
      setUp: () {
        when(() => repository.getRecipes()).thenAnswer((_) async => recipes);
      },
      build: () => RecipesBloc(repository),
      act: (bloc) => bloc
        ..add(RecipesLoaded())
        ..add(RecipesSearched(model.title.toLowerCase())),
      expect: () => [
        RecipesLoadProgress(),
        RecipesLoadSucces(recipes),
        RecipesLoadProgress(),
        RecipesLoadSucces([recipes.first]),
      ],
    );

    blocTest<RecipesBloc, RecipesState>(
      'search random text recipe-> recipe,    expect(emit) -> [loading, success, loading, success] and check mocked data field',
      setUp: () {
        when(() => repository.getRecipes()).thenAnswer((_) async => recipes);
      },
      build: () => RecipesBloc(repository),
      act: (bloc) => bloc
        ..add(RecipesLoaded())
        ..add(const RecipesSearched('doesntmatter')),
      expect: () => [
        RecipesLoadProgress(),
        RecipesLoadSucces(recipes),
        RecipesLoadProgress(),
        const RecipesLoadSucces([]),
      ],
    );
  });
}
