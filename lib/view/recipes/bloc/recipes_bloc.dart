import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/business/recipe/recipe.dart';
import '../../../data/repository/recipe_repository.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeRepository recipeRepository;
  RecipesBloc(this.recipeRepository) : super(RecipesInitial()) {
    on<RecipesLoaded>(_recipesLoaded);
    on<RecipesSearched>(_recipesSearched);
  }

  final List<Recipe> _recipes = [];

  Future<void> _recipesLoaded(
      RecipesLoaded event, Emitter<RecipesState> emit) async {
    emit(RecipesLoadProgress());
    try {
      final recipes = await recipeRepository.getRecipes();
      _recipes.addAll(recipes);
      emit(RecipesLoadSucces(recipes));
    } catch (e) {
      emit(RecipesLoadError(e.toString()));
    }
  }

  Future<void> _recipesSearched(
      RecipesSearched event, Emitter<RecipesState> emit) async {
    final searchText = event.text;

    emit(RecipesLoadProgress());
    try {
      final filteredList = _recipes
          .where(((element) =>
              element.title.toLowerCase().contains(searchText.toLowerCase())))
          .toList();

      emit(RecipesLoadSucces(filteredList));
    } catch (e) {
      emit(RecipesLoadError(e.toString()));
    }
  }
}
