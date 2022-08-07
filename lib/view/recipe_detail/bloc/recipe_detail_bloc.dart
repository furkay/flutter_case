import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/business/recipe_detail/recipe_detail.dart';
import '../../../data/repository/recipe_repository.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final RecipeRepository recipeRepository;
  final int recipeId;
  RecipeDetailBloc(this.recipeRepository, this.recipeId)
      : super(RecipeDetailInitial()) {
    on<RecipeDetailLoaded>(__recipeDetailLoaded);
  }

  Future<void> __recipeDetailLoaded(
      RecipeDetailLoaded event, Emitter<RecipeDetailState> emit) async {
    emit(RecipeDetailLoadProgress());
    try {
      final recipeDetail = await recipeRepository.getRecipeDetail(recipeId);
      emit(RecipeDetailLoadSucces(recipeDetail));
    } catch (e) {
      emit(RecipeDetailLoadError(e.toString()));
    }
  }
}
