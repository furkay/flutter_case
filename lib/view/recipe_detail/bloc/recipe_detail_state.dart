part of 'recipe_detail_bloc.dart';

abstract class RecipeDetailState extends Equatable {
  const RecipeDetailState();

  @override
  List<Object?> get props => [];
}

class RecipeDetailInitial extends RecipeDetailState {}

class RecipeDetailLoadProgress extends RecipeDetailState {}

class RecipeDetailLoadError extends RecipeDetailState {
  final String error;
  const RecipeDetailLoadError(this.error);

  @override
  List<Object?> get props => [error];
}

class RecipeDetailLoadSucces extends RecipeDetailState {
  final RecipeDetail recipeDetailModel;
  const RecipeDetailLoadSucces(this.recipeDetailModel);

  @override
  List<Object?> get props => [recipeDetailModel];
}
